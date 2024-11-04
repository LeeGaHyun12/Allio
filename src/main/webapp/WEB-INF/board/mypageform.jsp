<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

        .title {
            color: black;
            font-size: 70px;
            cursor: pointer;
            font-family: "Nanum Myeongjo", serif;
        }

        .write {
            color: white;
            margin-left: auto;
            margin-right: 20px;
        }

        .btnwrite {
            width: 150px;
            height: 50px;
            color: white;
            background-color: #fe3164;
            font-size: 22px;
            border: none;
            border-radius: 35px;
            transition: 0.3s;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .photo {
            width: 100%;
            height: 50vh; /* Viewport height로 변경 */
            background-image: url("/image/photo5.jpg");
            background-size: cover;
            background-position: center;
        }

        .profile {
            position: absolute;
            top: 150px; /* 여유 공간 확보 */
            left: 5%; /* 상대적인 여백 설정 */
            width: 30%; /* 너비 설정 */
            background-color: white;
            border: 1px solid gray;
            border-radius: 20px;
            padding: 10px; /* 여백 추가 */
        }

        .profile_box {
            text-align: center;
            height: auto; /* 자동 높이 조정 */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .profile_photo {
            width: 180px;
            height: 180px;
            border-radius: 50%;
        }

        .profile_image {
            width: 100%; /* 부모 요소에 맞게 조정 */
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
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

        .portfolio_text {
            font-size: 20px;
        }

        .info-text {
            margin-top: 20px;
            text-align: center;
            color: black;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
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
        }

        .portfolio {
            width: 60%;
            position: absolute;
            right: 60px;
            padding: 20px;
        }

        .section-title {
            font-weight: bold;
            font-size: 23px;
            margin-bottom: 10px;
        }

        .portfolio_item {
            display: flex;
            flex-wrap: wrap;
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
            width: 100%; /* 부모 요소의 100%를 차지하도록 설정 */
            height: auto; /* 자동 높이 조정 */
            margin-bottom: 10px;
            border: 1px solid white;
        }

        .portfolio_image {
            width: 100%;
            height: auto;
            object-fit: cover;
        }

        /* 반응형 디자인을 위한 미디어 쿼리 */
        @media (max-width: 768px) {
            .title {
                font-size: 40px; /* 모바일에서 글자 크기 조정 */
            }

            .profile {
                width: 80%; /* 모바일에서 프로필 너비 조정 */
                left: 10%; /* 여백 조정 */
                top: 120px; /* 여백 조정 */
            }

            .portfolio {
                width: 90%; /* 모바일에서 포트폴리오 너비 조정 */
                right: 5%; /* 여백 조정 */
            }

            .btnwrite {
                width: 100%; /* 모바일에서 버튼 너비 조정 */
            }

            .infobtn {
                width: 100%; /* 버튼 너비 조정 */
            }

            .pbox {
                width: calc(100% - 10px); /* 모바일에서 포트폴리오 아이템 너비 조정 */
            }
        }
    </style>
</head>
<body>
<c:set var="userid" value="${param.userid}"/>
<div class="header">
    <div class="title" onclick="location.href='/board/boardlist'">Allio</div>
    <div class="write">
        <button class="btnwrite" data-lang="get_started_button" onclick="location.href='/board/writeform'">
            <fmt:message key="get_started_button" />
        </button>
    </div>
</div>
<div class="photo">
    <div class="profile">
        <div class="profile_box">
            <div class="profile_photo">
                <img src="../profile/${dto.prof_photo}" class="profile_image">
            </div>
            <b class="name">${dto.name}</b>
            <h class="email">${dto.email}</h>
        </div>
        <div class="info-text">
            <b><fmt:message key="follow_chat" /></b>
            <button class="infobtn" style="background-color: #ea4c89">
                <i class="bi bi-bookmark-heart-fill"></i>&nbsp;<fmt:message key="follow_button" />
            </button>
            <button class="infobtn" style="background-color: #1bcad3">
                <i class="bi bi-chat-dots-fill"></i>&nbsp;<fmt:message key="suggest_button" />
            </button>
        </div>
        <div class="info-text" style="height: auto">
            <b><fmt:message key="website" /></b>
            <button class="infobtn" style="background-color: #4267B2; width: 250px">
                <i class="bi bi-facebook"></i>&nbsp; Facebook
            </button>
            <button class="infobtn" style="background-color: #1DA1F2; width: 250px">
                <i class="bi bi-twitter"></i>&nbsp; Twitter
            </button>
            <button class="infobtn" style="background-color: #E1306C; width: 250px">
                <i class="bi bi-instagram"></i>&nbsp; Instagram
            </button>
        </div>
    </div>
</div>
<div class="portfolio">
    <div class="section-title">Portfolio</div>
    <div class="portfolio_item">
        <c:forEach var="p" items="${portfolioList}">
            <div class="pbox">
                <div class="portfolio_photo">
                    <c:set var="imageUrls" value="${fn:split(p.port_photo, ',')}" />
                    <img src="${imageUrls[0]}" class="portfolio_image" onerror="this.onerror=null; this.src='default_image_url.jpg';"> <!-- 기본 이미지 설정 -->
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
