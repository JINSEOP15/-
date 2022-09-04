<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/views/includes/header.jsp" %>

 <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,600,700"
    rel="stylesheet">
  
  
 <!-- ======= inquiry ======= -->
  <div id="inquiry" class="section-bg">
    <div class="inquiry-top">
      <div class="container">

        <div class="row">

          <div class="col-lg-6">

            <div class="row">

              <div class="col-sm-6">

                <div class="inquiry-info">
                  <h3>Dev'ils</h3>
                  <p>홈페이지 활동과 관련된 모든 불편 또는 문의사항을 받고,
                    개선하기 위하여 노력하고 있습니다.<br><br>
                  </p>
                </div>

              </div>

              <!-- 줄 맞추기 위해 추가-->
              <div class="col-sm-2">

              </div>

              <div class="col-sm-6">

                <div class="inquiry-cont">
                  <h4>Contact Us</h4>
                  <p>
                    강남구 서초동 AA빌딩 251-1 <br>
                    <strong>Phone :</strong> 1800-5011<br>
                    <strong>Email :</strong> devilsdotcom@gmail.com<br>
                  </p>
                </div>

              </div>

            </div>

          </div>

          <div class="col-lg-6">

            <div class="form">

              <h3> 문의하기 </h3>
              <p>문의 답변은 평일 10:00-18:00 사이에 이루어집니다.<br>
                문의가 많을 경우 답변 기간이 이틀 이상 소요될 수 있습니다.
              </p>

              <form action="/board/user/Ask/AskReg" method="post" class="inquiry-form">
                <div class="form-group">
                  <input type="text" name="userid" value='<sec:authentication property="principal.username"/>' 
                  class="form-control" id="name" placeholder="이름(닉네임)" readonly>
                </div>
                <div class="form-group mt-3">
                  <label for="select">분류</label>
                  <select name="select">
                    <option value="홈페이지 관련">홈페이지 관련</option>
                    <option value="회원신고">회원신고</option>
                    <option value="기타">기타</option>
                  </select>
                </div>
                <div class="form-group mt-3">
                  <input type="text" class="form-control" name="title" id="subject" placeholder="제목" required>
                </div>
                <div class="form-group mt-3">
                  <textarea class="form-control" name="content" rows="5" placeholder="내용" required></textarea>
                </div>

                <div class="my-3">
                  <div class="loading">Loading</div>
                  <div class="error-message"></div>
                  <div class="sent-message">문의내역이 등록되었습니다. 감사합니다!</div>
                </div>

                <div class="text-center">
                <button type="submit" title="Send Message">문의하기</button></div>
              </form>

            </div>

          </div>

        </div>

      </div>
    </div>
  </div><!-- End  inquiry -->
<hr>

  <!-- Vendor JS Files -->
  <script src="/resources/dist/js/aos.js"></script>
 
 


  <!-- Main JS File -->
  <script src="/resources/dist/js/main.js"></script>
  
  <%@include file="/WEB-INF/views/includes/footer.jsp" %>