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
<style>
    div.mainlayout>div{

        position: absolute;
    }
    div.mainlayout>div.header{
        width: 100%;
        height: 70px;
        line-height:100px;
        font-size: 35px;
        text-align: center;


    }

    div.mainlayout > div.menu {
        background-image: url("/image/photo4.jpg");
        background-size: cover; /* 이미지를 비율에 맞게 늘리거나 축소합니다. */
        background-position: center; /* 이미지를 수평 및 수직으로 가운데로 정렬합니다. */
        width: 100%;
        height: 780px;
        top: 70px;
        line-height: 100px;
        font-size: 35px;
        text-align: center;
    }


    div.mainlayout>div.info{
        width: 100%;
        height: 500px;
        top: 620px;
        line-height:100px;
        font-size: 35px;
        text-align: center;
    }

    div.mainlayout>div.main{
        width: 100%;
        height: 1000px;
        top: 950px;
        line-height:100px;
        font-size: 35px;
        text-align: center;
    }

</style>
</head>
<body>
<div class="mainlayout">
    <div class="header">
        <tiles:insertAttribute name="header"/>
    </div>
    <div class="menu">
        <tiles:insertAttribute name="menu"/>
    </div>
    <div class="info">
        <tiles:insertAttribute name="info"/>
    </div>
    <div class="main">
        <tiles:insertAttribute name="main"/>
    </div>
</div>
</body>
</html>
