(function(){

    const freeBtn = document.getElementById("freeBtn");

    freeBtn.addEventListener("click",function(){
        let url = "wonder/free"; 
        location.href=url;

    })

})();

(function(){
    const classBtn = document.getElementById("classBtn");

    classBtn.addEventListener("click",function(){
        let url = "wonder/class"; 
        location.href=url;
    })

})();

// 강의가 궁금해요 리스트
function selectFreeList(){}

$(document).ready(function() {


    // 각 데이터를 기반으로 HTML 요소를 동적으로 생성하여 화면에 추가합니다.
    freeList.forEach(function(board) {
        var html = `
            <div class="wonder-notice">
                <h2>${board.boardTitle} <span class="notice-st">${board.qaStatus}</span></h2>
                <p>${board.boardContent}</p>
                <div class="wonder-Tag">
                    <span>SQL</span> <!-- 추후에 실제 태그 내용으로 대체할 수 있습니다 -->
                </div>
                <div class="wonder-count">
                    <span>${board.memberNickname}</span>
                    <span>${board.createDate}</span>
                    <ul>
                        <li>${board.createDate}</li>
                        <li>추천수 0</li>
                        <li>답변수 0</li>
                    </ul>
                </div>
            </div>  `;
        
            $('.wonder-section2').append(html);
    });
});

//자유게시판 검색
(document).ready(function() {
 
    $('#woder-serachBtn').click(function(e) {
        e.preventDefault(); 
        
        var searchQuery = $('#wonder-search').val().trim();
     
        $.ajax({
            type: 'GET',
            url: 'searchServlet', 
            data: { query: searchQuery }, 
            dataType: 'html',
            success: function(response) {
                $('.wonder-section2').html(response); 
            },
            error: function(xhr, status, error) {
                console.error('Error: ' + error);
            }
        });
    });
    
    $('.wonder-restBtn').click(function(e) {
        e.preventDefault(); // 폼 제출 방지
        
        $('#wonder-search').val('');
        
    });
});