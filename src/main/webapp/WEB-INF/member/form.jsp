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
        body, input {
            font-family: 'YEONGJUPunggiGinsengTTF';
        }

        div.title {
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
        .form-profile-img {
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
        let jungbok = false;

        $(function () {
            $("#myfile").change(function () {
                let reg = /(.*?)\/(jpg|jpeg|png|gif)$/;
                let f = $(this)[0].files[0];
                if (!f.type.match(reg)) {
                    alert("이미지 파일만 가능합니다");
                    return;
                }
                if (f) {
                    let reader = new FileReader();
                    reader.onload = function (e) {
                        $("#showimg1").attr("src", e.target.result);
                    }
                    reader.readAsDataURL($(this)[0].files[0]);
                }
            });

            $("#btncheckid").click(function () {
                if ($("#userId").val() == '') {
                    alert("가입할 아이디를 입력해주세요");
                    return;
                }

                $.ajax({
                    type: "get",
                    dataType: "json",
                    url: "./idcheck",
                    data: { "searchid": $("#userId").val() },
                    success: function (data) {
                        if (data.count == 0) {
                            $("#userIdMessage").text("가입 가능한 아이디입니다").removeClass('text-danger').addClass('text-success');
                            jungbok = true;
                        } else {
                            $("#userIdMessage").text("이미 가입되어있는 아이디입니다").removeClass('text-success').addClass('text-danger');
                            jungbok = false;
                            $("#userId").val("");
                        }
                    }
                });
            });

            $("#userId").keyup(function () {
                jungbok = false;
            });

            $('#btncheckEmail').on('click', function () {
                var email = $('#email').val();
                if (email === "") {
                    $("#emailMessage").text("이메일을 입력하세요.").removeClass('text-success').addClass('text-danger');
                    return;
                }

                $.ajax({
                    url: "/login/mailConfirm",
                    type: "POST",
                    data: { email: email },
                    success: function (checkNum) {
                        alert("인증번호가 이메일로 발송되었습니다. 이메일을 확인하고 인증번호를 입력하세요.");
                        $('#emailCode').data('sentCode', checkNum);
                    },
                    error: function () {
                        alert("이메일 인증에 실패했습니다. 다시 시도해주세요.");
                    }
                });
            });

            $('#btncheckCode').on('click', function () {
                var enteredCode = $('#emailCode').val();
                var sentCode = $('#emailCode').data('sentCode');

                if (enteredCode === "") {
                    $("#codeMessage").text("인증번호를 입력하세요.").removeClass('text-success').addClass('text-danger');
                    return;
                }

                if (enteredCode === sentCode) {
                    $("#codeMessage").text("인증이 성공적으로 완료되었습니다.").removeClass('text-danger').addClass('text-success');
                } else {
                    $("#codeMessage").text("인증번호가 일치하지 않습니다. 다시 확인해주세요.").removeClass('text-success').addClass('text-danger');
                }
            });

            // 분야 선택 시 세부 분야 동적으로 변경
            $('#category').change(function () {
                let selectedCategory = $(this).val();
                $('#subcategory-container').show();
                $('#subcategory').empty(); // 이전 항목 제거

                let subcategories = {
                    '인문학': ['철학', '문학', '역사', '문화 연구', '사회학', '언어학'],
                    '의료 및 건강': ['의사', '간호사', '약사', '물리치료사', '임상병리사', '정신건강 전문가'],
                    '공학': ['기계공학', '전기공학', '컴퓨터공학', '토목공학', '화학공학', '소프트웨어 개발', '정보 보안'],
                    '자연과학': ['물리학', '화학', '생물학', '지구과학', '환경과학', '천문학'],
                    '예술 및 디자인': ['회화', '조각', '디자인', '사진', '패션 디자인', '그래픽 디자인', '영상 제작'],
                    '체육 및 스포츠': ['축구', '농구', '수영', '체육 교육', '운동 생리학', '스포츠 경영'],
                    '음악': ['클래식', '재즈', '팝', '작곡', '음악 교육', '음향 기술', '사운드 디자인'],
                    '정보기술': ['프로그래밍', '데이터 과학', '네트워크 관리', 'UI/UX 디자인', '웹 개발', 'AI 및 머신러닝'],
                    '비즈니스 및 경제': ['경영학', '회계학', '마케팅', '인사 관리', '재무 분석', '운영 관리'],
                    '법률': ['법학', '형사법', '민사법', '국제법', '지적 재산권', '법률 상담']
                };

                if (subcategories[selectedCategory]) {
                    $.each(subcategories[selectedCategory], function (index, value) {
                        $('#subcategory').append('<option value="' + value + '">' + value + '</option>');
                    });
                }
            });
        });

        function check() {
            if (!jungbok) {
                alert("아이디 중복확인을 해주세요");
                return false; // false 반환 시 action 실행을 안함
            }
        }
    </script>
</head>
<body style="background-image: url('/image/ backgroundimg.jpg'); background-size: cover; background-position: center;">

<div class="container">
    <div class="title" onclick="location.href='/board/boardlist'">Allio</div>
    <h3 class="text-center mb-4"><fmt:message key="sign_up_header" /></h3>
    <form action="./insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
        <div class="form-group">
            <label for="name"><fmt:message key="name_label" /></label>
            <input type="text" id="name" name="name" class="form-control" required />
        </div>
        <div class="form-group">
            <label for="userId"><fmt:message key="id_label" /></label>
            <input type="text" id="userId" name="userId" class="form-control" required />
            <button type="button" id="btncheckid" class="btn btn-danger"><fmt:message key="check_id_btn" /></button>
            <span id="userIdMessage"></span>
        </div>
        <div class="form-group">
            <label for="email"><fmt:message key="email_label" /></label>
            <input type="email" id="email" name="email" class="form-control" required />
            <button type="button" id="btncheckEmail" class="btn btn-danger"><fmt:message key="send_email_btn" /></button>
            <span id="emailMessage"></span>
        </div>
        <div class="form-group">
            <label for="emailCode"><fmt:message key="verification_code_label" /></label>
            <input type="text" id="emailCode" name="emailCode" class="form-control" required />
            <button type="button" id="btncheckCode" class="btn btn-danger"><fmt:message key="check_code_btn" /></button>
            <span id="codeMessage"></span>
        </div>
        <div class="form-group">
            <label for="category"><fmt:message key="category_label" /></label>
            <select id="category" name="category" class="form-control" required>
                <option value=""><fmt:message key="select_category" /></option>
                <option value="인문학"><fmt:message key="category_humanities" /></option>
                <option value="의료 및 건강"><fmt:message key="category_health" /></option>
                <option value="공학"><fmt:message key="category_engineering" /></option>
                <option value="자연과학"><fmt:message key="category_natural_science" /></option>
                <option value="예술 및 디자인"><fmt:message key="category_art_design" /></option>
                <option value="체육 및 스포츠"><fmt:message key="category_sports" /></option>
                <option value="음악"><fmt:message key="category_music" /></option>
                <option value="정보기술"><fmt:message key="category_information_technology" /></option>
                <option value="비즈니스 및 경제"><fmt:message key="category_business_economics" /></option>
                <option value="법률"><fmt:message key="category_law" /></option>
            </select>
        </div>
        <div id="subcategory-container" class="form-group" style="display: none;">
            <label for="subcategory"><fmt:message key="subcategory_label" /></label>
            <select id="subcategory" name="subcategory" class="form-control"></select>
        </div>
        <div class="form-group">
            <label for="passwd"><fmt:message key="password_label" /></label>
            <input type="password" id="passwd" name="passwd" class="form-control" required />
        </div>
        <div class="form-group">
            <label for="myfile"><fmt:message key="profile_image_label" /></label>
            <input type="file" id="myfile" name="myfile" accept="image/*" class="form-control" />
            <div class="form-profile-img">
                <img id="showimg1" src="#" alt="Preview" style="display: none; max-width: 100%;" />
            </div>
        </div>
        <button type="submit" class="btn btn-danger btn-block"><fmt:message key="sign_up_btn" /></button>
    </form>
</div>

<!— 부트스트랩 JS —>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
