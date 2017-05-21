package kr.co.smartpayapp.notification;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.smartpayapp.home.service.HomeService;
import kr.co.smartpayapp.repository.vo.EventVO;

@RestController
@RequestMapping("/notification")
@CrossOrigin(origins = "*")
public class NotificationController {
	@Autowired
	private HomeService homeService;
    /**
     * Replace SERVER_KEY with your SERVER_KEY generated from FCM
     * Replace DEVICE_TOKEN with your DEVICE_TOKEN
     */
    private static String SERVER_KEY = " ";
    private static String DEVICE_TOKEN ;
    
    /**
     * USE THIS METHOD to send push notification
     */
    @RequestMapping("/push.do")
	public void pushToFCM(@RequestBody EventVO eventVO) throws Exception {
    	
    	DEVICE_TOKEN = eventVO.getToken();
    	
    	EventVO event = homeService.readEvent(eventVO.getSellerNo());
    	String title = event.getEventTitle();
    	String message = event.getEventContent();
    	String storeName = event.getStoreName();
    	String filePath = event.getFilePath() + "/" + event.getSystemName();
    	sendPushNotification(title, message, filePath, storeName);
	}

    /**
     * Sends notification to mobile, YOU DON'T NEED TO UNDERSTAND THIS METHOD
     */
    private static void sendPushNotification(String title, String message, String filePath, String storeName) throws Exception {
        String pushMessage = "{\"data\":{\"title\":\"" +
                title +
                "\",\"filePath\":\"" +
                filePath +
                "\",\"storeName\":\"" +
                storeName +
                "\",\"message\":\"" +
                message +
                "\"},\"to\":\"" +
                DEVICE_TOKEN +
                "\"}";
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
