<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/dragscroll/0.0.8/dragscroll.min.js" ></script>
  <!--폰트-->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Archivo:ital,wght@0,100..900;1,100..900&family=Domine:wght@400..700&display=swap" rel="stylesheet">

  <style>
    body *{
      font-family: "Nanum Myeongjo", serif

    }

    .container {
      max-width: 1600px; /* 최대 너비 설정 */
      display: flex;
      flex-wrap: wrap;
      justify-content: flex-end; /* 오른쪽부터 정렬 */
      padding: 10px;
      flex-direction: row-reverse; /* 오른쪽부터 정렬 */
    }

    .box {
      position: relative;
      color: white;
      flex: 1 1 calc(25% - 2%); /* 4개씩 배치되도록 설정 (25% - 2%는 margin 포함한 크기) */
      max-width: calc(25% - 2%);
      height: 300px;
      margin: 1%;
      border-radius: 16px;
      overflow: hidden;
    }

    .box_background {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      overflow: hidden;
    }
    .box_background img {
      width: 100%;
      height: 100%;
      object-fit: cover; /* 이미지를 부모 요소의 크기에 맞게 조정 */
      right: 0px;
    }

    .content {
      position: absolute;
      bottom: 0;
      right: 0;
      left: 0;
      height: 15%;
      padding: 1rem;
      background: linear-gradient(to bottom left, #EF8D9C 40%, #FFC39E 100%);
      width: 100%;
      box-sizing: border-box;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .content p {
      margin: 0;
      color: white;
      font-size: 20px;
    }

    /* 아이콘 스타일 */

    .icons {
      display: flex;
      align-items: center;
      font-size: 20px;
    }
    .modal-body {
      display: flex;
      justify-content: center; /* 수평 가운데 정렬 */
      align-items: center; /* 수직 가운데 정렬 */
      position: relative; /* 내부 요소들의 위치를 조정하기 위해 relative */

    }

    #portfolio-photo {
      position: relative;
      width: 70%;
      height: auto;
      object-fit: cover;
      display: block;
      margin-top: 60px;
    }


    .modal-title {
      font-size: 28px;
    }

    .modal-dialog {
      max-width: 100%;
    }


    .btn-close {
      font-size: 20px; /* x버튼 사이즈 */
    }

    .modal-footer {
      background-color: #f8f9fa;
      border-top: 1px solid #dee2e6;
      font-size: 20px;
    }

    .buttonbox {

      display: flex;
      overflow-x: auto;
    }

    .buttonbox::-webkit-scrollbar {
      display: none;
    }

    .text{
      font-size: 80px;
      color: black;
      overflow-x: auto;
      gap: 8px;
    }

    /*카테고리 버튼*/
    .ctbutton {
      flex: 1 1 auto; /* 버튼이 가로로 균등하게 늘어나도록 설정 */
      max-width: 350px; /* 버튼의 최대 너비 설정 */
      min-width: 180px; /* 버튼의 최소 너비 설정 */
      color: white;
      background: #feb6d3;
      font-size: 28px;
      border: none;
      border-radius: 15px;
      transition: 0.3s;
      display: flex;

    }

    .ctbutton:hover {
      background-color: black; /* 여기에 버튼의 배경색 반전값을 지정하세요 */


    }


    #profile-photo{
      width: 70px;
      height: 70px;
      background-color: #fff;
      border-radius: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
      cursor: pointer;
      transition: background-color 0.3s;
    }
    /* 아이콘 버튼 */
    .icon-buttons {
      position: absolute;
      right: 15px;
      top: 15px;
      display: flex;
      flex-direction: column; /* 세로 방향으로 버튼 정렬 */
      gap: 15px; /* 버튼 간의 간격 */
    }

    .icon-button {
      width: 70px;
      height: 70px;
      background-color: #fff;
      border-radius: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .icon-button:hover {
      background-color: #f0f0f0;
    }

    .icon-button i {
      font-size: 27px;
      color: #333;
      padding: 0 20px;
    }

    .language-switcher {
      display: flex; /* 버튼들을 가로로 나열 */
      gap: 10px; /* 버튼 사이의 간격 */
      position: fixed; /* 고정 위치 */
      bottom: 20px; /* 화면 아래에서의 거리 */
      left: 90%; /* 중앙 정렬을 위한 좌측 위치 */
      transform: translateX(-50%); /* 중앙 정렬을 위한 변환 */
    }

    .lang-btn {
      font-size: 14pt; /* 줄인 글자 크기 */
      background-color: #feb6d3; /* 버튼 배경색 */
      color: white; /* 글자색 */
      border: none; /* 테두리 없음 */
      border-radius: 5px; /* 둥근 모서리 */
      width: 100px; /* 줄인 버튼 너비 */
      height: 60px; /* 줄인 버튼 높이 */
      cursor: pointer; /* 마우스 커서 변경 */
      transition: background-color 0.3s; /* 배경색 전환 효과 */
    }

    .lang-btn:hover {
      background-color: #0056b3; /* 호버 시 배경색 변화 */
    }


  </style>
  <script>
    $(document).ready(function() {

      $('.ctbutton').on('click', function() {
        var category = $(this).val();

        // 모든 박스를 숨기고 해당 카테고리에 맞는 박스만 표시
        $('.box').hide().filter(function() {
          return $(this).data('category') === category;
        }).show();
      });

      $(document).on('click', '.box', function() {
        var num = $(this).data('num');
        console.log("Sending num: " + num);
        $.ajax({
          url: '/getData',
          type: 'GET',
          data: { num: num },
          success: function(data) {
            console.log(data);
            $('#portfolio-number').val(data.num);
            //$('#portfolio-photo').attr('src',data.port_photo);
            $('#portfolio-subject').text(data.subject);
            $('#portfolio-content').text(data.content);
            $('#portfolio-category').text(data.category);
            // 포트폴리오 사진 처리
            if (data.port_photo) {
              var photoUrls = data.port_photo.split(','); // 쉼표로 구분하여 배열로 변환
              var photoHtml = ''; // HTML 문자열 초기화

              // 각 URL에 대해 이미지 태그 생성
              photoUrls.forEach(function(url) {
                url = url.trim(); // 공백 제거
                if (url) { // URL이 비어있지 않을 때만 추가
                  photoHtml += '<img src="' + url + '" alt="Portfolio Photo" style="width:700px;height:auto;"/> ';
                }
              });
              console.log("data.port_photo= "+data.port_photo);
              console.log("photoHtml= "+photoHtml);
              // 모달에 이미지 추가
              $('#portfolio-photo').html(photoHtml); // 포트폴리오 사진 영역에 이미지 HTML 추가
            } else {
              $('#portfolio-photo').html('<p>No photos available.</p>'); // 사진이 없을 경우 메시지
            }
            $('#myModal').modal('show');
          },
          error: function(xhr, status, error) {
            console.error(xhr.responseText);
          }
        });

        document.getElementById('comment-button').addEventListener('click', function() {
          // 댓글 모달 표시
          const commentModal = new bootstrap.Modal(document.getElementById('comment-modal'));
          commentModal.show();
        });
        document.getElementById('submit-comment').addEventListener('click', function() {
          const content = document.getElementById('comment-content').value;
          //const num = 1; // 게시글 번호는 실제 게시글 번호로 변경 필요

          // AJAX 요청
          fetch('/board/ainsert', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
              num: num,
              content: content
            })
          })
                  .then(response => {
                    if (response.ok) {
                      // 댓글 입력 후 UI 업데이트
                      loadComments(num); // 댓글 목록 로드 함수 호출
                      document.getElementById('comment-content').value = ''; // 입력란 비우기
                      // 모달 닫기
                      const commentModal = bootstrap.Modal.getInstance(document.getElementById('comment-modal'));
                      commentModal.hide();
                    } else {
                      alert('댓글 작성에 실패했습니다.');
                    }
                  })
                  .catch(error => console.error('Error:', error));
        });

// 댓글 목록 로드 함수
        function loadComments(num) {
          fetch(`/board/alist?num=${num}`)
                  .then(response => response.json())
                  .then(comments => {
                    const commentList = document.getElementById('comment-list');
                    commentList.innerHTML = ''; // 기존 댓글 초기화
                    comments.forEach(comment => {
                      const commentElement = document.createElement('div');
                      commentElement.textContent = `${comment.writer}: ${comment.content}`;
                      commentList.appendChild(commentElement);
                    });
                  });
        }

// 페이지 로드 시 댓글 목록 자동으로 불러오기
        window.onload = function() {
          loadComments(num); // 게시글 번호에 맞게 수정
        };

        $.ajax({
          url: '/increaseCount',
          type: 'POST',
          data: { num: num },
          success: function(data) {
            if (data.success) {
              // Update the view count in the UI
              var $viewCount = $('.box[data-num="' + num + '"]').find('.bi-eye-fill').next('span');
              var currentCount = parseInt($viewCount.text());
              $viewCount.text(currentCount + 1);
            }
          },
          error: function(xhr, status, error) {
            console.error(xhr.responseText);
          }
        });

        $.ajax({
          url: '/profile',
          type: 'get',
          data: { num: num },
          dataType: "json",
          success: function(data) {
            $('#profile-photo').attr('src', '../profile/' + data.prof_photo);
          },
          error: function(xhr, status, error) {
            console.error(xhr.responseText);
          }
        });
      });


      $('#heartbtn').on("click", function() {
        // Use the num value stored globally
        let number = $('#portfolio-number').val();
        $.ajax({
          url: '/likePost',
          type: 'get',
          data: { num: number },
          dataType: "json",
          success: function(data) {
            if (data.success === true) {
              // Update the like count in the UI
              var $likeCount = $('.box[data-num="' + number + '"]').find('.bi-heart-fill').next('span');
              var currentCount = parseInt($likeCount.text());
              $likeCount.text(currentCount + 1);

              $('#heartbtn').css('color', 'red'); // 하트를 빨간색으로 변경
            }
          },
          error: function(xhr, status, error) {
            console.error(xhr.responseText);
          }
        });
      });



      $('.icon-button:last-child').click(function() {
        var currentUrl = window.location.href;
        $('#shareUrl').val(currentUrl);
        $('#shareModal').modal('show');

        // 공유하기 기능 구현
        if (navigator.share) {
          navigator.share({
            url: currentUrl,
          })
                  .then(() => {
                    console.log('Successfully shared');
                  })
                  .catch((error) => {
                    console.error('Error sharing:', error);
                  });
        } else {
          // 웹 공유 API를 지원하지 않는 경우 클립보드 복사 기능 구현
          navigator.clipboard.writeText(currentUrl)
                  .then(() => {
                  })
                  .catch((error) => {
                    console.error('Error copying to clipboard:', error);
                  });
        }
      });

      function copyShareUrl() {
        var shareUrl = $('#shareUrl').val();
        navigator.clipboard.writeText(shareUrl)
                .then(() => {
                  alert('Link copied to clipboard!');
                })
                .catch((error) => {
                  console.error('Error copying to clipboard:', error);
                })
      }

      // 프로필 사진 아이콘 클릭 이벤트 핸들러
      $('.icon-button:first-child').click(function() {
        var num = $('.box[data-num]').data('num');

        $.ajax({
          url: '/getUserData',
          type: 'GET',
          data: { num: num },
          success: function(data) {
            $('#userName').text(data.name);
            $('#userPhoto').attr('src', '../profile/' + data.prof_photo);
            $('#userEmail').text(data.email);
            $('#userCategory').text(data.category);

            $('#userModal').modal('show');
          },
          error: function(xhr, status, error) {
            console.error(xhr.responseText);
          }
        });
      });

      // 모달이 닫힐 때 이전 페이지로 이동하는 함수
      function closeModalAndReload() {
        $('#myModal').modal('hide'); // 모달을 닫음
        window.location.reload(); // 이전 페이지로 새로 고침
      }

      // 모달 닫힘 이벤트 리스너 등록
      $('#myModal').on('hidden.bs.modal', function () {
        closeModalAndReload(); // 모달이 닫히면 이전 페이지로 이동
      });
    });


    $(document).ready(function() {
      $('.buttonbox').slick({
        dots: true,
        infinite: true,
        speed: 1200,
        slidesToShow: 5,  // 한 화면에 보여줄 슬라이드 개수
        slidesToScroll: 3, // 한 번에 넘어가는 슬라이드 개수
        variableWidth: true
      });
    });

    function changeLanguage(locale) {
      console.log(locale);
      fetch('/changeLanguage?locale=' + locale)
              .then(response => {
                if (!response.ok) {
                  throw new Error('Network response was not ok');
                }
                return response.json();
              })
              .then(data => {
                console.log(data);
                // 모든 요소를 반복하여 각 키에 대해 텍스트를 업데이트
                document.querySelectorAll('[data-lang]').forEach((element) => {
                  const key = element.getAttribute('data-lang');
                  // 키가 data 객체에 존재하는지 확인
                  if (data[key]) {
                    element.textContent = data[key];
                  } else {
                    console.warn(`No translation found for key: ${key}`); // 번역이 없을 경우 경고
                  }
                });
              })
              .catch(error => {
                console.error('Error fetching language data:', error);
              });
    }

    $(document).on('click', '#download-pdf', function() {
      const { jsPDF } = window.jspdf;
      const doc = new jsPDF();

      const images = $('#portfolio-photo img');
      let yOffset = 10;
      let imagePromises = [];

      images.each(function() {
        const imgSrc = $(this).attr('src');
        console.log('Image source:', imgSrc);

        // 파일 확장자 추출
        let format;
        const extensionMatch = imgSrc.match(/\.(png|jpg|jpeg)$/i);

        if (extensionMatch) {
          const extension = extensionMatch[1].toLowerCase();
          format = (extension === 'png') ? 'PNG' : 'JPEG';
        } else {
          // 확장자가 없는 경우 기본 형식을 JPEG로 설정
          format = 'JPEG';
        }

        const imgPromise = new Promise((resolve, reject) => {
          const img = new Image();
          img.src = imgSrc;
          img.onload = () => {
            doc.addImage(imgSrc, format, 10, yOffset, 180, 160);
            yOffset += 170;
            resolve();
          };
          img.onerror = reject; // 이미지 로드 실패 시 reject
        });
        imagePromises.push(imgPromise);
      });

      Promise.all(imagePromises)
              .then(() => {
                doc.save('portfolio.pdf');
              })
              .catch(error => {
                console.error('Error loading images:', error);
              });
    });

  </script>
</head>
<body>

<b class="text" data-lang="explore" style="margin-top: 200px; display: block;">
  <fmt:message key="explore" />
</b><br>
<div class="buttonbox">
  <button class="ctbutton" data-lang="graphic_design"><fmt:message key="graphic_design" /></button>
  <button class="ctbutton" data-lang="video_motion_graphics"><fmt:message key="video_motion_graphics" /></button>
  <button class="ctbutton" data-lang="character_design"><fmt:message key="character_design" /></button>
  <button class="ctbutton" data-lang="digital_art"><fmt:message key="digital_art" /></button>
  <button class="ctbutton" data-lang="illustration"><fmt:message key="illustration" /></button>
  <button class="ctbutton" data-lang="fine_art"><fmt:message key="fine_art" /></button>
  <button class="ctbutton" data-lang="branding_editing"><fmt:message key="branding_editing" /></button>
  <button class="ctbutton" data-lang="ui_ux"><fmt:message key="ui_ux" /></button>
  <button class="ctbutton" data-lang="product_package_design"><fmt:message key="product_package_design" /></button>
  <button class="ctbutton" data-lang="typography"><fmt:message key="typography" /></button>
  <button class="ctbutton" data-lang="photography"><fmt:message key="photography" /></button>
  <button class="ctbutton" data-lang="craft"><fmt:message key="craft" /></button>
</div>

<div class="container">
  <c:forEach var="dto" items="${boardList}">
    <div class="box" data-num="${dto.num}" data-category="${dto.category}">
      <div class="box_background"> <img src="${fn:split(dto.port_photo, ',')[0]}" alt="Thumbnail" style="width: 100%; height: 100%;"></div>

      <div class="content">
        <p class="userId" style="margin: 0;">${dto.userId}</p>
        <div class="icons">
          <i class="bi bi-heart-fill" style="margin-right: 5px;">
            <span style="color: white; margin: 10px;">${dto.like_count}</span>
          </i> <!-- 하트 아이콘 -->

          <i class="bi bi-eye-fill"> <!-- 조회 아이콘 -->
            <span style="color: white; margin: 10px;">${dto.count}</span>
          </i>
        </div>
      </div>
    </div>
  </c:forEach>
</div>

<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <input hidden="hidden" value="" id="portfolio-number">
        <h4 class="modal-title"><span id="portfolio-subject"></span></h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="portfolio-details">
        <div id="portfolio-photo">

        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

        <div class="icon-buttons">

          <div class="icon-button" onclick="location.href='/board/mypageform?userId=sup3537'"><img id="profile-photo" src="" alt="Profile Photo" onerror="this.src='../image/K-045.png'"></div>
          <div class="icon-button" style="background-color: #f75172"><i id=heartbtn class="bi bi-heart-fill" style="color: white"></i></div>
          <div class="icon-button" style="background-color: #1bcad3" ><i id="comment-button" class="bi bi-chat-dots-fill" style="color: white"></i></div>
          <div class="icon-button">
            <a href="#" id="download-pdf" style="color: white; text-decoration: none;">
              <i class="bi bi-file-earmark-pdf" style="font-size: 24px;"></i>
            </a>
          </div>
          <div class="icon-button"><i class="bi bi-share-fill"></i></div>
        </div>

      </div>
      <div class="modal-footer">
        <p><strong>Content:</strong> <span id="portfolio-content"></span></p>
        <p><strong>Category:</strong> <span id="portfolio-category"></span></p>
      </div>
    </div>
  </div>
</div>

<!-- 공유하기 모달 -->
<div id="shareModal" class="modal fade" role="dialog" >
  <div class="modal-dialog" style="max-width: 400px;
      margin: 1.75rem auto;">
    <div class="modal-content" style="border-radius: 20px;">
      <div class="modal-header">
        <h4 class="modal-title">Share this portfoilo</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input type="text" class="form-control" id="shareUrl" readonly>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" onclick="copyShareUrl()">Copy Link</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- 댓글 모달 -->
<div id="comment-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">댓글 입력</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <textarea id="comment-content" placeholder="댓글을 입력하세요" style="width: 100%; height: 100px;"></textarea>
      </div>
      <div class="modal-footer">
        <button id="submit-comment" class="btn btn-primary">댓글 작성</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 유저 정보 모달 -->
<div id="userModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="userName"></h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <img id="userPhoto" src="" alt="User Photo" style="width: 150px; height: 150px; border-radius: 50%;">
        <p><strong>Email:</strong> <span id="userEmail"></span></p>
        <p><strong>Category:</strong> <span id="userCategory"></span></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<div class="language-switcher">
  <button class="lang-btn" onclick="changeLanguage('en')">English</button>
  <button class="lang-btn" onclick="changeLanguage('ko')">한국어</button>
</div>
</body>
</html>