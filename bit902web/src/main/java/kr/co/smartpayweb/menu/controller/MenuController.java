package kr.co.smartpayweb.menu.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.smartpayweb.menu.service.MenuService;
import kr.co.smartpayweb.repository.vo.MenuVO;
import kr.co.smartpayweb.repository.vo.SellerVO;
import kr.co.smartpayweb.repository.vo.StoreFileVO;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	MenuService service;
	
	
	@ResponseBody
	@RequestMapping("/list.do")
	public Map<String, Object> list(HttpSession session) throws Exception {
		
		SellerVO seller = (SellerVO)session.getAttribute("seller");
		int sellerNo = seller.getSellerNo();
		System.out.println("컨트롤러셀러넘버:" + sellerNo);
		
		return service.list(sellerNo);
	}
	
	@RequestMapping("/write.do")
	public String write(MultipartHttpServletRequest mRequest, RedirectAttributes attr,HttpSession session) throws Exception{
		
		Map<String, Object> param = new HashMap<>();
		ServletContext context = mRequest.getServletContext();
		
	
		String path = context.getRealPath("/upload");
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String datePath = sdf.format(new Date());
		
		String savePath = path + datePath;
		File f = new File(savePath);
		if (!f.exists()) f.mkdirs();
		
		SellerVO seller = (SellerVO)session.getAttribute("seller");
		int sellerNo = seller.getSellerNo();
		// 게시판과 파일 테이블에 저장할 글번호를 조회
		MenuVO menu = new MenuVO();
		menu.setName(mRequest.getParameter("menuName"));
		menu.setContent(mRequest.getParameter("content"));
		menu.setPrice(Integer.parseInt(mRequest.getParameter("price")));
		menu.setSize(mRequest.getParameter("size"));
		menu.setState(mRequest.getParameter("state"));
		menu.setSellerNo(sellerNo);
		
		System.out.println(mRequest.getParameter("menuName"));
		System.out.println(mRequest.getParameter("content"));
		System.out.println(Integer.parseInt(mRequest.getParameter("price")));
		System.out.println(mRequest.getParameter("size"));
		System.out.println(sellerNo);
		param.put("menu", menu);
	
		MultipartFile file = mRequest.getFile("attachFile");
		String oriName = file.getOriginalFilename();
		
		if (oriName != null && !oriName.equals("")) {
			// 확장자 처리
			String ext = "";
			// 뒤쪽에 있는 . 의 위치 
			int index = oriName.lastIndexOf(".");
			if (index != -1) {
				// 파일명에서 확장자명(.포함)을 추출
				ext = oriName.substring(index);
			}
			// 파일 사이즈
			long fileSize = file.getSize();
			System.out.println("파일 사이즈 : " + fileSize);
			// 고유한 파일명 만들기	
			String systemName = "menu-" + UUID.randomUUID().toString() + ext;
			System.out.println("저장할 파일명 : " + systemName);
			// 임시저장된 파일을 원하는 경로에 저장
			file.transferTo(new File(savePath + "/" + systemName));
			StoreFileVO menuFile = new StoreFileVO();
			menuFile.setOriName(oriName);
			menuFile.setSystemName(systemName);
			menuFile.setFilePath(datePath);
			menuFile.setFileSize(fileSize);
			menuFile.setSellerNo(sellerNo);
			param.put("menuFile",menuFile);
			
		}
		
		service.write(param);
		attr.addFlashAttribute("msg", "게시물이 등록되었습니다");
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/delete.do")
	public String delete(HttpServletRequest request, HttpSession session) throws Exception {
				
		int menuNo = Integer.parseInt(request.getParameter("menuNo"));
		service.delete(menuNo);
		return "redirect:list.do";
	}

	@ResponseBody
	@RequestMapping("/updateForm.do")
	public Map<String, Object> updateForm(HttpServletRequest request, HttpSession session) throws Exception {
		System.out.println("컨트롤러1");
		int menuNo = Integer.parseInt(request.getParameter("menuNo"));
		System.out.println(menuNo);
		
		return service.updateForm(menuNo);
	}
	
	@RequestMapping("/update.do")
	public String menuUpdate(MenuVO menu) throws Exception{
		service.menuUpdate(menu);
		return "redirect:/view/menu/list.jsp";
	}
}


