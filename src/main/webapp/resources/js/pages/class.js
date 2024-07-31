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


// 주어진 YouTube 재생목록 URL에서 'list' 파라미터 값을 추출하는 함수
function getPlaylistIdFromUrl(url) {
  try {
    // URL 객체를 생성
    const urlObj = new URL(url);

    // 'list' 쿼리 파라미터 값을 추출
    const playlistId = urlObj.searchParams.get('list');

    // 결과를 반환
    return playlistId;
  } catch (error) {
    console.error("Error parsing URL:", error);
    return null;
  }
}

// 사용 예제
const youtubePlaylistUrl = classUrl;
const playlistId = getPlaylistIdFromUrl(youtubePlaylistUrl);

const apiKey = "AIzaSyADJBu6bdT_l2VfcxuX9x_YNtm-vWJicuA";
const playlistItemsUrl = `https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=200&playlistId=${playlistId}&key=${apiKey}`;

const selectIndex = document.getElementById("selectIndex");
const subClassScroll = document.getElementById("subClassScroll");

let currentVideoId = "";
let player = null;
let playerReady = false;
let videoCount = 0;

// YouTube Iframe API 비동기적으로 로드
function loadYouTubePlayerAPI() {
  var tag = document.createElement('script');
  tag.src = "https://www.youtube.com/iframe_api";
  var firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
}

// 플레이어를 초기화하는 함수
function initializePlayer(videoId) {
  player = new YT.Player('player', {
    height: '100%',  // 변경 가능 - 영상 높이
    width: '100%',  // 변경 가능 - 영상 너비
    videoId: videoId,  // 변경 - 영상 ID
    playerVars: {
      'rel': 0,    // 연관 동영상 표시 여부 (0: 표시 안 함)
      'playlist': playlistId   // 재생할 영상 리스트
    },
    events: {
      'onReady': onPlayerReady // onReady 상태일 때 작동하는 함수 이름
      // 'onStateChange': onPlayerStateChange // onStateChange 상태일 때 작동하는 함수 이름
    }
  });
}

// 플레이어가 준비되면 호출되는 함수
function onPlayerReady(event) {
  console.log("Player is ready. Playing video:", event.target.getVideoData().title);
  playerReady = true;
  if (currentVideoId) {
    player.loadVideoById(currentVideoId);
    currentVideoId = ""; // Clear currentVideoId after loading
  }
}

// 비디오를 로드하는 함수
function loadVideo(videoId) {
  console.log("Loading video:", videoId);
  if (player) {
    if (playerReady) {
      player.loadVideoById(videoId);
    } else {
      console.log("Player is not ready. Waiting for player to be ready...");
      currentVideoId = videoId;
    }
  } else {
    initializePlayer(videoId);
  }
}

let nextPageToken = '';

// 시작 시, 맨 처음 화면 만들기
function fetchPlaylistItems() {
  $.ajax({
    url: playlistItemsUrl + (nextPageToken ? `&pageToken=${nextPageToken}` : ''),
    success: function(res) {
      console.log("AJAX response:", res);
      const videoItems = res.items;

      videoCount += videoItems.length;
      document.getElementById("totalClassCount").innerText = videoCount;

      // res의 items들에 대해 반복(for문 대체)
      videoItems.forEach((item, index) => {
        const a = document.createElement("a");
        a.innerText = item.snippet.title;
        a.classList.add("subClass");
      
        // a에 클릭 시 이벤트 추가
        a.addEventListener('click', function() {
          // 클릭된 index를 기준으로, 동영상 가져오기
          currentVideoId = videoItems[index].snippet.resourceId.videoId;
          loadVideo(currentVideoId);
        });
        
        // 생성한 링크 요소를 부모 요소에 추가합니다.
        subClassScroll.appendChild(a);
      });

      // 첫 번째 비디오 로드
      if (videoItems.length > 0 && !currentVideoId) {
        currentVideoId = videoItems[0].snippet.resourceId.videoId;
        loadVideo(currentVideoId);
      }

      // 다음 페이지가 있으면 pageToken을 저장하고, 계속해서 데이터를 가져옵니다.
      nextPageToken = res.nextPageToken || '';
      if (nextPageToken) {
        fetchPlaylistItems();  // 다음 페이지의 데이터를 가져옵니다.
      }
    },
    error: function(xhr, status, error) {
      console.error("AJAX Error:", status, error);
      selectIndex.innerText = "404: 해당 강의 URL이 잘못되었습니다.";
      console.log(xhr.responseText);
    }
  });
  
}

fetchPlaylistItems();
