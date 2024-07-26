

// // 예시데이터
// // 정처기 : PL6i7rGeEmTvoea5d4Xr_Awhi_ES5GvkBA - 재생목록 53개, 리스트는 50개
// // 정처기 필기 : PL6i7rGeEmTvqEjTJF3PJR4a1N9KTPpfw0 - 재생목록 8개


// // const testList2 = "PL6i7rGeEmTvqEjTJF3PJR4a1N9KTPpfw0";
// // // const testVid = "yxgu4o41us4";
// // const testVid = "MGGBVVz8Iws";

// // const partSnippet = "snippet";
// // const partContentDetails = "contentDetails";

// // const youtubeUrl = "https://www.youtube.com/embed/";

// // const getList = `https://www.googleapis.com/youtube/v3/playlistItems?part=${partSnippet},${partContentDetails}&maxResults=50&status=&playlistId=${testList1}&key=${apiKey}`;
// // const getPlaylists = `https://www.googleapis.com/youtube/v3/playlists?part=${partSnippet},${partContentDetails}&id=${testList1}&maxResults=50&key=${apiKey}`;
// // //  'https://youtube.googleapis.com/youtube/v3/playlists?part=snippet%2CcontentDetails&id=PL6i7rGeEmTvoea5d4Xr_Awhi_ES5GvkBA&key=[YOUR_API_KEY]' \
// // const getVid = `https://www.googleapis.com/youtube/v3/videos?part=${partSnippet}&id=${testVid}&key=${apiKey}`;
// // const getListVideo = `https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet%2CcontentDetails&playlistId=${testList1}&videoId=${testVid}&key=${apiKey}`;

// /////////////////

// //-------------------------------------------------

// // window.YT.ready(function() {
// //   player = new window.YT.Player("video", {
// //     height: "390",
// //     width: "640",
// //     videoId: "M7lc1UVf-VE",
// //     events: {
// //       onReady: onPlayerReady,
// //       onStateChange: onPlayerStateChange
// //     }})
// //   console.log(player);
// //   window.tmp_obj = player;
// // });

// function onYouTubeIframeAPIReady() {
         

//   player = new YT.Player('player', {

//     width: '640',
//     height: '360',
//     videoId: '<?=$video?>',
//     playerVars: {'autoplay': 1, 'showinfo': 0, 'rel':0, 'modestbranding':1,
//         'wmode':'transparent', 'autohide':1
//         },
//     events: {
//       'onReady': onPlayerReady,
//       'onStateChange': onPlayerStateChange
//     }
//   });
// }


// function onPlayerReady(event) {
//   event.target.setPlaybackQuality("hd720");
//   // 추가한 소스..
//   console.log(tmp_obj.getCurrentTime());
//   console.log(tmp_obj.getDuration());

//   }

//   function onPlayerStateChange(event) {
//   if (event.data == YT.PlayerState.PLAYING) {
//   event.target.setPlaybackQuality('hd720');
//   }
// }

// // onYouTubeIframeAPIReady()
// //-------------------------------------------------
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




const apiKey = "AIzaSyADJBu6bdT_l2VfcxuX9x_YNtm-vWJicuA";
const testList1 = "PL6i7rGeEmTvoea5d4Xr_Awhi_ES5GvkBA";
const playlistItemsUrl = `https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=200&playlistId=${testList1}&key=${apiKey}`;

const videoBox = document.getElementById("video");
const subClassScroll = document.getElementById("subClassScroll");

let currentVideoId = "";

var player;

// 시작시, 맨 처음 화면 만들기
(function(){
  subClassScroll.innerHTML = "";
  loadYouTubePlayerAPI();
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
          currentVideoId = res.items[index].snippet.resourceId.videoId;
          loadPlayer(currentVideoId);
        });
        
        // 생성한 링크 요소를 부모 요소에 추가합니다.
        subClassScroll.appendChild(a);
      });
      if (res.items.length > 0) {
        currentVideoId = res.items[0].snippet.resourceId.videoId;
        console.log("v="+currentVideoId+"&list="+testList1);
        loadPlayer(currentVideoId);
      }
    },
    error: function(xhr, status, error) {
      console.error("AJAX Error:", status, error);
      console.log(xhr.responseText);
    }
  })
})()



// 2. 이 코드는 Iframe Player API를 비동기적으로 로드한다. !!필수!!
// YouTube Iframe API 비동기적으로 로드
function loadYouTubePlayerAPI() {
  var tag = document.createElement('script');
  tag.src = "https://www.youtube.com/iframe_api";
  var firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
}


// 3. API 코드를 다운로드 받은 다음에 <iframe>을 생성하는 기능 (youtube player도 더불어)

function loadPlayer(videoId) {
  console.log("v="+videoId+"&list="+testList1);
  if (player) {
    player.loadVideoById(videoId);
  } else {
    player = new YT.Player('player', {
      height: '100%',  // 변경 가능 - 영상 높이
      width: '100%',  // 변경 가능 - 영상 너비
      videoId: videoId,  // 변경 - 영상 ID
      playerVars: {
        'rel': 0,    // 연관 동영상 표시 여부 (0: 표시 안 함)
        'playlist': testList1   // 재생할 영상 리스트
      },
      events: {
        'onReady': onPlayerReady, // onReady 상태일 때 작동하는 함수 이름
        'onStateChange': onPlayerStateChange // onStateChange 상태일 때 작동하는 함수 이름
      }
    });
  }
}

// 4. API는 비디오 플레이어가 준비되면 아래의 function을 불러올 것이다.
function onPlayerReady(event) {
  console.log(event.target.playerInfo.videoEmbedCode);
  event.target.playVideo();
}

// 5. API는 플레이어의 상태가 변화될 때 아래의 function을 불러올 것이다.
//    이 function은 비디오가 재생되고 있을 때를 가르킨다.(state=1),
//    플레이어는 6초 이상 재생되고 정지되어야 한다.
var done = false;
function onPlayerStateChange(event) {
  if (event.data == YT.PlayerState.PLAYING && !done) {
    setTimeout(stopVideo, 6000);
    done = true;
  }
}
function stopVideo() {
  player.stopVideo();
}

