$(document).ready(function(){ 
	getCollectionAll();
});

var res_data;   //所有返回数据
//资源列表获取函数
function getCollectionAll(){
	$.post("php/getCollectionAll.php",function (data) {
		var data = JSON.parse(data);
    	resetData(data);
    	getVideo();
    	getMusic();
    	getImage();
    });
}

//数据重组
function resetData(data){
	var arr = [];
	arr['music'] = [];
	arr['video'] = [];
	arr['image'] = [];
	for (var i = 0; i<data.length; i++) {
		if (data[i]['Stype'] == 'music') {
			arr['music'].push(data[i]);
		}
		if (data[i]['Stype'] == 'video') {
			arr['video'].push(data[i]);
		}
		if (data[i]['Stype'] == 'image') {
			arr['image'].push(data[i]);
		}
	}
	res_data = arr;
}

//附加资源获取根据
// --------------------------------------video-------------------------------------------------------
function getVideo(){
	var Sid ;
	var Surl ;
	for (var i = 0; i<res_data['video'].length; i++) {
		Sid = res_data['video'][i]['Sid'];
		Surl = res_data['video'][i]['Surl'];
		$.post("php/getAddreSources_font.php", {Sid:Sid, Surl:Surl}, function (data_add) {
			var data_add = JSON.parse(data_add);
	    	setVideo(data_add);
	   });
	}
}

//视屏资源注入
function setVideo(data){
	var Eurl = window.location.protocol+"//"+window.location.host+"/"+data[0]['Eurl'];
	var Surl = window.location.protocol+"//"+window.location.host+"/"+data[0]['Surl'];
	var str = "<div class='col-sm-6 col-md-4'>"
					+"<div class='thumbnail'>"
						+"<img src='"+Eurl+"' alt='video'>"
						+"<div class='caption'>"
							+"<h3>"+data[0]['Efake']+"</h3>"
							+"<p>"+data[0]['Edescription']+"</p>"
							+"<p><a href='javascript:;' class='btn btn-primary' role='button' onclick =\"startVideo('"+Surl+"')\">播放视屏</a></p>"
						+"</div>"
					+"</div>"
				+"</div>";
	$('#video_content').append(str);
}

//视屏播放
function startVideo(Surl){
	window.location.href = 'player.html?Surl='+Surl;
}

// --------------------------------------video-------------------------------------------------------

// --------------------------------------music-------------------------------------------------------
function getMusic(){
	var Sid ;
	var Surl ;
	for (var i = 0; i<res_data['music'].length; i++) {
		Sid = res_data['music'][i]['Sid'];
		Surl = res_data['music'][i]['Surl'];
		$.post("php/getAddreSources_font.php", {Sid:Sid, Surl:Surl}, function (data_add) {
			var data_add = JSON.parse(data_add);
	    	setMusic(data_add);
	   });
	}
}

//music注入
function setMusic(data){
	var Eurl = window.location.protocol+"//"+window.location.host+"/"+data[0]['Eurl'];
	var Surl = window.location.protocol+"//"+window.location.host+"/"+data[0]['Surl'];
	var str = "<div class='col-sm-6 col-md-4'>"
					+"<div class='thumbnail'>"
						+"<img src='"+Eurl+"' alt='video'>"
						+"<div class='caption'>"
							+"<h3>"+data[0]['Efake']+"</h3>"
							+"<p>"+data[0]['Edescription']+"</p>"
							+"<audio src='"+Surl+"' controls='controls'>"
							+"Your browser does not support the audio element."
							+"</audio>"
						+"</div>"
					+"</div>"
				+"</div>";
	$('#music_content').append(str);
}

// --------------------------------------music-------------------------------------------------------

// --------------------------------------image-------------------------------------------------------

function getImage(){
	var Sid ;
	var Surl ;
	for (var i = 0; i<res_data['image'].length; i++) {
		Sid = res_data['image'][i]['Sid'];
		Surl = res_data['image'][i]['Surl'];
		$.post("php/getAddreSources_font.php", {Sid:Sid, Surl:Surl}, function (data_add) {
			var data_add = JSON.parse(data_add);;
	    	setImage(data_add);
	   });
	}
}

//music注入
function setImage(data){
	var Eurl = window.location.protocol+"//"+window.location.host+"/"+data[0]['Eurl'];
	var Surl = window.location.protocol+"//"+window.location.host+"/"+data[0]['Surl'];
	var str = "<div class='col-sm-6 col-md-4'>"
					+"<div class='thumbnail'>"
						+"<img src='"+Surl+"' alt='video'>"
						+"<div class='caption'>"
							+"<h3>"+data[0]['Efake']+"</h3>"
							+"<p>"+data[0]['Edescription']+"</p>"
							+"</audio>"
						+"</div>"
					+"</div>"
				+"</div>";
	$('#image_content').append(str);
}
// --------------------------------------image-------------------------------------------------------