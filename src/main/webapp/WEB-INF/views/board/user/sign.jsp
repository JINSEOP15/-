<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<link href="/resources/dist/css/sign.css" rel="stylesheet">
<link href="/resources/dist/css/login.css" rel="stylesheet">

<style>
#overlappedID {
	background-color: GhostWhite;
	width: 15%;
	height: 40px;
}

.messagef {
	color: red;
	font-style: Italic;
}

.messaget {
	color: blue;
	font-style: Italic;
}
</style>

	<section class="sec">
		<br><br>
		<div>
			<h3 style="text-align: center;">
				<b>회원가입</b>
			</h3>
		</div>
		<hr>
		<br>
		<div class="text">
			<p>
				<b>이름</b>
			</p>
			<p>
				<b>아이디</b>
			</p>
			<p>
				<b>비밀번호</b>
			</p>
			<p>
				<b>비밀번호 확인</b>
			</p>
			<p>
				<b>전화번호</b>
			</p>
		</div>
		<form action="/board/user/sign" method="post" id="join">
        <div class="input">
         <input type="text" name="username" id="username" placeholder="이름을 입력해주세요" required>
         <br> <input type="text" name="userid" id="userid" placeholder="아이디를 입력해주세요" required>                  
               <button class="overlappingID" type="button">중복확인</button>
               <input type="hidden" id="check" value="false">
           </div>
        <div class="input2">
         <br> <input type="password" name="userpw" id="userpw" placeholder="비밀번호를 입력해주세요" required> <br> 
         <input type="password" name="pwdcheck" id="pwdcheck" placeholder="비밀번호를 한번 더 입력해주세요" required> <br> 
         <input type="tel" name="userphone" id="userphone" placeholder="010-1234-5678" required>
        </div>
      <div class="radio">
         <input type="radio" name="radio1">데빌에서 제공하는 서비스 약관에 동의합니다. <br>
         <input type="radio" name="radio2">개인정보 수집 및 이용에 모두 동의합니다.
      </div>

      <div class="sub">
         <input type="submit" name="submit" id="save" value="회원가입"> 
         <input type="reset" name="reset" value="다시입력"> 
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      </div>
      </form>
   </section>

<script src=" /resources/dist/js/form-validation.js"></script>

  <script type="text/javascript">
   
   $(".overlappingID").click(function() {
         
         var userid = document.getElementById("userid").value;
         
         console.log("=====userid : " + userid);
         if(userid == ""){
            alert('아이디를 입력하세요!');
         }
         else{
            $.ajax({
            type : "get",
            async : false,
            url : "/board/user/sign/idCheck",
            dataType:"json",
            data : {
               userid : userid
            },
            success : function(data) {
               if (data == 1) {
                  alert("이미 사용중인 ID입니다");
               } else {
                  console.log("=====data : " + data);
                  console.log("=====userid : " + userid);
                  alert("사용 가능한 ID 입니다.");
                  //체크 완료
                   document.getElementById("check").value = "true";
                  
               }
            }
         })
         }
      
      });
   </script>
   


	<%@include file="/WEB-INF/views/includes/footer.jsp"%>