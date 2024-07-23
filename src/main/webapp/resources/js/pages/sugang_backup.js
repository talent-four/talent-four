// AIzaSyADJBu6bdT_l2VfcxuX9x_YNtm-vWJicuA


// Q8gqj1gpZdI
// 7UDKo_rrQVY
// QiYoh61pwuc
// LTTdocH9nAo

// const videoId = "LTTdocH9nAo"; // 조회하고자 하는 비디오의 ID를 입력합니다.
// const apiKey = "AIzaSyADJBu6bdT_l2VfcxuX9x_YNtm-vWJicuA"; // 유효한 YouTube Data API 키를 입력합니다.
// const apiUrl = `https://www.googleapis.com/youtube/v3/videos`; // API URL
// const part = "snippet,contentDetails"; // 조회하고자 하는 항목들을 입력합니다.
// // const youtubeUrl = "https://www.youtube.com/watch?v=";


// const url = `${apiUrl}?part=${part}&id=${videoId}&key=${apiKey}`; // 완성된 요청 URL
// https://www.googleapis.com/youtube/v3/videos?part=snippet,contentDetails&id=LTTdocH9nAo&key=AIzaSyADJBu6bdT_l2VfcxuX9x_YNtm-vWJicuA
// let data;
// var player;

// fetch(url)
//   .then((response) => response.json())
//   .then((data) => {
//     const title = data.items[0].snippet.thumbnails.standard.url;

//     const videoBox = document.getElementById("video");

//     videoBox.src = `${youtubeUrl}${videoId}`;

//     console.log(data);
// });

const apiKey = "AIzaSyADJBu6bdT_l2VfcxuX9x_YNtm-vWJicuA";
const testList = "PL6i7rGeEmTvoea5d4Xr_Awhi_ES5GvkBA";
// const testVid = "yxgu4o41us4";
const testVid = "MGGBVVz8Iws";

const partSnippet = "snippet";
const partContentDetails = "contentDetails";

const youtubeUrl = "https://www.youtube.com/embed/";

const getList = `https://www.googleapis.com/youtube/v3/playlistItems?part=${partSnippet},${partContentDetails}&maxResults=50&status=&playlistId=${testList}&key=${apiKey}`;
const getPlaylists = `https://www.googleapis.com/youtube/v3/playlists?part=${partSnippet},${partContentDetails}&id=${testList}&maxResults=50&key=${apiKey}`;
//  'https://youtube.googleapis.com/youtube/v3/playlists?part=snippet%2CcontentDetails&id=PL6i7rGeEmTvoea5d4Xr_Awhi_ES5GvkBA&key=[YOUR_API_KEY]' \
const getVid = `https://www.googleapis.com/youtube/v3/videos?part=${partSnippet}&id=${testVid}&key=${apiKey}`;
const getListVideo = `https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet%2CcontentDetails&playlistId=${testList}&videoId=${testVid}&key=${apiKey}`;

// gpt 코드
const playlistItemsUrl = `https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=${testList}&key=${apiKey}`;


const videoBox = document.getElementById("video");
videoBox.src = `${getPlaylists}`;


function test(){
  $.ajax ({
    url : playlistItemsUrl,
    success : function(res){
      console.log(res.items[0]);
      var videoId = res.items[1].snippet.resourceId.videoId;
      videoBox.src = `https://www.youtube.com/embed/${videoId}`;
    },
    error : function(){
      console.log("에러");
    }
  })
}



