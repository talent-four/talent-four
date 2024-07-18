package talentFour.classes.controller;

import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

import talentFour.classes.controller.vo.Message;



@ServerEndpoint("/chat/end")
public class ChatEndPoint {

    private static Map<String, Session> sessions = new ConcurrentHashMap<>();
   
    @OnOpen
    public void onOpen(Session session) {
        String query = session.getQueryString();
        String clientId = getClientIdFromQuery(query);
        
        
        System.out.println("쿼리는 : "+query);
        System.out.println("클라이언트 ID는 : " + clientId);
        System.out.println(session);
        System.out.println(session.getId());

        try {
           if (clientId != null) {
               sessions.put(clientId, session);
               System.out.println("클라이언트 연결: " + clientId);
           } else {
               session.close();
           }
        
        } catch(Exception e) {
           e.printStackTrace();
        }
    }

    @OnMessage
    public String onMessage(String message, Session session) {
        System.out.println("Received message: " + message);

        


        
        try {
           Gson gson = new Gson();
           Message msg = gson.fromJson(message, Message.class);
           System.out.println(msg);
           
//          나를 뺀 전원에게 메시지 보내기           
//           for (Session ses : sessions.values()) {
//              if(ses==session) {
//                 
//              }else {
//                 ses.getBasicRemote().sendText(message);
//              }
//           }
           
           // 특정 유저에게 메세지 보내기
//           sessions.get(msg.getToId()).getBasicRemote().sendText(msg.getMessage());
           
           
           if(sessions.get(msg.getToId())==null) {
        	   // sql을 통해서 메시지 저장
        	   
           } else { // 상대 유저 접속중
        	// 특정 유저에게 메세지 보내기 (보낸 사람 포함)
               sessions.get(msg.getToId()).getBasicRemote().sendText(gson.toJson(msg)); 

           }
           // 보낸사람에게도 메시지 전송
           sessions.get(msg.getFromId()).getBasicRemote().sendText(gson.toJson(msg));
 
           
        } catch(Exception e) {
           e.printStackTrace();
        }
//        "backend: " + message 처리하면 onmessage 메소드에 대한 리턴값으로 감
        // '내가 보낸 메시지 : ㅁㅁㅁ' 가 리턴값으로 들어가야함
        return null;
    }

    @OnClose
    public void onClose(Session session) {
        System.out.println("Session closed, id: " + session.getId());
    }
   
    private String getClientIdFromQuery(String query) {
        if (query != null) {
            String[] params = query.split("&");
            for (String param : params) {
                String[] keyValue = param.split("=");
                if (keyValue.length == 2 && "clientId".equals(keyValue[0])) {
                    return keyValue[1];
                }
            }
        }
        return null;
    }
    
    public void sendMessageToClient(String clientId, String message) throws Exception {
        Session session = sessions.get(clientId);
        if (session != null && session.isOpen()) {
            session.getBasicRemote().sendText(message);
        }
    }
    
}

