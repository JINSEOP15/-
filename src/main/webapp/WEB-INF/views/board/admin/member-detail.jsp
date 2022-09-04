<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/includes/header.jsp" %> 

<section class="container" style="width:1000px; height: 850px; text-align: center;">
	<br>
	<br>
   	<h2><b>회원상세화면</b></h2>
    <br>
    <div class="panel-body"> 
    	<form> 	
        	<table class="table table-striped table-bordered table-hover">
            	<thead>
                	<tr>
                    	<th>회원이름</th>
                        <th>아이디</th>
                        <th>전화번호</th>
                        <th>가입일자</th>
                        <th>수정일자</th>
                        <th>수정</th>
                        <th>삭제</th>
                    </tr>
                </thead>        
                <tbody>
                         <tr class="odd gradeX">
                            <td><input value="${member.userName}" name="username" /></td>
                            <td><input value="${member.userid}" name="userid" readonly="readonly"/></td>
                            <td><input value="${member.userphone }" name="userphone" style="width: 123px;"/></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.regdate}"/></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.updatedate}"/></td>
                        	<td><button class="btn btn-info" data-oper="modify" style="color: white;">수정</button></td>
                        	<td><button class="btn btn-danger" data-oper='remove'>삭제</button></td>
                         </tr>
                    </tbody>
                </table>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />    
              </form> 
             </div>
</section>

<script type="text/javascript">
$(document).ready(function(){
	var formobj=$("form");
	
	$('.btn').click(function(e){
		e.preventDefault();
	var operation=$(this).data("oper");
	
	if(operation ==='remove'){
		formobj.attr("action","/board/admin/memberRemove")
			   .attr("method","post")
			   .submit();
	}else if(operation ==='modify'){
		formobj.attr("action","/board/admin/memberModify")
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





