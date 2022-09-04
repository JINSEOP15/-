<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/includes/header.jsp" %> 
    
<link href="/resources/dist/css/mypage.css" rel="stylesheet"> 
 
<div class="container">    
<h2><strong>마이홈</strong></h2>
<div class="profile-box">
    <div class="my-profile-box">
        <div class="my-introduce border-top-1px" id="nickname2">
            <h5></h5>
            <a href="/board/user/edit?userid=<sec:authentication property="principal.username"/>"style="color: rgb(17, 164, 238);"><h4><strong><sec:authentication property="principal.username"/> 님의 정보 보기</strong></h4></a>
        </div>
        
        <div class="img-box">
            <div class="my-photo">
                <div class="photo">
                    <img src="/resources/image/user.jpg" class="signimg" alt="회원사진" style="width: 80px;"> 
                </div>
             </div>
        </div>
    </div>
</div>

<hr>
<div class="headline-short" id="list-box">
    <h4>
        <strong> <sec:authentication property="principal.username"/> 님의 최근 게시물</strong>
    </h4>
</div>
<br>
<br>
<div style="position: relative; left: 160px;">
<c:choose>
	<c:when test="${list2 eq 'null'}"> 
	    <div id="list">
	        <h5>최근 게시물이 없습니다.</h5>
	    </div>
	</c:when>
	<c:otherwise>
		<table class="table table-striped table-bordered table-hover" style="width: 1000px; ">
		<thead>
		   	<tr id="list2">
		       	<th>제목</th>
		       	<th>작성일자</th>
		       	<th>조회수</th>
		       	<th>좋아요</th>
		   	</tr>
		</thead>        
			<tbody>
		 		<c:forEach items="${list2}" var="board2">
				<tr class="odd gradeX">
		    		<td><a href='/board/user/${board2.tablename}/reg-detail?bno=<c:out value="${board2.bno}"/>' style="color: rgb(17, 164, 238);">${board2.title}</a></td>
		    		<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${board2.regdate}"/></td>
		    		<td style="text-align: center;">${board2.views}</td>
		    		<td style="text-align: center;">${board2.likes}</td>
				</tr>
			   </c:forEach>
		   	</tbody> 
		</table>
	</c:otherwise>
</c:choose>
</div>
 <hr>    
<div class="headline-short" id="list-box">
    <h4>
        <strong> 내 문의 내역</strong>
    </h4>
</div>

<a href="/board/user/Ask/AskReg2" style="position: relative; left: 1050px;"><button class="btn btn-info" style="color: white;">문의글쓰기</button></a> 
<br>
<br>
<div class="panel-body">
 
<c:choose>    
	  <c:when test="${list eq 'null'}">
		<div id="list">
	      <h5>문의 내역이 없습니다.</h5>
	    </div>
	  </c:when>
	 <c:otherwise>
		<table class="table table-striped table-bordered table-hover" style="width: 1000px; position: relative; left: 160px;">  
				
					<thead>
				    	<tr>
				        	<th>문의종류</th>
				        	<th>제목</th>
				        	<th>아이디</th>
				        	<th>작성일자</th>
				    	</tr>
					</thead>        
				<tbody>
				   	<c:forEach items="${list}" var="board">
				   		<tr class="odd gradeX">
				       		<td>${board.category}</td>
				       		<td><a href='/board/user/Ask/AskModify?bno=<c:out value="${board.bno }"/>'style="color: rgb(17, 164, 238);"> ${board.title} </a></td>
				       		<td>${board.userid}</td>
				       		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
				   		</tr>
				  	</c:forEach> 		
			   	</tbody>		   	  		
		</table>
	</c:otherwise>	
</c:choose>
    <hr>
</div>
</div>
<%@include file="/WEB-INF/views/includes/footer.jsp" %>