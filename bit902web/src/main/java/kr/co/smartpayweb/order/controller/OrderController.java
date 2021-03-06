package kr.co.smartpayweb.order.controller;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.smartpayweb.order.service.OrderService;
import kr.co.smartpayweb.repository.vo.OrderVO;
import kr.co.smartpayweb.repository.vo.SellerVO;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	OrderService orderService;
	
    private static String SERVER_KEY = " ";
    private static String DEVICE_TOKEN ;
    
	// ---- orderList 조회 ----
	@RequestMapping("/state.do")
	@ResponseBody
	public ModelAndView retrieveOreder(HttpSession session) throws Exception {
		
		SellerVO seller = (SellerVO)session.getAttribute("seller");
		int sellerNo =  seller.getSellerNo();
		
		// ---- storeName 조회 ----
		String storeName = orderService.selectName(sellerNo);
		
		List<OrderVO> orderList = orderService.retrieveOreder(sellerNo);
		for (int i = 0 ; i < orderList.size() ; i++) {
			OrderVO orderVO = orderList.get(i);
			orderVO.setOrderMenuList(orderService.RetrieveOrderMenuList(orderVO.getOrderNo()));
		}
		
		ModelAndView mav = new ModelAndView("order/order");
		mav.addObject("storeName", storeName);
		mav.addObject("orderList", orderList);
		return mav;
	}
	
	// ---- 접수 확인 ----
	@RequestMapping("/receive.do")
	public String receiveOrder(OrderVO orderVO) throws Exception {
		
		int receiveNo = orderVO.getOrderNo();
		orderService.receiveOrder(receiveNo);
		
		DEVICE_TOKEN = orderVO.getDeviceToken();
    	
    	String title = orderVO.getOrderContent();
    	String message = orderVO.getOrderContent();
    	sendPushNotification(title, message);
    	
    	return "redirect:state.do";
	}
	
	// ---- 조리 완료 ----
	@RequestMapping("/complete.do")
	public String completeOrder(OrderVO orderVO) throws Exception {
		
		int completeNo = orderVO.getOrderNo();
		orderService.completeOrder(completeNo);
		
		DEVICE_TOKEN = orderVO.getDeviceToken();
		
		String title = orderVO.getOrderContent();
    	String message = orderVO.getOrderContent();
    	sendPushNotification(title, message);
    	
    	return "redirect:state.do";
	}
	
	// ---- 구글 푸시 유틸 ----
    private static void sendPushNotification(String title, String message) throws Exception {
    	String pushMessage = "{\"data\":{\"title\":\"" + title + "\",\"message\":\"" + message + "\"},\"to\":\"" + DEVICE_TOKEN + "\"}";
        // Create connection to send FCM Message request.
        URL url = new URL("https://fcm.googleapis.com/fcm/send");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestProperty("Authorization", "key=" + SERVER_KEY);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);

        // Send FCM message content.
        OutputStream outputStream = conn.getOutputStream();
        outputStream.write(pushMessage.getBytes());

        System.out.println(conn.getResponseCode());
        System.out.println(conn.getResponseMessage());
    }
}
