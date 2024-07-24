
const apiKey = "AIzaSyADJBu6bdT_l2VfcxuX9x_YNtm-vWJicuA";

// 예시데이터
// 정처기 : PL6i7rGeEmTvoea5d4Xr_Awhi_ES5GvkBA - 재생목록 53개, 리스트는 50개
// 정처기 필기 : PL6i7rGeEmTvqEjTJF3PJR4a1N9KTPpfw0 - 재생목록 8개

const testList1 = "PL6i7rGeEmTvoea5d4Xr_Awhi_ES5GvkBA";
const testList2 = "PL6i7rGeEmTvqEjTJF3PJR4a1N9KTPpfw0";
// const testVid = "yxgu4o41us4";
const testVid = "MGGBVVz8Iws";

const partSnippet = "snippet";
const partContentDetails = "contentDetails";

const youtubeUrl = "https://www.youtube.com/embed/";

const getList = `https://www.googleapis.com/youtube/v3/playlistItems?part=${partSnippet},${partContentDetails}&maxResults=50&status=&playlistId=${testList1}&key=${apiKey}`;
const getPlaylists = `https://www.googleapis.com/youtube/v3/playlists?part=${partSnippet},${partContentDetails}&id=${testList1}&maxResults=50&key=${apiKey}`;
//  'https://youtube.googleapis.com/youtube/v3/playlists?part=snippet%2CcontentDetails&id=PL6i7rGeEmTvoea5d4Xr_Awhi_ES5GvkBA&key=[YOUR_API_KEY]' \
const getVid = `https://www.googleapis.com/youtube/v3/videos?part=${partSnippet}&id=${testVid}&key=${apiKey}`;
const getListVideo = `https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet%2CcontentDetails&playlistId=${testList1}&videoId=${testVid}&key=${apiKey}`;

const playlistItemsUrl = `https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=200&playlistId=${testList1}&key=${apiKey}`;


const videoBox = document.getElementById("video");
const subClassScroll = document.getElementById("subClassScroll");


// 시작시, 맨 처음 화면 만들기
(function(){
  subClassScroll.innerHTML = "";
  $.ajax ({
    url : playlistItemsUrl,
    success : function(res){
      console.log(res);
      // res의 items들에 대해 반복(for문 대체)
      res.items.forEach((item, index) => {
        const a = document.createElement("a");
        a.innerText = item.snippet.title;
        a.classList.add("subClass");
      
        // a에 클릭시 이벤트 추가
        a.addEventListener('click', function() {

          // 클릭된 index를 기준으로, 동영상 가져오기
          var videoId = res.items[index].snippet.resourceId.videoId;
          changeVideo(videoId);
        });
      
        // 생성한 링크 요소를 부모 요소에 추가합니다.
        subClassScroll.appendChild(a);
      });

      // 초기값, 0번째 index
      var videoId = res.items[0].snippet.resourceId.videoId;
      videoBox.src = `https://www.youtube.com/embed/${videoId}?autoplay=1&rel=0`;
    },
    error : function(){
      console.log("에러");
    }
  })
})()

function changeVideo(videoId){
  videoBox.src = `https://www.youtube.com/embed/${videoId}?autoplay=1&rel=0`;
}

document.getElementById("sideBarBtn").addEventListener("click", function(){
  const rightSide = document.getElementById("rightSide");
  const leftSide = document.getElementById("leftSide");

  if (rightSide.style.display == "none"){
    this.innerHTML = "&gt;";
    rightSide.style.display = "block";
    leftSide.style.width = "75%";
  } else {
    this.innerHTML = "&lt;"
    rightSide.style.display = "none";
    leftSide.style.width = "100%";
  }
})