<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/views/includes/header.jsp" %>

<link href="/resources/dist/css/community.css" rel="stylesheet">
<link href="/resources/dist/css/bootstrap.css" rel="stylesheet">

<nav class="container">
  <img src="/resources/image/re.png" id="re">
</nav>

<div class="container" style="width: 1200px; height: 1000px; margin-top: 100px;">
	<div>
		<form id="form"> 
        	<div class="form-group">
            	<input type="hidden" name="bno" value="<c:out value='${board.bno }'/>">
                <label><b>제목</b></label>
                <input class="form-control" name="title" 
                	value='<c:out value="${board.title }"/>' >
            </div>
            <br>              
            <div class="form-group">
            	<label><b>작성자</b></label>
                <input class="form-control" name="userid" 
                	value='<c:out value="${board.userid }"/>' readonly="readonly">
            </div>
            <br>              
            <div class="form-group">
            	<label><b>내용</b></label>
                <textarea class="form-control" rows="30" 
                	cols="10000" name="content" style="resize: none;"><c:out value="${board.content }"/></textarea>
            </div>
                          
            <%-- data-xxx 데이터 속성 --%>
            <%-- 특정한 데이터를 DOM 요소에 저장해두기 위함 --%>
            <%-- data-form='' data-value='' 등과 같이 임의로 속성을 만들어 사용할 수 있으며 한 input 태그에 여러개 사용 가능하다. --%>
            <div style="display: flex; justify-content: flex-end;">
            <button type="submit" data-oper="modify" class="btn btn-default">수정</button>
            <button type="button" data-oper="community" class="btn btn-info">목록</button>
            </div>
            <input type="hidden" name="<c:out value='${_csrf.parameterName}'/>"  value="<c:out value='${_csrf.token}'/>" /> 
            <input type="hidden" name="userid" value='<sec:authentication property="principal.username"/>' />
		</form>
	</div>
</div>                  

<%@include file="/WEB-INF/views/includes/footer.jsp" %>

<script type="text/javascript">

$(document).ready(function () {
	var formObj = $("#form");
	
 	$("button").on("click", function (e) {
		e.preventDefault();
		
		//잘 실행되는지 확인 this === button
		var operation = $(this).data("oper");
		console.log(operation);
		
		if(operation === "community"){
			formObj.attr("action", "/board/user/InterviewAns/community")
				   .attr("method", "get");
		}else if(operation === "modify"){
			if(confirm("정말 삭제하시겠습니까?") == true){
				formObj.attr("action","/board/user/InterviewAns/modify").attr("method","post");
				}else{
					return false;
				}
		}				
		formObj.submit();
	});
 	
 	$("button").on("click", function (e) {

		e.preventDefault();
		
		var operation2 = $(this).data("oper");
		
		if(operation2 === 'admin'){
			self.location="/board/admin/management";
		}else if(operation2 === 'mypage'){
			self.location="/board/user/mypage?userid=<sec:authentication property="principal.username"/>";
		}else if(operation2 === 'logout'){
			self.location="/customLogout"; 
		}
	});
 	
});
</script>
