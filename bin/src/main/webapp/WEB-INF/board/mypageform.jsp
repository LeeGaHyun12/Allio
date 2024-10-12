<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

    <!--폰트-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Archivo:ital,wght@0,100..900;1,100..900&family=Domine:wght@400..700&display=swap" rel="stylesheet">

    <style>
        body *{
            font-family: "Nanum Myeongjo", serif;
        }

        .header {
            width: 100%;
            height: 70px;
            display: flex;
            align-items: center; /* 수직 중앙 정렬 */
        }

        div.title {
            color: black;
            font-size: 70px;
            cursor: pointer;
            font-family: "Nanum Myeongjo", serif;
        }
        .write{
            color: white;
            width: 150px;
            height: 120px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: auto;
            margin-right: 20px;
        }
        .btnwrite{
            width: 100%;
            height: 50px;
            color:white;
            background-color: #fe3164;
            font-size: 22px;
            border:none;
            border-radius: 35px;
            transition:0.3s;
            display: flex; /* 버튼 안의 내용물을 가로 중앙 정렬하기 위해 추가 */
            justify-content: center; /* 버튼 안의 내용물을 가로 중앙 정렬하기 위해 추가 */
            align-items: center; /* 버튼 안의 내용물을 세로 중앙 정렬하기 위해 추가 */
        }

        .photo{
            top: 200px;
            width: 100%;
            height: 50%;
            background-image: url("/image/photo5.jpg");
            background-size: cover; /* 이미지를 비율에 맞게 늘리거나 축소합니다. */
            background-position: center; /* 이미지를 수평 및 수직으로 가운데로 정렬합니다. */
        }

        .profile {
            position: absolute; /* 상대적 위치 설정 */
            top: 200px; /* photo div의 위에 50px만큼 띄움 */
            left: 90px; /* 좌측 여백 설정 */
            width: 30%; /* 너비 설정 */
            height: 120%; /* 높이 설정 */
            background-color: white;
            border: 1px solid gray;
            border-radius: 20px;
        }

        .profile_box {
            margin-top: 1px;
            text-align: center;
            height: 35%; /* 높이를 설정합니다. */
            display: flex; /* 플렉스박스를 사용합니다. */
            flex-direction: column; /* 아이템을 세로로 배치합니다. */
            justify-content: center; /* 수직으로 중앙 정렬합니다. */
            align-items: center; /* 수평으로 중앙 정렬합니다. */

        }

        .profile_photo {
            width: 180px; /* 너비를 설정합니다. */
            height: 180px; /* 높이를 설정합니다. */
            border-radius: 50%; /* 원형으로 만듭니다. */
        }

        .profile_image {
            width: 180px; /* 원하는 너비로 조정 */
            height: 180px; /* 원하는 높이로 조정 */
            border-radius: 50%; /* 원형으로 모양 조정 */
            object-fit: cover; /* 이미지가 요소에 맞게 맞춰지도록 설정 */
        }


        .email {
            font-size: 20px;
            color: #999999;
        }

        .name {
            margin-top: 20px;
            font-size: 50px;
            color: black;
        }


        .portfolio_text{
            font-size: 20px;
        }




        .info-text {
            margin-top: 20px; /* 버튼과 텍스트 간의 간격 설정 */
            text-align: center;
            color: black; /* 텍스트 색상 설정 */
            display: flex; /* Flexbox를 사용하여 자식 요소들을 중앙 정렬합니다. */
            flex-direction: column; /* 자식 요소들을 세로로 배치합니다. */
            align-items: center; /* 자식 요소들을 수평 중앙 정렬합니다. */
            justify-content: center; /* 자식 요소들을 수직 중앙 정렬합니다. */
            padding: 20px; /* 내부 여백을 설정합니다. */
            font-size: 22px;
        }

        .infobtn {
            width: 320px;
            height: 60px;
            color: #fff;
            border: none;
            border-radius: 30px;
            transition: 0.3s;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 10px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); /* 그림자 효과 추가 */
        }

        .portfolio{
            width: 60%; /* 크기를 더 크게 조절 */
            height: 100%; /* 크기를 더 크게 조절 */
            position: absolute; /* 포지션을 설정하여 상위 요소에 대해 절대적으로 위치시킴 */
            right: 60px; /* 오른쪽으로 정렬 */
            padding: 20px;
        }

        .section-title {
            font-weight: bold;
            font-size: 23px;
            margin-bottom: 10px;
        }

        .portfolio_item {
            display: flex; /* 포트폴리오 아이템을 가로로 나란히 정렬합니다. */
            flex-wrap: wrap; /* 포트폴리오 아이템을 세로로 가운데 정렬합니다. */
            justify-content: space-between;
            width: auto;

        }

        .pbox {
            flex-direction: column;
            width: calc(33% - 10px);
            padding: 10px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1), 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .portfolio_photo {
            width: 250px;
            height: 250px;
            margin-bottom: 10px;
            border: 1px solid white;
            margin-left: auto;
            margin-right: auto;
        }
        .portfolio_image{
            width: 100%; /* 이미지가 부모 요소의 100%를 차지하도록 설정합니다 */
            height: 100%; /* 이미지가 부모 요소의 100%를 차지하도록 설정합니다 */
            object-fit: cover; /* 이미지를 비율을 유지하면서 부모 요소에 맞춰 잘라내기 */

        }



    </style>
</head>
<body>
<c:set var="userid" value="${param.userid}"/>
<div class="header">
    <div class="title" onclick="location.href='/board/boardlist'">Allio</div>
    <div class="write"><button class="btnwrite" onclick="location.href='/board/writeform'">Get started</button></div>
</div>
<div class="photo">
    <div class="profile">
        <!-- 프로필 내용 -->
        <div class="profile_box">
            <div class="profile_photo">
                <img src="../profile/${dto.prof_photo}" class="profile_image">
            </div>
                <b class="name">${dto.name}</b>
                <h class="email">${dto.email}</h>
        </div>
        <div class="info-text">
            <b>팔로우&채팅</b>
            <button class="infobtn" style="background-color: #ea4c89"><i class="bi bi-bookmark-heart-fill"></i>&nbsp;팔로우</button>
            <button class="infobtn" style="background-color: #1bcad3"><i class="bi bi-chat-dots-fill"></i>&nbsp; 제안하기</button>
        </div>
        <div class="info-text" style="height: 300px">
            <b>웹사이트</b>
            <button class="infobtn" style="background-color: #4267B2; width: 250px"> <!-- Facebook 버튼 -->
                <i class="bi bi-facebook"></i>&nbsp; Facebook
            </button>
            <button class="infobtn" style="background-color: #833AB4; width: 250px"> <!-- Instagram 버튼 -->
                <i class="bi bi-instagram"></i>&nbsp; Instagram
            </button>
            <button class="infobtn" style="background-color: #1DA1F2; width: 250px"> <!-- Twitter 버튼 -->
                <i class="bi bi-twitter"></i>&nbsp; Twitter
            </button>
        </div>
    </div>
</div>
<div class="portfolio">
    <div class="section-title">작업 / 좋아요 / 컬렉션</div>
    <hr> <!-- 회색줄 한 줄 긋기 -->
    <div class="section-title">작업 리스트</div>
    <div class="portfolio_item">
        <c:forEach var="portfolio" items="${portfolioList}">
            <div class="pbox">
                <div class="portfolio_photo">
                    <img src="../photo/${portfolio.port_photo}" class="portfolio_image">
                </div>
                <div class="portfolio_text" style="font-size: 15px">&nbsp;${portfolio.subject}</div>
            </div>
        </c:forEach>
    </div>


</div>
</body>
</html>
