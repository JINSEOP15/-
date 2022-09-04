<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/includes/header.jsp" %> 

<section class="container" style="width:1000px; height: 850px; text-align: center;">
	<br>
	<br>
   	<h2><b>문의글 관리</b></h2>
   	<a href="/board/admin/management" style="display: flex; justify-content: flex-end; text-decoration: none;">
   		<button class="btn btn-info" style="color: white;">회원 관리</button>
   	</a>
            <div class="panel-body"> 
            <form> 	
                <table class="table table-striped table-bordered table-hover">  
				
					<thead>
				    	<tr>
				    		<th>번호</th>
				        	<th>문의종류</th>
				        	<th>제목</th>
				        	<th>아이디</th>
				        	<th>작성일자</th>
				    	</tr>
					</thead>        
				<tbody>
				   	<c:forEach items="${list}" var="board">
				   		<tr class="odd gradeX">
				   			<td>${board.bno}</td>
				       		<td>${board.category}</td>
				       		<td><a href='/board/user/Ask/AskModify?bno=<c:out value="${board.bno }"/>' style="text-decoration: none; color: rgb(17, 164, 238);">
				       		${board.title}</a></td>
				       		<td>${board.userid}</td>
				       		<td>${board.regdate}</td>
				   		</tr>
				  	</c:forEach>		
			   	</tbody>		   	  		
		</table>
              </form> 
             </div>

</section>



<script type="text/javascript">
$(document).ready(function(){
$("#button").on("click", function (e) {
		e.preventDefault();
		
		var operation2 = $(this).data("oper");
		
		if(operation2 === 'admin'){
			self.location="/board/admin/management";
		}else if(operation2 === 'mypage'){
			self.location="/board/user/mypage?userid=<sec:authentication property="principal.username"/>";
		}else if(operation2 === 'logout'){
			self.location="/customLogout"; 
		}else if(operation2 === 'management'){
			self.location="/board/admin/management";
	});

});
</script>
