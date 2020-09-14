<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>딜리벤져스</title>
<style>
	@font-face {
	    font-family: 'NeoDunggeunmo';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.3/NeoDunggeunmo.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
            
	body{
		font-family: 'NeoDunggeunmo';
		margin: 0;
		background: url('./images/space-background.jpg') no-repeat;
		background-attachment: fixed;
		background-position: center;
		cursor: pointer;
	}
	#wrap {
		height: 100vh;
		color: white;
		text-align: center;
	}
	#wrap div {
		font-size: 3rem;
    	margin-bottom: 100px;
	}
	#playBtn {
		background: url('./images/yellow-play.svg') no-repeat;
		width: 50px;
    	height: 50px;
    	border: none;
    	cursor: pointer;
	}
	#playBtn:focus {
		outline: none;
	}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	
</script>
</head>
<body>
	<audio id="BGM" src='./media/welcomeBGM.mp3' style="display:none;" controls autoplay></audio>
	<div style="position:absolute; left: 95vw; top: 10px;">
		<button id="playBtn" onclick='document.getElementById("BGM").play();'></button>
	</div>
	<marquee scrollamount=15 direction=up id="wrap" onclick="location.href='./';">
		<div style="font-size: 2rem;">"태초에"</div>
		<div style="font-size: 2.5rem;">"지구로 날라온"</div>
		<div style="">"6 생명체들이"</div>
		<div style="">"한반도의 굶주린 배들을"</div>
		<div style="font-size: 3.5rem;">"채워주러 2020년에"</div>
		<div style="font-size: 4rem;">"마침내 모습을 드러내니"</div>
		<div style="margin-bottom: 0px; font-size: 4rem;">"사람들은 그들을 딜리벤져스라 불렀다.."</div>
		<div style="margin: 0; font-size:6rem;">.</div>
		<div style="margin: 0; font-size:6rem;">.</div>
		<div style="margin: 0; margin-bottom: 300px; font-size:6rem;">.</div>
		<div style="color: yellow;">
			"그럼 딜리벤져스 주문 하러 가볼까요?!<br>
			클릭하여 주문하러 가기!"
		</div>
	</marquee>
</body>
<script>
	localStorage.CustomerFont = 'MapoGoldenPier';
	localStorage.CeoFont = 'MapoGoldenPier';
</script>
</html>