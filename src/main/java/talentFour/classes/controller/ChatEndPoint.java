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
import talentFour.common.Util;
import talentFour.member.model.service.MemberService;



@ServerEndpoint("/chat/end")
public class ChatEndPoint {

    private static Map<String, Session> sessions = new ConcurrentHashMap<>();
   
    @OnOpen
    public void onOpen(Session session) {
        String query = session.getQueryString();
        String clientId = Util.getClientIdFromQuery(query);
        
        
        
        
        try {
           if (clientId != null) {
               sessions.put(clientId, session);
           } 
           else {
               session.close();
           }
        
        } catch(Exception e) {
           e.printStackTrace();
        }
        
        
    }

    @OnMessage
    public String onMessage(String message, Session session) {

        
        try {
           Gson gson = new Gson();
           Message msg = gson.fromJson(message, Message.class);
           System.out.println("msg.getToId" + msg.getToId());
           // 홍길동1의 memberNo가 몇인지 DB조회를 통해 얻어온다
           
           MemberService service = new MemberService();
           int memberNo=service.searchMemberNo(msg.getToId());
           System.out.println(sessions.values());
           System.out.println("멤버 번호"+memberNo);
           msg.setToId(String.valueOf(memberNo));

           
           int result = service.insertChatting(msg);
           
           if(result>0) {
        	   System.out.println("db에 메세지 무사히 넣었음");
           } else {
        	   System.out.println("db에 메세지 못넣었음");
           }
           // 받는 사람이 접속중이지 않다면(msg.getToId()) 
           if(sessions.get(msg.getToId())==null) {
        	   //메시지를 보내지 않는다.
        	   
           } else { // 상대 유저 접속중
        	   // 메세지를 보낸다
               sessions.get(msg.getToId()).getBasicRemote().sendText(gson.toJson(msg)); 

           }
           
           
           
           // 보낸사람에게도 메시지 전송
//           sessions.get(msg.getFromId()).getBasicRemote().sendText(gson.toJson(msg));
 
           
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
    
    public void sendMessageToClient(String clientId, String message) throws Exception {
        Session session = sessions.get(clientId);
        if (session != null && session.isOpen()) {
            session.getBasicRemote().sendText(message);
        }
    }
    
}
//나를 뺀 전원에게 메시지 보내기           
//for (Session ses : sessions.values()) {
// if(ses==session) {
//    
// }else {
//    ses.getBasicRemote().sendText(message);
// }
//}
