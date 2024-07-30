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

// 플레이어의 상태가 변화될 때 호출되는 함수
// var done = false;
// function onPlayerStateChange(event) {
//   if (event.data === YT.PlayerState.PLAYING && !done) {
//     setTimeout(stopVideo, 6000);
//     done = true;
//   }
// }

// function stopVideo() {
//   if (player) {
//     player.stopVideo();
//   }
// }

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




<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/ca1a32ac54e1a160ef3542b9f9be04dca1c614f7.jpg"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/3d8f60050749e7ad92e02c56a0ec9a8bec780554.gif"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/d55ab5246ef4c0e324025814e3e99bd8ea61b4ae.gif"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/9e4a01468757001ad35a6296e7f3b7b783a8daf4.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/755ca8e76ec0947208da256323d44197329851a8.jpg"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/9ef79c0240be77c731ddd4d2e63639f8915efebd.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/378b60480091948f074ecf3928b88aa7b42f9f16.jpg"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/025ce707e84a7e745f6d7c6e27874d0c15c87328.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/03b619987481004f8a839f5c633b8a296576d7bd.jpg"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/5c1e80e1f7814e7cdec63cc9b5a408d4df82472a.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/a952aa3c6f7cd059789df0eeb84b66abeebd1601.jpg"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/ac2e89e1c6a111a9fc4a6813abc8ac7bf93369dc.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/9e3b46a0c82b6ab313e436c120a8e6c76d23907c.jpg"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/4960127efd2ac2701ce16ad4421605d0dc996438.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/e1041e90252e87e8633ff8b8aa24011520b3811d.gif"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/41ac25ec473fc8dd5ccc5bf5c8198449db85f876.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/92aa0e240c58195a973af2c2c3b0ad4ac1727fd2.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/b0489febf09f8ff05d2b7052d02baaa8fbd714fb.jpg"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/ee6619aea5a9ca62735080eab9f975768798d3de.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/39e83b1355217d19f4b85fe78df8576d81736320.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/2228c7598332fc8d34760a9206b8d42f3305e828.gif"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/0e615707c95a6780f10a3333a5c9ee7b00eee99a.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/7a3b0617abf8f8d003c579db298a6907b47b7cdb.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/db6aa5e9eec48e932c321a4a538b50e62b13a3d1.gif"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/0efc5e070ac1f3f7764df93e707c6cf639466bfe.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/ef8c64434881647bcc16ec8e70513131ec9f946c.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/52d6183a07c5ad468f4c7932c3928b4164fa74d9.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/3bf72b228c34c64afa1954ca6a9c4edc9e8d5fe4.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/eff726823ce4f18bb2624e79a91e5857c8e8cdec.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/1c36376016aaa6f617f3f04af4ed2a3a9980fb01.gif"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/efb485099060894df1411006a70c2759e44c73d8.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/8dbbfd4e56483b84e487270997280a6eb5d0b8fc.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/aafb7a52b3df7304dad049baec58890ec7856e63.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/a6be96b7d5037cd9cd53471c619487055514bd45.jpg"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/075e0decb38874370d9cdb6ae7b004efa1b54e90.gif"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/c302c7e47b0870bd4b9b456b1654ab2913335a27.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/5cb145471ff7e8f658acb5a54cca4edf5d288ee8.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/50d25a6c95bb6fc179d209ee270e408372f91319.gif"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/92c52a73ea9f2326ebab12fe3fc3a3cb1b33da49.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/bc8bb5f4b4bb12aa4a8d47db26730dd598fcb674.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/9ee93d5607337dc894a9244f20a84ee703e52ae1.gif"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/3295f285de2dd2d540cb6ee6fdde93096dd62be4.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/759a857f98b008a489da49faa0bdf3012f83fd26.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/72bd7767907a0b3f65a2d66304fbdd1a56924750.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/e916702734d4ac40d9199a21c0dfe254cd021bb5.gif"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/3c1f38e1557993b6b908b6c55574423b08b5899c.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/83671e2a96781b66f4f551978ab7e14df7e3b413.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/f5224afd92576dc375bfb23dc343a4d7f1cd018b.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/20dfcb661513ec5b16600754bf3fd0c5ceee0f2c.jpg"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/1667b60db666cecfb90d78169bebde1ffccb8c6c.jpg"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/3d0f310b8a8d34fc9f857530423b99a33f9e0a1e.jpg"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/8330bb3c93c2d80ac9bda60cbdf0e7060e28ee1d.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/f5aca34dd806455c52279f0a70443488bec6557f.jpg"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/3e864d58b9f134b19a9fdbc4de96d5d538ef5797.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/589e2c877b37214c464eb8f496c66cdd725a0410.png"
 >
<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/852e790db6a58dd53c0f9a61aa387f57d57b733c.jpg"
 >