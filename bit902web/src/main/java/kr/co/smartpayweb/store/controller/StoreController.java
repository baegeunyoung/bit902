package kr.co.smartpayweb.store.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.smartpayweb.repository.vo.SellerVO;
import kr.co.smartpayweb.repository.vo.StoreFileVO;
import kr.co.smartpayweb.repository.vo.StoreVO;
import kr.co.smartpayweb.store.service.StoreService;


@Controller
@RequestMapping("/store")
public class StoreController {

	@Autowired
	StoreService service;

	@RequestMapping("/write.do")
	public String write(MultipartHttpServletRequest mRequest, RedirectAttributes attr, HttpSession session) throws Exception{
		
		
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
		System.out.println("컨트롤러셀러넘버:" + sellerNo);
		// 게시판과 파일 테이블에 저장할 글번호를 조회
		StoreVO store = new StoreVO();
		store.setName(mRequest.getParameter("storeName"));
		store.setContent(mRequest.getParameter("content"));
		store.setStoreType(Integer.parseInt(mRequest.getParameter("storeType")));
		store.setAdress(mRequest.getParameter("adress"));
		store.setLatitude(Double.parseDouble(mRequest.getParameter("lat")));
		store.setLongitude(Double.parseDouble(mRequest.getParameter("lng")));
		store.setSellerNo(sellerNo);

		param.put("store", store);
				

		MultipartFile  file = mRequest.getFile("attachFile");
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
			String systemName = "mlec-" + UUID.randomUUID().toString() + ext;
			System.out.println("저장할 파일명 : " + systemName);
		
			// 임시저장된 파일을 원하는 경로에 저장
			file.transferTo(new File(savePath + "/" + systemName));
			StoreFileVO storeFile = new StoreFileVO();
			storeFile.setOriName(oriName);
			storeFile.setSystemName(systemName);
			storeFile.setFilePath(datePath);
			storeFile.setFileSize(fileSize);
			storeFile.setSellerNo(sellerNo);
			param.put("storeFile",storeFile);
			
		}
		service.write(param);
		
		attr.addFlashAttribute("msg", "게시물이 등록되었습니다");
		return "/menu/list";
	}

	// 이벤트 읽기
	@RequestMapping("/storeread.do")
	public void storeRead(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		SellerVO seller = (SellerVO)session.getAttribute("seller");
		int sellerNo = seller.getSellerNo();
		
		StoreVO store =service.readStore(sellerNo);
		if(request.getParameter("msg") != null) {
			request.setAttribute("msg", request.getParameter("msg"));
		}
		request.setAttribute("store", store);
		RequestDispatcher rd = request.getRequestDispatcher("/view/store/writeform.jsp");
		rd.forward(request, response);
	}

	// 이벤트 삭제하기
	@RequestMapping("/modify.do")
	public void eventModify(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		StoreVO store = new StoreVO();
		SellerVO seller = (SellerVO)session.getAttribute("seller");
		int sellerNo = seller.getSellerNo();
		store.setName(request.getParameter("storeName"));
		store.setContent(request.getParameter("content"));
		store.setStoreType(Integer.parseInt(request.getParameter("storeType")));
		store.setAdress(request.getParameter("adress"));
		store.setLatitude(Double.parseDouble(request.getParameter("latitude")));
		System.out.println(Double.parseDouble(request.getParameter("latitude")));
		store.setLongitude(Double.parseDouble(request.getParameter("longitude")));
		store.setSellerNo(sellerNo);
		
		service.storetModify(store);
		
		RequestDispatcher rd = request.getRequestDispatcher("/store/storeread.do");
		rd.forward(request, response);
	}	
}
