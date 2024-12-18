<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
    <script>
        $(document).ready(function() {
            $('.center').slick({
                dots: true,
                infinite: true,
                speed: 1200,
                slidesToShow: 3,  // 한 화면에 보여줄 슬라이드 개수
                slidesToScroll: 1, // 한 번에 넘어가는 슬라이드 개수
                centerMode: true,
                variableWidth: true,
                autoplay: true,
                autoplaySpeed: 1000
            });
        });
    </script>
    <style>
        body {
            margin: 0;
            padding: 0;

        }

        .center {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 200px;
        }

        .banner {
            color: white;
            width: 600px;
            height: 290px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 20px;
            position: relative;
            background-size: cover; /* 이미지를 비율에 맞게 늘리거나 축소합니다. */
            background-position: center; /* 이미지를 수평 및 수직으로 가운데로 정렬합니다. */
            position: relative;
        }

        .banner::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: linear-gradient(to top, rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0));
            border-radius: 20px;
        }

        .slick-slide {
            margin: 0 8px; /* 배너 사이 간격 설정 */
        }

        .slick-list {
            margin: 0 -10px; /* 양쪽 끝 간격 조정 */
        }
        .banner-text {
            position: absolute;
            bottom: 0;
            left: 0;
            margin: 0;
            padding: 10px;
            font-weight: bold;
            color: white;
            font-size: 30px;
            font-family: "Jua", sans-serif;
        }

        .sub-text {
            position: absolute;
            bottom: 40px; /* banner-text 위에 위치하도록 조정 */
            left: 0;
            margin: 0;
            padding: 10px;
            font-weight: bold;
            color: white;
            font-size: 20px;
            font-family: "Jua", sans-serif;
        }

    </style>
</head>

<body>
<div class="center">
    <a href="https://ncamp.kr/">
    <div class="banner" id="banner1" style="background-image: url(/image/banner1.png)">
    </div>
    </a>
    <div class="banner" id="banner2" style="background-image: url(/image/banner5.jpg)">
        <p class="banner-text" data-lang="banner2_text"><fmt:message key="banner2_text" /></p>
        <p class="sub-text" data-lang="banner2_subtext"><fmt:message key="banner2_subtext" /></p>
    </div>
    <div class="banner" id="banner3" style="background-image: url(/image/banner9.jpg)">
        <p class="banner-text" data-lang="banner3_text"><fmt:message key="banner3_text" /></p>
        <p class="sub-text" data-lang="banner3_subtext"><fmt:message key="banner3_subtext" /></p>
    </div>
    <div class="banner" id="banner4" style="background-image: url(/image/banner11.jpg)">
        <p class="banner-text" data-lang="banner4_text"><fmt:message key="banner4_text" /></p>
        <p class="sub-text" data-lang="banner4_subtext"><fmt:message key="banner4_subtext" /></p>
    </div>
    <div class="banner" id="banner5" style="background-image: url(/image/banner10.jpg)">
        <p class="banner-text" data-lang="banner5_text"><fmt:message key="banner5_text" /></p>
        <p class="sub-text" data-lang="banner5_subtext"><fmt:message key="banner5_subtext" /></p>
    </div>
</div>

</body>

</html>

