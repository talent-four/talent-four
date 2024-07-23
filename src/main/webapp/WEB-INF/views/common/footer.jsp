<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <footer class="footer">
        <div id="chat-box" hidden>
            <div id="chat-id">
                <div id="chat-close">&times;</div>
                <input type="text" placeholder=" 상대 ID" id="chatTo">
                <button id="chatToBtn">대화하기</button>
                <div id="myPartner">현재 대화중인 상대: {얘}</div>
            </div>
            <div id="chat-message">
                <div id="chat-tobox">
                    <div id="chat-to">안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??안녕??</div>
                </div>
                <div id="chat-frombox">
                    <div id="chat-from">상대임상대임상대임상대임상대임상대임상대임상대임상대임상대임상대임상대임상대임상대임상대임상대임상대임상대임상대임상대임상대임상대임상대임상대임상대임상대임</div>
                </div>
                <div id="chat-tobox">
                    <div id="chat-to">안녕??</div>
                </div>
                <div id="chat-frombox">
                    <div id="chat-from">상대임</div>
                </div>
                <div id="chat-tobox">
                    <div id="chat-to">안녕??</div>
                </div>
                <div id="chat-frombox">
                    <div id="chat-from">상대임</div>
                </div>
            </div>
            <div id="chat-input">
                <textarea name="chatTextArea" id="chatContent"></textarea>
                <button id="sendChat">전송</button>
            </div>
        </div>

        <button class="callServiceCenter" id="chatBtn"><i class="fa-solid fa-headset"></i></button> 
        <p>통신판매 신고번호 : 1234-서울강남-12345<br>
            상호 : 재능사조<br>
            주소 : 서울특별시 강남구 역삼역<br>
            고객센터 : 1234-1234 <br>

            (주) 재능사조는 통신판개중개자로서 거래 당사자가 아니므로, 튜터가 등록한 상품정보를 책임지지 않습니다.<br>
            Copyright @ 2024 Inc. All rights reserved.</p>

        <script>
            const contextPath = "${contextPath}";
            const chatIcon = document.querySelector("#chatBtn");
            const chatClose = document.querySelector("#chat-close");
            const chatBox=document.querySelector("#chat-box");
            const chatToBtn=document.querySelector("#chatToBtn");


            let websocket = new WebSocket(`ws://localhost:8080/${contextPath}/chat/end?clientId=${loginMember.memberNo}`)
            
            chatIcon.addEventListener("click", () => {
                chatIcon.hidden=true;
                chatBox.hidden=false;
            
                websocket.onopen = ()=>{
                };

            });

            chatClose.addEventListener("click", ()=>{
                chatIcon.hidden=false;
                chatBox.hidden=true;
            });

            chatToBtn.addEventListener("click", ()=>{

                let toId = document.querySelector("#chatTo").value;
                

                $.ajax({

                    url : contextPath + "/chat",
                    type: "POST",
                    data:{
                        "toId" : toId
                    },
                    success(res){
                        const result = JSON.parse(res);
                        console.log(result);
                        
                        result.forEach((chat)=>{
                            
                        });


                        document.querySelector("#chat-message").insertAdjacentHTML("afterbegin",

                        );
                    },
                    error(){

                    }
                })

                toId="";
            });


        </script>
        
            <c:if test="${!empty sessionScope.message}">
                <script>
                    alert("${message}");

                </script>

                <c:remove var="message" scope="session"></c:remove>

            </c:if>
    </footer>