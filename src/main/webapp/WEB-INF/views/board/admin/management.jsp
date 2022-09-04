<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/includes/header.jsp" %> 
    

<section class="container" style="width: 1000px; height: 1200px; position: relative; left: 20px; text-align: center;">
	<br>
	<br>
   	<h2><b>회원관리</b></h2>
   	<a href="/board/admin/adminAsk" style="display: flex; justify-content: flex-end; text-decoration: none;">
   		<button class="btn btn-info" style="color: white;">문의글 관리</button>
   	</a>
    <div class="panel-body"> 
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>회원이름</th>
                            <th width="350px;">아이디</th>
                            <th width="250px;">조회</th>
                        </tr>
                    </thead>        
                    <tbody>
                      <c:forEach items="${list}" var="member">
                        <tr class="odd gradeX">
                            <td>${member.userName}</td>
                            <td>${member.userid}</td>
                            <td>
                            <a href="/board/admin/member-detail?userid=${member.userid}">
                            <button  class="btn btn-info" style="color: white;">회원상세정보</button>
                            </a>
                            </td>
                        </tr>
                       </c:forEach>
                    </tbody>
                </table>            
</div>
</section>








