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

const board = {
    boardTitle: "Board Example Title",
    qaStatus: "y" 
};

function setBoardTitleAndStatus(board) {
    const boardTitleElement = document.getElementById("boardTitle");
    const statusText = board.qaStatus === "y" ? "해결" : "미해결";
    const statusClass = board.qaStatus === "y" ? "notice-st" : "notice-st2";

    boardTitleElement.innerHTML = `${board.boardTitle} <span class="${statusClass}" id="noticeSt">${statusText}</span>`;
}

setBoardTitleAndStatus(board);





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