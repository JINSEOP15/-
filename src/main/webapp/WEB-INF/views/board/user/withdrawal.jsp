<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/includes/header.jsp"%>

<!-- CSS Files -->
<link rel="stylesheet" href="/resources/dist/css/withdrawal.css">

<section id="withdrawal" class="withdrawal section">
   <div class="container">
      <h2 class="title">회원탈퇴</h2>
      <div class="withdrawal-inner">
         <div class="info">
            <h4>회원 탈퇴 전, 안내 사항을 꼭 확인해주세요.</h4>
            <br>
            <p>
               <strong>1. 탈퇴 아이디 복구 불가 </strong> <br> 탈퇴 후에는 아이디와 데이터 복구가
               불가능합니다.<br> 신중하게 선택해주세요.
            </p>
            <p>
               <strong>2. 서비스 이용 기록 삭제</strong> <br> 프로필 등록 정보, 게시글 등의 <br>
               서비스 이용 기록이 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다. <br> 필요한 데이터는 미리 백업을
               해두시기 바랍니다.
            </p>
         </div>
         <hr class="mid">
         <!--//info-->
         <div class="alert-box">
            <div class="check">
               <p class="intro">
                  <br> <input type="checkbox" id="check" value="agree">안내 사항을
                  모두 확인했으며 이에 동의합니다.
               </p>

            </div>
            <!--//check-->
            
            <form id="userRmForm" action="/board/user/userRemove" method="post">
	            <div id="userRm" class="btn-container  text-center">
		<button type="submit" class="btn btn-cta-secondary">회원탈퇴</button>
	                <input type="hidden" value="<sec:authentication property="principal.username"/>" name="userid" />
	            </div>
            </form>
            <!--//btn-container-->
         </div>
         <!--//alert-box-->
      </div>
      <!--//withdrawal-inner-->
   </div>
   <!--//container-->
</section>

<script type="text/javascript">
$(document).ready(function () {
   
   $("#userRm").on("click", function(e){
      
      if(! $("input[id = 'check']").is(":checked")){
         
         alert("안내 사항에 동의하셔야 합니다.");
         console.log("동의 안 함");
            
         return false;
         
      }
      
      $("#userRmForm").submit();
   });
});
</script>