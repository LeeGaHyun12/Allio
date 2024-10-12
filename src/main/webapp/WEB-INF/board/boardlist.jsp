<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      margin-top: 20px;
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
        $.ajax({
          url: '/getData',
          type: 'GET',
          data: { num: num },
          success: function(data) {
            $('#portfolio-number').val(data.num);
            $('#portfolio-photo').attr('src', '../photo/' + data.port_photo);
            $('#portfolio-subject').text(data.subject);
            $('#portfolio-content').text(data.content);
            $('#portfolio-category').text(data.category);

            $('#myModal').modal('show');
          },
          error: function(xhr, status, error) {
            console.error(xhr.responseText);
          }
        });


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


      $('#heartbtn').on("click",function (){
        // Use the num value stored globally
        let number = $('#portfolio-number').val();
        $.ajax({
          url: '/likePost',
          type: 'get',
          data: { num: number },
          dataType: "json",
          success: function(data) {

            if (data.success===true) {
              // Update the like count in the UI
              var $likeCount = $('.box[data-num="' + num + '"]').find('.bi-heart-fill').next('span');
              var currentCount = parseInt($likeCount.text());
              $likeCount.text(currentCount + 1);
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



  </script>
</head>
<body>

<b class="text">Explore inspiring designs</b><br>

<div class="buttonbox">
  <button class="ctbutton" value="graphic_design"># Graphic Design</button>
  <button class="ctbutton" value="video_motion_graphics"># Video/Motion Graphics</button>
  <button class="ctbutton" value="character_design"># Character Design</button>
  <button class="ctbutton" value="digital_art"># Digital Art</button>
  <button class="ctbutton" value="illustration"># Illustration</button>
  <button class="ctbutton" value="fine_art"># Fine Art</button>
  <button class="ctbutton" value="branding_editing"># Branding/Editing</button>
  <button class="ctbutton" value="ui_ux"># UI/UX</button>
  <button class="ctbutton" value="product_package_design"># Product/Package Design</button>
  <button class="ctbutton" value="typography"># Typography</button>
  <button class="ctbutton" value="photography"># Photography</button>
  <button class="ctbutton" value="craft"># Craft</button>
</div>


<div class="container">
  <c:forEach var="dto" items="${boardList}">
    <div class="box" data-num="${dto.num}" data-category="${dto.category}">
      <div class="box_background"><img src="../photo/${dto.port_photo}"></div>

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
        <img id="portfolio-photo" src="" alt="Portfolio Photo">
        <div class="icon-buttons">

          <div class="icon-button" onclick="location.href='/board/mypageform?userId=sup3537'"><img id="profile-photo" src="" alt="Profile Photo" onerror="this.src='../image/K-045.png'"></div>
          <div class="icon-button" style="background-color: #f75172"><i id=heartbtn class="bi bi-heart-fill" style="color: white"></i></div>
          <div class="icon-button" style="background-color: #1bcad3"><i class="bi bi-chat-dots-fill" style="color: white"></i></div>
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
</body>
</html>