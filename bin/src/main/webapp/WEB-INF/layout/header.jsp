<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<head>
    <!--폰트-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Archivo:ital,wght@0,100..900;1,100..900&family=Domine:wght@400..700&display=swap" rel="stylesheet">
<style>

    body{
        font-family: "Nanum Myeongjo", serif

    }
    div.header{
        display: flex;
        justify-content: flex-end;
        align-items: center;

    }
    div.rightbox {
        display: flex;
        gap: 8px;

    }
    div.title{
        display: flex;
        color: black;
        width: 100px;
        height: 100px;
        justify-content: center;
        position: absolute; /* 절대 위치 지정 */
        left: 25px;
        font-size: 70px;
        cursor: pointer;
    }
    div.search{
        color: white;
        width: 300px;
        height: 120px;
        display: flex;
        justify-content: center;
        align-items: center;

    }
    input{
        width: 300px;
        border: 1px solid #bbb;
        border-radius: 25px;
        padding: 10px 20px;
        height: 50px;
    }
    div.search input::placeholder {
        font-size: 18px; /* 플레이스홀더의 글자 크기 */
        color: #999; /* 플레이스홀더의 색상 */

    }
    div.login{
        color: white;
        width: 130px;
        height: 120px;
        display: flex;
        justify-content: center;
        align-items: center;

    }
    .btnlogin{
        width: 100%; /* 버튼을 부모 div의 너비에 맞추기 */
        height: 50px;
        color:#ea4c89;
        background-color: white;
        font-size: 22px;
        border:none;
        border-radius: 35px;
        transition:0.3s;
        display: flex; /* 버튼 안의 내용물을 가로 중앙 정렬하기 위해 추가 */
        justify-content: center; /* 버튼 안의 내용물을 가로 중앙 정렬하기 위해 추가 */
        align-items: center; /* 버튼 안의 내용물을 세로 중앙 정렬하기 위해 추가 */
        cursor: pointer;
    }
    div.logout{
        color: white;
        width: 130px;
        height: 120px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .btnlogout{
        width:100%;
        height: 50px;
        color:#fff;
        background: #ffb1b4;
        font-size: 22px;
        border:none;
        border-radius: 35px;
        transition:0.3s;
        display: flex; /* 버튼 안의 내용물을 가로 중앙 정렬하기 위해 추가 */
        justify-content: center; /* 버튼 안의 내용물을 가로 중앙 정렬하기 위해 추가 */
        align-items: center; /* 버튼 안의 내용물을 세로 중앙 정렬하기 위해 추가 */
        cursor: pointer;
    }
    div.signup{
        color: white;
        width: 130px;
        height: 120px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .btnsignup{
        width:100%;
        height: 50px;
        color:#fff;
        background: #ea4c89;
        font-size: 22px;
        border:none;
        border-radius: 35px;
        transition:0.3s;
        display: flex; /* 버튼 안의 내용물을 가로 중앙 정렬하기 위해 추가 */
        justify-content: center; /* 버튼 안의 내용물을 가로 중앙 정렬하기 위해 추가 */
        align-items: center; /* 버튼 안의 내용물을 세로 중앙 정렬하기 위해 추가 */
        cursor: pointer;
    }

    .nickname{
        color: black;
        font-size: 25px;
        margin-left: 10px;
        display: flex; /* 버튼 안의 내용물을 가로 중앙 정렬하기 위해 추가 */
        justify-content: center; /* 버튼 안의 내용물을 가로 중앙 정렬하기 위해 추가 */
        align-items: center; /* 버튼 안의 내용물을 세로 중앙 정렬하기 위해 추가 */
        cursor: pointer;
    }
</style>
    <c:set var="root" value="<%=request.getContextPath()%>"/>
    <script type="text/javascript">
        $(function(){
            //로그아웃 버튼
            $("#btnlogout").click(function(){
                $.ajax({
                    type:"get",
                    dataType:"text",
                    url:`${root}/member/logout`,
                    success:function(){
                        //전체 페이지 새로고침
                        location.reload();
                    }
                })
            });

            $("#searchInput").keypress(function(event) {
                if (event.which === 13) {
                    let keyword = $("#searchInput").val();
                    window.location.href = `${root}/board/search?keyword=` + keyword;
                }
            });

            //마이페이지로 이동하는 버튼 (test)
            $(".nickname").click(function() {
                let loginId = "${sessionScope.loginid}";
                if (loginId) {
                    window.location.href = `${root}/board/mypageform?userid=` + loginId;
                } else {
                    alert("로그인이 필요합니다.");
                }
            });


        });//close function


    </script>
</head>
<body>
<!--test-->
<div class="header">
        <div class="title" onclick="location.href='/board/boardlist'">Allio</div>
    <div class="rightbox">

        <div class="search">
            <div class="input-group">
            <input type="text" id="searchInput" class="form-control" placeholder="Search..."></div>
        </div>

        <c:if test="${sessionScope.loginok==null}">
        <div class="login"><button class="btnlogin" onclick="location.href='/member/loginform'">login</button></div>
        <div class="signup"><button class="btnsignup" onclick="location.href='/member/form'">sign up</button></div>
        </c:if>
        <c:if test="${sessionScope.loginok!=null}">
            <b class="nickname">${sessionScope.loginid}님</b>
            <img src="../profile/${dto.prof_photo}" class="rounded-circle">
            <div class="logout"><button type="button" id="btnlogout" style="margin-left: 20px;" class="btnlogout">logout</button></div>

        </c:if>
    </div>
</div>

</body>
</html>
