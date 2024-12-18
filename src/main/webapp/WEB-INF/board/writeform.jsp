<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>게시물 작성</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        @font-face {
            font-family: 'YEONGJUPunggiGinsengTTF';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/YEONGJUPunggiGinsengTTF.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        body *{
            font-family: 'YEONGJUPunggiGinsengTTF';
        }
        input[type="submit"], input[type="file"], input[type="text"], textarea {
            width: 100%;
            padding: 5px;
            outline: none;
            border-radius: 10px;
            border: 0.2px solid black;
        }
        button {
            border-radius: 10px;
            margin: 5px;
            flex: 1 1 30%;
            text-align: center;
        }
        button.selected {
            background-color: #ea4c89;
            color: white;
        }
        fieldset {
            padding: 20px 40px;
        }
        #previewContainer {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 10px;
        }
        .preview-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        @media (max-width: 768px) {
            #preview-container img {
                max-width: 45%;
            }
        }
        @media (max-width: 576px) {
            #preview-container img {
                max-width: 100%;
            }
        }
    </style>

    <script>
        $(function(){
            $("#upload").change(function(){
                const reg = /(.*?)\/(jpg|jpeg|png|gif|PNG|JPG|JPEG)$/;
                const files = $(this)[0].files;
                $("#preview-container").empty();

                Array.from(files).forEach((file, index) => {
                    if (!file.type.match(reg)) {
                        alert("이미지 파일만 가능합니다");
                        return;
                    }

                    const reader = new FileReader();
                    reader.onload = function(e) {
                        const fileItem = $("<div>").addClass("file-item");
                        const img = $("<img>").attr("src", e.target.result).addClass("preview-image");
                        const description = $("<textarea>").attr("name", `description${index}`)
                            .attr("placeholder", "사진에 대한 설명을 입력해주세요").attr("rows", 3);

                        fileItem.append(img).append(description);
                        $("#preview-container").append(fileItem);
                    }
                    reader.readAsDataURL(file);
                });
            });
            // 카테고리 버튼 선택
            $('button.category-btn').click(function() {
                $('button.category-btn').removeClass('selected');
                $(this).addClass('selected');
                $('#category').val($(this).data("value"));
            });
        });
    </script>
</head>

<body>
<form action="./upload" method="post" enctype="multipart/form-data">
    <div class="title" onclick="location.href='/board/boardlist'">Allio</div>
    <fieldset>
        <legend><fmt:message key="post_creation_legend" /></legend>

        <div class="form-control">
            <label for="subject"><fmt:message key="title_label" /></label>
            <input type="text" id="subject" name="subject" placeholder="<fmt:message key='title_placeholder' />" required />
        </div>

        <div class="form-control">
            <label for="upload"><fmt:message key="file_upload_label" /></label>
            <input type="file" id="upload" name="upload" multiple required />
            <div id="preview-container"></div> <!-- 이미지 및 설명 입력 영역 -->
        </div>

        <div class="form-control">
            <label><fmt:message key="category_label2" /></label>
            <div id="category-buttons">
                <button type="button" class="category-btn" data-value="인문학"><fmt:message key="category_humanities" /></button>
                <button type="button" class="category-btn" data-value="의료 및 건강" ><fmt:message key="category_health" /></button>
                <button type="button" class="category-btn" data-value="공학"><fmt:message key="category_engineering" /></button>
                <button type="button" class="category-btn" data-value="자연과학"><fmt:message key="category_natural_science" /></button>
                <button type="button" class="category-btn" data-value="예술 및 디자인"><fmt:message key="category_art_design" /></button>
                <button type="button" class="category-btn" data-value="체육 및 스포츠"><fmt:message key="category_sports" /></button>
                <button type="button" class="category-btn" data-value="음악"><fmt:message key="category_music" /></button>
                <button type="button" class="category-btn" data-value="정보기술"><fmt:message key="category_information_technology" /></button>
                <button type="button" class="category-btn" data-value="비즈니스 및 경제"><fmt:message key="category_business_economics" /></button>
                <button type="button" class="category-btn" data-value="법률"><fmt:message key="category_law" /></button>
            </div>
            <input type="hidden" id="category" name="category" required>
        </div>

        <div class="form-control">
            <label><fmt:message key="duration_label" /></label>
            <br/>
            <label for="startDate"><fmt:message key="start_date_label" /></label>
            <input type="date" id="startDate" name="startDate" required>
            <br/>
            <label for="endDate"><fmt:message key="end_date_label" /></label>
            <input type="date" id="endDate" name="endDate" required>
        </div>

        <div class="form-control">
            <label for="content"><fmt:message key="content_label" /></label>
            <textarea id="content" name="content" cols="40" rows="10" placeholder="<fmt:message key='content_placeholder' />" required></textarea>
        </div>

        <input type="submit" value="<fmt:message key='submit_button' />" class="submit-btn" />
    </fieldset>
</form>
</body>
</html>
