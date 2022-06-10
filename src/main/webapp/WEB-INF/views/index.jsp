<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS Main</title>

<style type="text/css">
body {
	margin: 0 auto;
	padding: 0 auto;
	background-color: #f8f8f8;
	font-family: Helvetica Neue, Helvetica, Arial, "Apple SD Gothic Neo",
		"Malgun Gothic", Dotdum;
} * { box-sizing: border-box; margin:0; }
div { display:inline-block; width:auto; height:auto; }

#container {
	width: 100%;
	height: 100%;
}

#menubar {
	width: 300px;
	height: 100vh;
	background-color: aqua;
	float: left;
	padding: 30px;
	box-sizing: border-box;
}

#main {
	height: 100vh;
	width: calc(100% - 300px);
	float: left;
	padding: 30px;
	background-color: gray;
	box-sizing: border-box;
}

.wrap {
	width: 250px;
	height: auto;
}

.wrap {
	position: relative;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	overflow: hidden;
}

/* 라디오 인풋을 이용했으며 인풋에 라벨을 이어 버튼으로 사용하므로 인풋 자체는 보여질 필요가 없음, 인풋 자체는 보이지 않게 가림 */
input.button {
	display: none;
}

/* 라디오 인풋에 체크가 되면, 인접한 .contents 상자를 보이게 함 */
input[type=radio]:checked+.contents {
	visibility: visible;
	max-height: 500px;
	-webkit-transform: scale(1, 1);
	-ms-transform: scale(1, 1);
	transform: scale(1, 1);
	opacity: 1;
}
/* 라디오 인풋, 모두 닫는 버튼 */
.closer {
	position: absolute;
	top: 0;
	right: 0;
	display: inline-block;
	width: 50px;
	height: 50px;
	line-height: 50px;
	background: #ADB4B0;
	text-align: center;
	font-family: "Arial Black";
	font-size: 25px;
	color: #fff;
	-moz-box-shadow: 1px 1px 3px 5px rgba(0, 0, 0, 0.02);
	-webkit-box-shadow: 1px 1px 3px 5px rgba(0, 0, 0, 0.02);
	box-shadow: 1px 1px 3px 5px rgba(0, 0, 0, 0.02);
	cursor: pointer;
}

/* 닫기 버튼 애니메이션 효과, 삭제시 기능상 무방함 */
input[type=radio].close:checked+.closer {
	transform: translate(0, -100%);
	-webkit-transition: transform .2s ease;
	transition: transform .2s ease;
}

input[type=radio].close:not(:checked)+.closer {
	transform: translate(0, 0);
	-webkit-transition: transform .2s ease;
	transition: transform .2s ease;
}

/* 메뉴 버튼 디자인 */
.label {
	height: 50px;
	line-height: 50px;
	width: 100%;
	display: inline-block;
	float: left;
	overflow: hidden;
	cursor: pointer;
}
/*  메뉴 버튼에 들어갈 아이콘을 100px * 100px, 투명한 PNG 로 저장하여 아래의 경로에 연동해주면 됨 
    위쪽 코드 .label.a 부터 맨 아래코드 .label.e 까지가 메뉴버튼 오른쪽-> 왼쪽 순서 */
.label.a {
	background: #2E97B7;
}

.label.b {
	background: #32B9BE;
}

.label.c {
	background: #5BCEBF;
}

.label.d {
	background: #74DCB9;
}

.label.e {
	background: #94DCB9;
}

.label .rotate {
	display: inline-block;
}

.label .rotate p {
	position: relative;
	font-size: 1.5em;
	white-space: nowrap;
	left: 40%;
	font-family: "arial";
	font-weight: 600;
	color: #fff;
}

/* 컨텐츠 본문 */
.contents {
	position: relative;
	visibility: collapse;
	float: left;
	height: auto;
	width: 100%;
	-webkit-transform: scale(1, 0);
	-ms-transform: scale(1, 0);
	transform: scale(1, 0);
	-ms-transform-origin: top;
	-webkit-transform-origin: top;
	transform-origin: top;
	max-height: 0;
	-webkit-transition: transform 0.2s ease-out, opacity 0.2s ease-out,
		max-height 0.1s ease-out;
	transition: transform 0.2s ease-out, opacity 0.2s ease-out, max-height
		0.1s ease-out;
	opacity: 0;
	z-index: 0;
	overflow: hidden;
	background: -moz-linear-gradient(-45deg, rgba(46, 151, 183, 0.4) 0%,
		rgba(164, 220, 185, 0.9) 100%);
	background: -webkit-linear-gradient(-45deg, rgba(46, 151, 183, 0.4) 0%,
		rgba(164, 220, 185, 0.9) 100%);
	background: linear-gradient(135deg, rgba(46, 151, 183, 0.4) 0%,
		rgba(164, 220, 185, 0.9) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#66c0c60a',
		endColorstr='#59007c33', GradientType=1);
}

.inner {
	display: table;
	width: 340px;
	height: 100%;
	margin: 30px auto;
	-moz-box-shadow: 0px 0px 3px 3px rgba(0, 0, 0, 0.05);
	-webkit-box-shadow: 0px 0px 3px 3px rgba(0, 0, 0, 0.05);
	box-shadow: 0px 0px 3px 3px rgba(0, 0, 0, 0.05);
}

.description {
	display: table-cell;
	vertical-align: middle;
	padding: 5%;
	background: rgba(0, 0, 0, 0.04);
}

.description h3 {
	width: 100%;
	text-overflow: ellipsis;
	overflow: hidden;
	font-size: 30px;
	color: #37a4ab;
	line-height: 1;
	margin: 0;
	text-shadow: rgb(36, 127, 132) 2px 2px 0px;
	margin-bottom: 10px;
}

.description h3::first-letter {
	font-size: 50px;
	color: #0f848c;
}

.description p {
	font-size: 19px;
	line-height: 1.7;
	font-weight: 600;
	color: #4e6b61;
	padding-left: 20px;
	overflow: auto;
	letter-spacing: -1px;
}
</style>

</head>
<body>
	<div id="container">
		<div id="menubar">
			<div class="wrap">

				<!--다섯번째 메뉴와 내용-->
				<!--버튼 요소-->
				<label for="menu1" class="label e"> <span class="rotate">
						<p>MENU 5</p>
				</span>
				</label>
				<!--아코디언 기능구현 핵심 요소 : 실제기능을 하는 input, CSS로 가려놓았음-->
				<input type="radio" name="navigation" id="menu1" class="button">
				<!--콘텐츠가 보여질 요소 : 위의 input이 체크 되었을 때 .contents를 선택하여 높이가 높아지도록 조정함 (선택자 : input[radio]:checked + .contents) -->
				<div class="contents">
					<div class="inner">
						<div class="description">
							<h3>TITLE 5</h3>
							<p>다람쥐 헌 챗바퀴에 타고파.</p>
						</div>
					</div>
				</div>

				<!--이하의 메뉴와 내용 역시 위와 구조 동일함-->
				<!--네번째 메뉴와 내용-->
				<label for="menu2" class="label d"> <span class="rotate">
						<p>MENU 4</p>
				</span>
				</label> <input type="radio" name="navigation" id="menu2" class="button">
				<div class="contents">
					<div class="inner">
						<div class="description">
							<h3>TITLE 4</h3>
							<p>다람쥐 헌 챗바퀴에 타고파. 다람쥐 헌 챗바퀴에 타고파.</p>
						</div>
					</div>
				</div>

				<!--세번째 메뉴와 내용-->
				<label for="menu3" class="label c"> <span class="rotate">
						<p>MENU 3</p>
				</span>
				</label> <input type="radio" name="navigation" id="menu3" class="button">
				<div class="contents">
					<div class="inner">
						<div class="description">
							<h3>TITLE 3</h3>
							<p>다람쥐 헌 챗바퀴에 타고파. 다람쥐 헌 챗바퀴에 타고파. 다람쥐 헌 챗바퀴에 타고파. 다람쥐 헌 챗바퀴에
								타고파.</p>
						</div>
					</div>
				</div>


				<!--두번째 메뉴와 내용-->
				<label for="menu4" class="label b"> <span class="rotate">
						<p>MENU 2</p>
				</span>
				</label> <input type="radio" name="navigation" id="menu4" class="button">
				<div class="contents">
					<div class="inner">
						<div class="description">
							<h3>TITLE 2</h3>
							<p>다람쥐 헌 챗바퀴에 타고파. 다람쥐 헌 챗바퀴에 타고파. 다람쥐 헌 챗바퀴에 타고파. 다람쥐 헌 챗바퀴에
								타고파. 다람쥐 헌 챗바퀴에 타고파. 다람쥐 헌 챗바퀴에 타고파.</p>
						</div>
					</div>
				</div>

				<!--첫번째 메뉴와 내용-->
				<label for="menu5" class="label a"> <span class="rotate">
						<p>MENU 1</p>
				</span>
				</label> <input type="radio" name="navigation" id="menu5" class="button">
				<div class="contents">
					<div class="inner">
						<div class="description">
							<h3>TITLE 1</h3>
							<p>다람쥐 헌 챗바퀴에 타고파. 다람쥐 헌 챗바퀴에 타고파. 다람쥐 헌 챗바퀴에 타고파. 다람쥐 헌 챗바퀴에
								타고파. 다람쥐 헌 챗바퀴에 타고파. 다람쥐 헌 챗바퀴에 타고파. 다람쥐 헌 챗바퀴에 타고파. 다람쥐 헌 챗바퀴에
								타고파.</p>
						</div>
					</div>
				</div>


				<!--닫기 버튼-->
				<input type="radio" name="navigation" id="menu6"
					class="button close" checked> <label for="menu6"
					class="closer"> X </label>
			</div>
		</div>
		<div id="main"></div>
	</div>

</body>
</html>