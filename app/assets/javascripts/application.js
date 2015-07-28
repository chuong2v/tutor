// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require angular
//= require angular-animate
//= require angular-resource
//= require bootstrap/dist/js/bootstrap.js
//= require social-share-button
//= require_tree .

var video_id;

$(function() {
  console.log( "ready!" );
  // var channelId = $('#query').val();
  loadVideos(10,'AIzaSyA_2C8rHaaC14WDplgKD00_f1ckUZoYrBU',$('#query').val());
  $("#search-button").bind("click", function(){
      var channelId = $('#query').val();
      loadVideos(10,'AIzaSyA_2C8rHaaC14WDplgKD00_f1ckUZoYrBU',$('#query').val());
  });
});

function loadVideos(limit,credencial,channelId) {
  $("#youtube-videos").hide();
  //Create ajax request to url of youtube api
  $.ajax({
     type: "GET",
     url: "https://www.googleapis.com/youtube/v3/search?key="
           + credencial 
           + "&q="+channelId+"&part=snippet,id&type=video"
  //het ajax code
  }).done(function (data) {
    var lista = "";
    //tao iframe video
    var tag = document.createElement('script');
    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
    var player;

    $.each(data.items, function (key, value) {      
      if (limit > 0 && value.id.kind == "youtube#video") {
        video_id = value.id.videoId;  
        lista += '<li>' + '<a style="cursor:pointer" onclick="playYT(\''+video_id+'\')">' 
          + value.snippet.title + '</a>' + '</li>';
        limit--;                     
     }       
    });
    $("#youtube-videos").html(lista);
  }).fail(function (jqXHR, textStatus) {
    console.log(jqXHR);
    //het function textstatus
    $("#youtube-videos").html('Khong co videos trong chanel!');
    // het function key, value 
  }).always(function(){
    $("#youtube-videos").show();
  });//  het function data
}// het function load video   

function onYouTubeIframeAPIReady() {
  player = new YT.Player('search-container', {
    height: '100%',
    width: '100%',
    videoId: video_id                  
  });
}

function playYT(vd_id) {
  console.log(vd_id);
  $("#search-container").remove();
  var sc = "<div id=\"search-container\"></div>"
  $("#youtube-videos").before(sc);
  player = new YT.Player('search-container', {
    height: '100%',
    width: '100%',
    videoId: vd_id                   
  });
}