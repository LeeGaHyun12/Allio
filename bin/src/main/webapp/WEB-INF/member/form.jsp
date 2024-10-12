<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- jQuery 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <title>회원 가입</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 사용자 정의 CSS -->
    <style>

        @font-face {
            font-family: 'YEONGJUPunggiGinsengTTF';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/YEONGJUPunggiGinsengTTF.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        body *{
            font-family: 'YEONGJUPunggiGinsengTTF';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/YEONGJUPunggiGinsengTTF.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        body,input {
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
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-profile-img{
            float: right;
            width: 300px;
            display: flex; /* 부모 요소를 가로 정렬로 설정 */
            align-items: center; /* 아이템들을 세로 중앙 정렬 */
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
    <script type="text/javascript">
        let jungbok=false;

        $(function(){
            $("#myfile").change(function(){
                //console.log($(this)[0]);//type 이 file 인경우 배열타입으로 넘어온다
                let reg=/(.*?)\/(jpg|jpeg|png|gif)$/;
                let f=$(this)[0].files[0];
                if(!f.type.match(reg)){
                    alert("이미지 파일만 가능합니다");
                    return;
                }
                if(f){
                    let reader=new FileReader();
                    reader.onload=function(e){
                        $("#showimg1").attr("src",e.target.result);
                    }
                    reader.readAsDataURL($(this)[0].files[0]);
                }
            });

            //중복버튼 이벤트
            $("#btncheckid").click(function(){
                if($("#userId").val()==''){
                    alert("가입할 아이디를 입력해주세요");
                    return;
                }

                $.ajax({
                    type:"get",
                    dataType:"json",
                    url:"./idcheck",
                    data:{"searchid":$("#userId").val()},
                    success:function(data){
                        if(data.count==0){
                            alert("가입 가능한 아이디입니다");
                            jungbok=true;
                        }else{
                            alert("이미 가입되어있는 아이디입니다");
                            jungbok=false;
                            $("#userId").val("");
                        }
                    }
                });
            });

            //아이디를 입력시 다시 중복확인을 누르도록 중복변수를 초기화
            $("#userId").keyup(function(){
                jungbok=false;
            });
        });  //close function


        function check()
        {
            if(!jungbok){
                alert("아이디 중복확인을 해주세요");
                return false;//false반환시 action 실행을 안함
            }
        }
    </script>
</head>
<body style="background-image: url('/image/ backgroundimg.jpg'); background-size: cover; background-position: center;">

<div class="container">
    <div class="title" onclick="location.href='/board/boardlist'">Allio</div>
    <h3 class="text-center mb-4">회원 가입</h3>
    <form action="./insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" id="name" name="name" class="form-control" required>
        </div>

        <div class="form-group-id" style="width: 300px;">
            <label for="userId">아이디</label>
            <input type="text" id="userId" name="userId" class="form-control" required>
            &nbsp;
            <button type="button" class="btn btn-sm btn-danger"
                    id="btncheckid">중복확인</button>
        </div>

        <div class="form-group">
            <label for="email">이메일</label>
            <input type="email" id="email" name="email" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="passwd">비밀번호</label>
            <input type="password" id="passwd" name="passwd" class="form-control" required maxlength="8">
        </div>

        <div class="form-profile" style="width: 300px;">
            <div class="form-profile-img">
                <img src="" id="showimg1" style="width: 100px; margin: 10px;"
                     onerror="this.src='../image/saram.png'" class="rounded-circle">
                <input type="file" id="myfile" name="myfile" class="form-control" required style="width: 400px;">
            </div>


        </div>

        <div class="form-group">
            <label for="category">분야</label>
            <table class="table">
                <tr>
                    <td><input type="checkbox" id="graphic_design" name="category" value="graphic_design"><label for="graphic_design">그래픽 디자인</label></td>
                    <td><input type="checkbox" id="branding_editing" name="category" value="branding_editing"><label for="branding_editing">브랜딩/편집</label></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="video_motion_graphics" name="category" value="video_motion_graphics"><label for="video_motion_graphics">영상/모션그래픽</label></td>
                    <td><input type="checkbox" id="ui_ux" name="category" value="ui_ux"><label for="ui_ux">UI/UX</label></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="character_design" name="categories" value="character_design"><label for="character_design">캐릭터 디자인</label></td>
                    <td><input type="checkbox" id="product_package_design" name="category" value="product_package_design"><label for="product_package_design">제품/패키지 디자인</label></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="digital_art" name="category" value="digital_art"><label for="digital_art">디지털 아트</label></td>
                    <td><input type="checkbox" id="typography" name="category" value="typography"><label for="typography">타이포그래피</label></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="illustration" name="category" value="illustration"><label for="illustration">일러스트레이션</label></td>
                    <td><input type="checkbox" id="photography" name="category" value="photography"><label for="photography">포토그래피</label></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="fine_art" name="category" value="fine_art"><label for="fine_art">파인아트</label></td>
                    <td><input type="checkbox" id="craft" name="category" value="craft"><label for="craft">공예</label></td>
                </tr>
            </table>
        </div>


        <div class="form-group text-center">

            <button type="submit" class="btn btn-danger btn-block">회원가입</button>
        </div>
    </form>
</div>

<!— 부트스트랩 JS —>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

