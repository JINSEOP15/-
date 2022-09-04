<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/includes/header.jsp" %> 
    
<link href="/resources/dist/css/community.css" rel="stylesheet">
<link href="/resources/dist/css/reg.css" rel="stylesheet">   
    
<nav class="container">
  <img src="/resources/image/re.png" id="re">
</nav>

<body class="container">
	<br>
	<br>
	<form id="register-form" action="/board/user/Passlatter/reg" method="post">
		<div>
			<select style="border-radius: 5px; background: rgb(62, 146, 144); color:white; position: relative; left: 60px;" name="select">
  				<option value="Passlatter">합격후기 게시판</option>
  				<option value="CompanyVal">회사평가 게시판</option>
  				<option value="InterviewAns">면접질문 게시판</option>
  				<option value="WorryQnA">고민Q&A 게시판</option>
  				<option value="PassSelfIntroduct">합격자소서 게시판</option>
  			</select>
  		</div>
  
  		<br>
  
  		<div class="btn-reg">
  			<button type="submit" id="reg" style="border-radius: 5px; background: rgb(62, 146, 144); color:white; border: 0px; position: relative; right:35px;">등록</button>
  		</div>
  
  		<input type="text" placeholder="글제목을 입력하세요" style="width: 1100px; position: relative; left: 60px;" name="title"> 
		<br>
		<br>
		<br>
		<br>
  		<input type="hidden" name="userid" value='<sec:authentication property="principal.username"/>' />
  		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
  		<textarea style="width: 1200px; height: 1200px; resize: none; position: relative; left: 60px;" name="content"></textarea>
	</form>

<script type="text/javascript">
$(document).ready(function () {
	$("#reg").on("click", function(e){
	      e.preventDefault();
	      
	      if(! $("input[name=title]").val() && ! $("textarea[name=content]").val()){
	         alert("제목과 내용을 입력해주세요.");
	         $("input[name=title]").focus();
	         
	         console.log("제목, 내용 둘 다 없어");
	         
	         return false;
	      
	      }else if(! $("textarea[name=content]").val()){
	         alert("내용을 입력해주세요.");
	         $("textarea[name=content]").focus();
	         
	         console.log("내용이 없어");
	         
	         return false;
	         
	      }else if(! $("input[name=title]").val()){
	         alert("제목을 입력해주세요.");
	         $("input[name=title]").focus();
	         
	         console.log("제목이 없어");
	         
	         return false;
	      }
	      
	      $("#register-form").submit();
	      
	});
});
</script>