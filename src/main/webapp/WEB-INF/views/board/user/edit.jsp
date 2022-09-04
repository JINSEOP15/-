<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/includes/header.jsp" %>
  <link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
<body class="bg-light">   
  <div class="container" style="position: relative; height: 680px;">
  	<br>
  	<br>
  	<h2 style="text-align: center;">
  		<b>회원정보수정</b>
 	</h2>
 
    <main> 
      <div class="row g-5" style="position: relative; left: 250px;">
        <div class="col-md-8 col-lg-10">
          <form id="form">
            <div class="row g-6">
              <div class="col-sm-9">
                <b><label for="username" class="form-label">회원이름</label></b>
                <input value="${member.userName}" name="username" id="username" class="form-control">
              </div>
              
              <div class="col-sm-9">
                <b><label for="userid" class="form-label">아이디</label></b>
                <input value="${member.userid}" name="userid" class="form-control" readonly>
              </div>

              <div class="col-9">
                <b><label for="userphone" class="form-label">전화번호 </label></b>
                <input value="${member.userphone }" name="userphone" id="userphone" class="form-control">
              </div>

              <div class="col-9">
                <b><label for="regdate" class="form-label">가입일자</label></b>
                <input value="<fmt:formatDate pattern="yyyy-MM-dd" value="${member.regdate}"/>" class="form-control" readonly>
              </div>
              <br>
              <br>
              <br>
              <br>
              <br>
            <div class="col-9 text-center">
              <button class="w-40 btn btn-outline-info btn-md" data-oper="modify" >수정</button>
              <button class="w-40 btn btn-outline-info btn-md" data-oper='remove'>회원탈퇴</button>
            </div>
            </div>
          </form>
        </div>
      </div>
    </main>
  </div>
  
<script type="text/javascript">
$(document).ready(function(){
	var formobj=$("#form");
	
	$('.btn').click(function(e){
		e.preventDefault();
	var operation=$(this).data("oper");
	
	if(operation ==='modify'){
		var n_RegExp = /^[가-힣]{2,15}$/;
		var ph_RegExp = /^\d{3}-\d{3,4}-\d{4}$/;
		var objName = document.getElementById("username");
		var objPhone = document.getElementById("userphone");
		if (objName.value == "") {
		    alert("이름을 입력해주세요.");
		    return false;
		  }
		  if (!n_RegExp.test(objName.value)) {
		    alert("이름은 특수문자,영어,숫자는 사용할수 없습니다. 한글만 입력하여주세요.");
		    return false;
		  }
		  if (ph_RegExp.value == "") { 
			   alert("전화번호를 입력해주세요.");
			   return false;
		  }
		  if (!ph_RegExp.test(objPhone.value)) { 
			   alert("올바른 전화번호 형식이 아닙니다.");
			   return false;
		  }
		  
		formobj.attr("action","/board/user/userModify")
	    .attr("method","post")
	    .submit();
	}else if(operation === 'remove'){
		self.location="/board/user/withdrawal"; 
	}else if(operation === 'mypage'){
		self.location="/board/user/mypage?userid=<sec:authentication property="principal.username"/>";	 
	}
	});
	
	

	
});
</script>

  <script src=" /resources/dist/js/form-validation.js"></script>
  
<%@include file="/WEB-INF/views/includes/footer.jsp" %>