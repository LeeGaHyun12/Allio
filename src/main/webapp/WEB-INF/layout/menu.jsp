<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <!--폰트-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Archivo:ital,wght@0,100..900;1,100..900&family=Domine:wght@400..700&display=swap" rel="stylesheet">


    <style>
        body *{
            font-family: "Archivo", sans-serif;

        }

        .write{
            margin-top: 150px;
            height: 600px;
            width: 2200px;
        }


        .write> b{
            font-size: 110px;
            color: white;
        }



        .writebox{
            margin-top: 50px;
            display: flex; /* 버튼 안의 내용물을 가로 중앙 정렬하기 위해 추가 */
            justify-content: center; /* 버튼 안의 내용물을 가로 중앙 정렬하기 위해 추가 */
            align-items: center; /* 버튼 안의 내용물을 세로 중앙 정렬하기 위해 추가 */
        }

        .btnwrite {
            height: 60px;
            width: 220px;
            color: #fff;
            background: #ff5649;
            font-size: 28px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: flex; /* 버튼 안의 내용물을 가로 중앙 정렬하기 위해 추가 */
            justify-content: center; /* 버튼 안의 내용물을 가로 중앙 정렬하기 위해 추가 */
            align-items: center; /* 버튼 안의 내용물을 세로 중앙 정렬하기 위해 추가 */
        }

        .btnwrite:hover {
            background-color: black; /* 여기에 버튼의 배경색 반전값을 지정하세요 */
            mix-blend-mode: difference; /* 블렌드 모드를 사용하여 반전 효과를 적용합니다. */

        }

        .btnwrite:active {
            transform: translateY(2px);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        /* 반응형 조정 */
        @media (max-width: 768px) {
            .write > b {
                font-size: 8vw; /* 작은 화면에서 더 큰 텍스트 크기 */
            }

            .btnwrite {
                width: 80%; /* 작은 화면에서는 버튼을 80% 너비로 조정 */
                font-size: 1.2rem; /* 작은 화면에서 글자 크기 감소 */
            }
        }

    </style>
</head>
<body>
<div class="container">
    <div class="write"><b class="Create you" data-lang="create_portfolio_text"><fmt:message key="create_portfolio_text" /></b><br><br>
        <b data-lang="portfolio_and_designs"><fmt:message key="portfolio_and_designs" /></b>
        <div class="writebox">
        <button class="btnwrite" onclick="location.href='/board/writeform'" data-lang="get_started_button"><fmt:message key="get_started_button" /></button>
    </div>
    </div>

</div>
</body>
</html>
