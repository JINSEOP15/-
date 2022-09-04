<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/includes/header.jsp" %>

<link href="/resources/dist/css/community.css" rel="stylesheet">

<nav class="container">
    	<img src="/resources/image/community1.png" width="1000px" id="re">
</nav>

<div style="text-align: center;" id="title">
	<h2><b>고민Q&A 게시판</b></h2>
</div>
  
<section class="container" style="height: 1100px;">
	<div  style="text-align: center; position: relative; right: 230px;" id="list">
    	<sec:authorize access="isAuthenticated()">
    		<button id="regBtn" type="button" class="btn btn-xs pull-right">
    		<img alt="pencle" src="/resources/image/pencle.png" width="18px">
        		글쓰기
        	</button>
        </sec:authorize>
        <br>
        <br> 
        <div class="panel-body">  	
        	<table class="table table-striped table-bordered table-hover" style="width: 1000px;">
            	<thead>
                	<tr>
                    	<th>번호</th>
                        <th style="width: 500px;">제목</th>
                        <th>작성자</th>
                        <th style="width: 130px;">작성일</th>
                        <th><a class="Views" href="javascript:goPost('Views')" id="Views">조회수</a></th>
                        <th><a class="Likes" href="javascript:goPost2('Likes')" id="Likes">좋아요</a></th>
                    </tr>
                </thead>        
                <tbody>
                	<c:forEach items="${WorryQnA}" var="board">
                    	<tr class="odd gradeX">
                        	<td style="width: 80px;"><c:out value="${board.bno}"/></td>
                            <td><a class="move" style="text-decoration: none; color: black;" 
                            	   href='/board/user/WorryQnA/reg-detail?bno=<c:out value="${board.bno }"/>'>
                            	<<c:out value="${board.category}"/>> <c:out value="${board.title}"/>
                            	<b>[<c:out value="${board.replyCnt}"/>]</b>
                            	</a>
                            </td>
                            <td><c:out value="${board.userid}"/></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd"
                             value="${board.regdate}"/></td>
                            <td style="width: 80px;"><c:out value="${board.views}"/></td>
                            <td style="width: 80px;"><c:out value="${board.likes}"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
           </table>
           	<div class='row'>
            	<div class="col-lg-12">
                	<form id='searchForm' action="/board/user/WorryQnA/community" method="get">
                    	<select name='type'>
                        	<option value=""
                        		<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
                      		<option value="T"
                      			<c:out value="${pageMaker.cri.type eq 'T'? 'selected':'' }"/>>제목</option>
                      		<option value="C" 
                      			<c:out value="${pageMaker.cri.type eq 'C'? 'selected':'' }"/>>내용</option>
                      		<option value="W"
                      			<c:out value="${pageMaker.cri.type eq 'W'? 'selected':'' }"/>>작성자</option>
                      		<option value="TC"
                      			<c:out value="${pageMaker.cri.type eq 'TC'? 'selected':'' }"/>>제목 or 내용</option>
                      		<option value="TW"
                      			<c:out value="${pageMaker.cri.type eq 'TW'? 'selected':'' }"/>>제목 or 작성자</option>
                      		<option value="TCW"
                      			<c:out value="${pageMaker.cri.type eq 'TCW'? 'selected':'' }"/>>제목 or 내용 or 작성자</option>
						</select>
                   		<input type="text" name="keyword" 
                        	value="<c:out value="${pageMaker.cri.keyword}"/>">
                        <input type="hidden" name="pageNum" 
                           	value='<c:out value="${pageMaker.cri.pageNum }"/>'>
                        <input type="hidden" name="amount" 
                           	value='<c:out value="${pageMaker.cri.amount }"/>'>
                    	<button class="btn btn-default" id="search">Search</button>
					</form>
				</div>
			</div>
               
			<div>
				<ul class="pagination"
               		style="list-style-type: none; position: relative; left: 450px; 
               		display: flex; flex-direction: row; justify-content: space-around;
               		width: 120px;">
                 
                	<%-- prev가 true일 때 보이게 하기 --%>
                 	<c:if test="${pageMaker.prev}">
                 		<li class="paginate_button" style="margin-right: 20px;">
                 			<a href="${pageMaker.startPage-1}">Previous</a></li>
                 	</c:if>
                 	
                 	<%-- a href=""에 페이지 값을 담은 것을 actionForm hidden의 value에 넣어서 /board/community3로 이동한다. --%>
                 	<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                 		<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':''}" style="margin-right: 10px;">
                 			<a href="${num }">${num }</a></li>
                 	</c:forEach>
                 	
                 	<%-- next가 true일 때 보이게 하기 --%>
                 	<c:if test="${pageMaker.next}">
						<li class="paginate_button"  style="margin-left: 10px;">
							<a href="${pageMaker.endPage+1}">Next</a></li>
					</c:if>
				</ul>
            </div>
		</div>
		<form id="actionForm" action="/board/user/WorryQnA/community" method='get'>
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
            <input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'>
            <input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
            <input type="hidden" name="views" value='<c:out value="${board.views}"/>'>
		</form>
	</div>
</section>
  
<%@include file="/WEB-INF/views/includes/footer.jsp" %>

<script type="text/javascript">

	function goPost(Views){
		var p = document.createElement('form');
		var obj;	
	
		obj = document.createElement('input');
		obj.setAttribute('type', 'hidden');
		obj.setAttribute('name', 'Views');
		obj.setAttribute('value', 'WorryQnA');
	
		p.appendChild(obj);
		p.setAttribute('method','post');
		p.setAttribute('action','/board/user/WorryQnA/community');
		document.body.appendChild(p);
	
		var p2 = document.createElement('form');
		var obj2;
	
		obj2 = document.createElement('input');
		obj2.setAttribute('type', 'hidden');
		obj2.setAttribute('name', '${_csrf.parameterName}');
		obj2.setAttribute('value', '${_csrf.token}');
	
		p2.appendChild(obj2);
		p2.setAttribute('method','post');
		p2.setAttribute('action','/board/user/WorryQnA/community');
		document.body.appendChild(p2);
		p2.submit(); 
	
		}; 


	function goPost2(Likes){
		var p = document.createElement('form');
		var obj;	
		
		obj = document.createElement('input');
		obj.setAttribute('type', 'hidden');
		obj.setAttribute('name', 'Likes');
		obj.setAttribute('value', 'WorryQnA');
		
		p.appendChild(obj);
		p.setAttribute('method','post');
		p.setAttribute('action','/board/user/WorryQnA/community2');
		document.body.appendChild(p);		 
		
		var p2 = document.createElement('form');
		var obj2;
		
		obj2 = document.createElement('input');
		obj2.setAttribute('type', 'hidden');
		obj2.setAttribute('name', '${_csrf.parameterName}');
		obj2.setAttribute('value', '${_csrf.token}');
		
		p2.appendChild(obj2);
		p2.setAttribute('method','post');
		p2.setAttribute('action','/board/user/WorryQnA/community2');
		document.body.appendChild(p2);
		p2.submit(); 
		
	};
	
$(document).ready(function () {
	//글쓰기 버튼 클릭 메소드
	$("#regBtn").on("click", function () {
		self.location = "/board/user/WorryQnA/reg";
	});
	
	var actionForm = $("#actionForm");
	
	//페이지버튼 클릭 메소드
	 $(".paginate_button a").on("click", function (e) {
         e.preventDefault();
         console.log('click....');
         actionForm.find("input[name='pageNum']").val($(this).attr("href"));
         actionForm.submit();
      });
	 
	
	//검색 버튼 클릭 메소드
	var searchForm = $("#searchForm");
    $("#searchForm button").on("click", function(e){
   	  
   		if(!searchForm.find("option:selected").val()){
   			alert("검색 종류를 선택하세요.");
   		  	return false;
   	  	}
   	 	if(!searchForm.find("input[name='keyword']").val()){
   		  	alert("키워드를 입력하세요.")
   		  	return false;
   	  	}
    	searchForm.find("input[name='pageNum']").val("1");
    	e.preventDefault();
    	searchForm.submit();
    });   
});
</script>