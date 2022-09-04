<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/includes/header.jsp" %> 

<div class="container" style="width: 800px; position: relative; right: 20px;">
<br>
<br>
   	 <h2 style="position: relative; left: 240px;"><b>댓글 수정/삭제 페이지</b></h2>
        <br>
            <div class="panel-body">    
            <form>
				<div>
					<p> <b>${reply.userid}</b> / <fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                             value="${reply.regdate}"/></p>
					<p> <textarea rows="5" cols="90" name="reply" style="resize: none;">${reply.reply}</textarea> </p>	
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				<input type="hidden" name="bno" value="${reply.bno }" />
				<input type="hidden" name="rno" value="${reply.rno }" />
				<button class="btn btn-info" data-oper="modify" style="color: white;">댓글수정</button></a>
				<button class="btn btn-danger" data-oper="remove">댓글삭제</button></a>
			  <hr>
            </form>                
             </div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	var formobj=$("form");
	
	$('.btn').click(function(e){
		e.preventDefault();
	var operation=$(this).data("oper");
	
	if(operation ==='remove'){
		formobj.attr("action","/replies/remove")
			   .attr("method","post")
			   .submit();
	}else if(operation ==='modify'){
		formobj.attr("action","/replies/modify")
		       .attr("method","post")
		       .submit();	
	}	
	});
});
</script>

<script type="text/javascript">
$(document).ready(function(){
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
