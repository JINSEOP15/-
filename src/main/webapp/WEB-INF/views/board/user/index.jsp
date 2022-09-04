<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ include file="/WEB-INF/views/includes/header.jsp" %> 

<link href="/resources/dist/css/index.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet">    

<!-- ----------------------------------------슬라이드 부분------------------------------------------------- -->
<div id="slider">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>

  <div class="container">
  	<div class="bxslider">
    	<div id="img">
    	<a href="https://www.econovill.com/news/articleView.html?idxno=583069" target="_blank">
    	<img src="/resources/image/mainimg1.jpg" width="1200px" height="400px"></a>
    	</div>
    	<div id="img">
    	<a href="https://itbankjeon93.tistory.com/1" target="_blank">
    	<img src="/resources/image/mainimg2.jpg" width="1100px" height="400px"></a>
    	</div>
    	<div id="img">
    	<a href="https://m.onoffmix.com/search?s=%23%EC%9B%B9%EA%B0%9C%EB%B0%9C" target="_blank">
    	<img src="/resources/image/mainimg3.png" width="1200px" height="400px"></a>
    	</div>
  	</div>
   </div>
</div>

<script>
  $(document).ready(function(){
    $('.bxslider').bxSlider();
  });
</script>

<!-- ----------------------------------------/슬라이드 부분------------------------------------------------- -->
  
</main>

<section class="container2" id="sec" style="height: 600px; width: 1300px; position: relative; left: 200px;">
	<div id="sec-2" style="width: 600px;">
  		<h3 style="text-align: center">회사 평가 인기글</h3>
            	<div class="panel-body">  	
               		<table class="table table-striped table-bordered table-hover" style="width: 600px;">
                    	<thead>
                        		<tr style="font-size: 15px; text-align: center;">
                            	<th style="width: 50px;">번호</th>
                            	<th style="width: 240px;">제목</th>
                            	<th style="width: 55px;">작성자</th>
                            	<th style="width: 85px;">작성일</th>
                            	<th style="width: 65px;">조회수</th>
                            	<th style="width: 65px;">좋아요</th>
                        	</tr>
                    	</thead>        
                    	<tbody>
                    	 <c:forEach items="${CompanyVal}" var="board">
                        	<tr class="odd gradeX" style="font-size: 15px; text-align: center;">
                            	<td><c:out value="${board.bno}"/></td>
                            	<td style="text-align: left;">
                            		<a class="move" style="text-decoration: none; color: black;"
                            			href='/board/user/CompanyVal/reg-detail?bno=<c:out value="${board.bno }"/>'>
                            			<c:out value="${board.title}"/>
                            		</a>
                            	</td>
                            	<td><c:out value="${board.userid}"/></td>
                            	<td style="font-size: 12px;">
                            	<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/>
                             	</td>
                            	<td style="font-size: 12px;"><c:out value="${board.views}"/></td>
                            	<td style="font-size: 12px;"><c:out value="${board.likes}"/></td>
                        	</tr>
                      	 </c:forEach>
                    	</tbody>
                	</table>
          		</div>
	</div>
	
	<div id="sec-2" style="width: 600px; position: relative; left: 80px;">
  		<h3 style="text-align: center">면접 질문 인기글</h3>
            	<div class="panel-body">  	
               		<table class="table table-striped table-bordered table-hover" style="width: 600px;">
                    	<thead>
                        	<tr style="font-size: 15px; text-align: center;">
                            	<th style="width: 48px;">번호</th>
                            	<th style="width: 260px;">제목</th>
                            	<th style="width: 55px;">작성자</th>
                            	<th style="width: 80px;">작성일</th>
                            	<th style="width: 63px;">조회수</th>
                            	<th style="width: 63px;">좋아요</th>
                        	</tr>
                    	</thead>        
                    	<tbody>
                    	 <c:forEach items="${InterviewAns}" var="board">
                        	<tr class="odd gradeX" style="font-size: 15px; text-align: center;">
                            	<td><c:out value="${board.bno}"/></td>
                            	<td style="text-align: left;">
                            		<a class="move" style="text-decoration: none; color: black;"
                            			href='/board/user/InterviewAns/reg-detail?bno=<c:out value="${board.bno }"/>'>
                            			<c:out value="${board.title}"/>
                            		</a>
                            	</td>
                            	<td><c:out value="${board.userid}"/></td>
                            	<td style="font-size: 12px;">
                            	<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/>
                             	</td>
                            	<td style="font-size: 12px;"><c:out value="${board.views}"/></td>
                            	<td style="font-size: 12px;"><c:out value="${board.likes}"/></td>
                        	</tr>
                      	 </c:forEach>
                    	</tbody>
                	</table>
          		</div>
	</div>
</section>

<section class="container" id="sec2">
  <div id="sec2-1">
    <h3 style="text-align: center">프로그램 순위</h3>
    <table style="text-align: center; width: 600px;">
        <tr id="tr">
            <th>2022년</th>
            <th>2021년</th>
            <th>변화</th>
            <th>프로그램 언어</th>
            <th>평가</th>
            <th>변화</th>
        </tr>
      <tbody>
        <tr id="tr">
          <td>1</td>
          <td>3</td>
          <td>△</td>
          <td>Python</td>
          <td>15.33%</td>
          <td>+4.47%</td>
        </tr>
        <tr id="tr">
          <td>2</td>
          <td>1</td>
          <td>▼</td>
          <td>C</td>
          <td>14.08%</td>
          <td>-2.26%</td>
        </tr>
        <tr id="tr">
          <td>3</td>
          <td>2</td>
          <td>▼</td>
          <td>Java</td>
          <td>12.13%</td>
          <td>+0.84%</td>
        </tr>
        <tr id="tr">
          <td>4</td>
          <td>4</td>
          <td></td>
          <td>C++</td>
          <td>08.01%</td>
          <td>+1.13%</td>
        </tr>
        <tr id="tr">
          <td>5</td>
          <td>5</td>
          <td></td>
          <td>C#</td>
          <td>5.37%</td>
          <td>+0.93%</td>
        </tr>
        <tr id="tr">
          <td>6</td>
          <td>6</td>
          <td></td>
          <td>Visual Basic</td>
          <td>5.23%</td>
          <td>-0.90%</td>
        </tr>
        <tr id="tr">
          <td>7</td>
          <td>7</td>
          <td></td>
          <td>JavaScript</td>
          <td>1.83%</td>
          <td>-0.45%</td>
        </tr>
        <tr id="tr">
          <td>8</td>
          <td>8</td>
          <td></td>
          <td>PHP</td>
          <td>1.79%</td>
          <td>+0.04%</td>
        </tr>
        <tr id="tr">
          <td>9</td>
          <td>10</td>
          <td>△</td>
          <td>Assembly Language</td>
          <td>1.60%</td>
          <td>-0.06%</td>
        </tr>
        <tr>
          <td>10</td>
          <td>9</td>
          <td>▼</td>
          <td>SQL</td>
          <td>1.55%</td>
          <td>-0.18%</td>
        </tr>
      </tbody>
    </table>
    </div>
</section>

<%@include file="/WEB-INF/views/includes/footer.jsp" %>