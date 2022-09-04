<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/includes/header.jsp" %> 
 
<link href="/resources/dist/css/askmodify.css" rel="stylesheet">  
    
<div class="container" style="width: 830px;">
		<br>
		<br>
   	 	<h2 style="position: relative; left: 330px;"><b>문의사항</b></h2>
        <br>
        <div>
            <div class="panel-body" style="width: 800px;"> 
            <form id="form1"> 
            <input type="hidden" name="bno" value="${board.bno }">	
               <table class="table table-striped table-bordered table-hover" style="width: 800px;">
                        <tr>
                            <th>제목</th>
                            <td><input class="form-control" name="title" value='<c:out value="${board.title }"/>' /></td>
                        </tr>
                        <tr>
                            <th>아이디</th>
                            <td><input class="form-control" name="userid" value='<c:out value="${board.userid }"/>' readonly="readonly"/></td>
                        </tr> 
                        <tr>   
                            <th>내용</th>
                            <td><textarea class="form-control" rows="10" cols="10000" name="content" style="resize: none;">${board.content }</textarea></td>
                        </tr>  


                </table>
                <div style="display: flex; justify-content: flex-end;">
                <sec:authorize access="hasRole('ROLE_USER')">
                     <button data-oper="modify" class="btn btn-info" style="color: white; margin-right: 5px;">수정</button>
                     <button data-oper="remove" class="btn btn-danger">삭제</button>
                 </sec:authorize>
                 <sec:authorize access="hasRole('ROLE_ADMIN')">
                     <button data-oper="remove" class="btn btn-danger">삭제</button>
                 </sec:authorize>
                </div>
              </form> 
             </div>
             <hr>           
            <c:forEach items="${reply}" var="reply">	
				<div>
					<p> ${reply.userid} / <fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                             value="${reply.regdate}"/></p>
					<p> ${reply.reply}</p>	
				</div>
				<input type="hidden" name="bno" value="${board.bno }" />
				<input type="hidden" name="rno" value="${reply.rno }" />
				
        	<sec:authorize access="isAuthenticated()">
        	<sec:authentication property="principal" var="pinfo"/>
	        	<c:if test="${pinfo.username eq reply.userid}" >
				  <a href='/board/admin/adminAsk-Modify?rno=<c:out value="${reply.rno}"/>'>댓글수정/삭제</a>
				</c:if>
        	</sec:authorize>
        	
				<hr>
			</c:forEach>
             
			<div class="panel-body"> 
				<form id="form2">
					<p>
					 <b>댓글 작성자 </b> 
					 <input type="text" name="userid" value='<sec:authentication property="principal.username"/>' readonly="readonly"/>
					</p>
					<p>
					 <textarea rows="3" cols="93" name="reply" style="resize: none;"></textarea>
					</p>
					<p style="display: flex; justify-content: flex-end;">
				      <input type="hidden" name="bno" value="${board.bno }" />
					  <button data-oper="AskReply" class="btn btn-info" style="color: white;">등록</button>
				</p>
				</form>
			</div>
		</div>	 
</div>

<script type="text/javascript">
$(document).ready(function(){
	var formobj1=$("#form1");
	
	$('.btn').click(function(e){
		e.preventDefault();
	var operation=$(this).data("oper");
	
	if(operation ==='remove'){
	   formobj1.attr("action",'/board/user/Ask/AskRemove')
			   .attr("method","post")
			   .submit();
	}else if(operation ==='modify'){
	   formobj1.attr("action",'/board/user/Ask/AskModify')
		       .attr("method","post")
		       .submit();	
	}
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
	
	var formobj2=$("#form2");
	
	$('.btn').click(function(e){
		e.preventDefault();
	var operation=$(this).data("oper");
	
	if(operation ==='AskReply'){
	   formobj2.attr("action",'/replies/userWrite')
			   .attr("method","post")
			   .submit();
	}
	});
	
});
</script>

