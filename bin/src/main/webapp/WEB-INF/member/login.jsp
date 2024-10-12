<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dragscroll/0.0.8/dragscroll.min.js"></script>
    <script
            src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
            crossorigin="anonymous"></script>
    <!--폰트-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Archivo:ital,wght@0,100..900;1,100..900&family=Domine:wght@400..700&display=swap"
          rel="stylesheet">

    <style>
        @font-face {
            font-family: 'YEONGJUPunggiGinsengTTF';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/YEONGJUPunggiGinsengTTF.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        body * {
            font-family: 'YEONGJUPunggiGinsengTTF';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/YEONGJUPunggiGinsengTTF.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        body, input {
            font-family: 'YEONGJUPunggiGinsengTTF';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/YEONGJUPunggiGinsengTTF.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        div.title{
            font-family: "Nanum Myeongjo", serif;
            color: black;
            width: 100px;
            height: 100px;
            justify-content: center;
            left: 50%;
            font-size: 70px;
            cursor: pointer;
            margin-left: 160px;
        }

        .container {
            max-width: 500px;
            margin: 150px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 10px;
        }

        .form-group label {
            font-weight: 700;
        }

        .btn-danger {
            background-color: #ea4c89;
            border-color: #ea4c89;
        }

        .btn-danger:hover {
            background-color: #d8336b;
            border-color: #d8336b;
        }
    </style>
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<script>
    $(function () {
        $("#loginbtn").click(function () {
            //폼안의 입력값 읽기
            let fdata = $("#loginfrm").serialize();

            $.ajax({
                type: "get",
                dataType: "json",
                url: "${root}/member/login",
                data: fdata,
                success: function (data) {
                    if (data.status == 'success') {
                        location.href = "/board/boardlist";
                    } else {
                        alert("아이디 또는 비밀번호가 맞지 않습니다");
                    }
                }
            });
        });

    });//close function
</script>
<body style="background-image: url('/image/ backgroundimg.jpg'); background-size: cover; background-position: center;">
<div>
    <%--<img src="/image/backgroundimg.jpg" style="width: 50%;">--%>
    <div class="container">
        <div class="title" onclick="location.href='/board/boardlist'">Allio</div>
        <h3 class="text-center mb-4">로그인</h3>
        <form id="loginfrm" action="<%=request.getContextPath()%>/member/login" method="get"
              enctype="multipart/form-data">
            <div class="form-group-id" style="width: 300px;">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="userId" class="form-control"
                       value="${sessionScope.saveid!=null and sessionScope.saveid=='yes'?
                               sessionScope.loginid:''}" required>
                <input type="checkbox" id="saveid"
                       name="saveid" ${sessionScope.saveid=null or sessionScope.saveid=='no'?"":"checked"}>&nbsp;아이디저장

            </div>

            <div class="form-group">
                <label for="passwd">비밀번호</label>
                <input type="password" id="passwd" name="passwd" class="form-control" required maxlength="8">
            </div>

            <div class="form-group text-center">
                <button id="loginbtn" type="button" class="btn btn-danger btn-block">로그인</button>
            </div>
        </form>
    </div>
</div>

<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

