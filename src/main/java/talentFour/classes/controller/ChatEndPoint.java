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

import talentFour.classes.model.vo.Message;



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

        // sql에서 
        // SELECT CHAT_ROOM FROM CHATTING WHERE CHAT_FROM = clientId OR CHAT_TO = clientId
        // 이후 CHAT_ROOM을 받아와서
        // SELECT CHAT_MESSAGE, CHAT_FROM , CHAT_TO FROM CHATTING WHERE CHAT_ROOM = ? 
        // 을 통해서 채팅방에 대한 정보를 받아옴
        // 대화 RS를 리스트로 받아온 다음,
        // CLIENTID와 LOGINMEMBER이 일치하면 우측, 다르면 좌측에 메시지를 배치하는 화면을 구성한다.
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
           
           
           
           //  CHAT_FROM/CHAT_TO msg.getToId() / msg.getFromId() 넣어 DB에 INSERT시킨다.
           //
           
           // 받는 사람이 접속중이지 않다면(msg.getToId()) 
           if(sessions.get(msg.getToId())==null) {
        	   //메시지를 보내지 않는다.
        	   
           } else { // 상대 유저 접속중
        	   // 메세지를 보낸다 (보낸 사람 포함)
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

