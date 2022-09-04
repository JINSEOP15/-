<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/includes/header.jsp" %> 
    
<link href="/resources/dist/css/community.css" rel="stylesheet">
<link href="/resources/dist/css/reg.css" rel="stylesheet">
<script type="text/javascript" src="/resources/vendor/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" 
integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link href="/resources/dist/css/bootstrap.css" rel="stylesheet">

<nav class="container">
	<img src="/resources/image/5.png" width="1000px" id="re">
</nav>

<body class="container">
<sec:authorize access="isAuthenticated()">
 	<!-- Modal -->
	<div class="modal" id="myModal" tabindex="-1" role="dialog" style="position: relative; top: 1500px; z-index: 1050"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">댓글 등록</h4>
				</div>
				<div class="modal-body">
					<div class="modal-group">
						<label>댓글</label> 
						<input class="form-control" name="replyInput" value="new reply!!">
					</div>
					<div class="modal-group">
						<label>작성자</label> 
						<input class="form-control" name="userid" value='<sec:authentication property="principal.username"/>'>
					</div>
					<div class="modal-group">
						<label>작성일</label> 
						<input class="form-control" name="regdate" value="2022-08-01">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="modalModBtn" class="btn btn-warning">수정</button>
					<button type="button" id="modalRemoveBtn" class="btn btn-danger">삭제</button>
					<button type="button" id="modalCloseBtn" class="btn btn-default"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</sec:authorize>
	
  	<br>
  	<br>
  	<div class="btn-reg-detail" style="position: relative; right:15px;">
		<button type="button" data-oper="community" style="border-radius: 5px;">목록</button>
		<c:choose>
			<c:when test="${empty board.bno}">
				<input type="hidden">
			</c:when>
			<c:otherwise>
				<button type="button" data-oper="reg-detail+" style="border-radius: 5px;">다음글></button>
			</c:otherwise>
		</c:choose>
 	</div>
  	<br>
  	<br>
    <div class="div">
    	<div class="div2">
        	<h2><b><c:out value="${board.title }"/></b></h2>
        	<h5><b><c:out value="${board.userid }"/></b></h5>
        
        	<sec:authentication property="principal" var="pinfo"/>
        	<sec:authorize access="isAuthenticated()">
	        	<c:if test="${pinfo.username eq board.userid}">
        			<div class="btn-reg-detail">
          				<button type="button" data-oper="modify" style="border-radius: 5px;">수정</button>
          				<button type="button" data-oper="remove" style="border-radius: 5px;">삭제</button>
        			</div>
         		</c:if>
        	</sec:authorize>
        	
        	<sec:authorize access="hasRole('ROLE_ADMIN')">
        	  <div class="btn-reg-detail">
        		<button type="button" data-oper="modify" style="border-radius: 5px;">수정</button>
          		<button type="button" data-oper="remove" style="border-radius: 5px;">삭제</button>
          	  </div>
        	</sec:authorize>
            
        	<h6>조회수 <c:out value="${board.views }"/> <a href="javascript:goPost('Like')" 
           		style="text-decoration: none; color: rgb(255, 149, 206);">좋아요</a> <c:out value="${board.likes }"/>
        	</h6>
        
        	<hr>
        	<br>
            
        	<div class="btn-reg-detail-content">
            	<c:out value="${board.content }"/>
        	</div>
            
        	<form id="operForm" action="/board/user/Passlatter/modify" method="get">
           		<input type='hidden' id="bno" name="bno" value='${board.bno }'>
           		<input type='hidden' name="pageNum" value='${cri.pageNum }'>
           		<input type='hidden' name="amount" value='${cri.amount }'>
           		<input type='hidden' name="type" value='${cri.type }'>
           		<input type='hidden' name="keyword" value='${cri.keyword }'>   
           		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />                               
        	</form>
      	</div>
	</div>
    
    <hr>
    
    <h4>댓글</h4>
	<div class="chat">
		<div class="chat-content" style="position: relative; left: 60px;">
			<ul class="chat-list">
      			<li class="chat-value">
          			<strong class="reply-user">USER</strong>
          			<small class="pull-right text-muted">2022-08-01</small>
          			<p>댓글을 답니다.</p>
          			<hr>
        		</li>
     		</ul>
      	</div> 
      	<div class="chat-footer" style="display: flex; justify-content: flex-end;"></div> 	     	
  
    	<div class="chat-reg">
    		<textarea style="width: 1200px; height: 100px; resize: none;" name="reply" placeholder="댓글을 입력하시오"></textarea>
      		<div class="reg-div">
      	 	<sec:authentication property="principal" var="pinfo"/>
        	<sec:authorize access="isAuthenticated()">
        		<button class="addReply" type="button" style="border-radius: 5px;">등록</button>
        	</sec:authorize>
      		</div>
    	</div>
    </div>

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">

$(document).ready(function () {	
	//-------------------댓글------------------------

	var bnoValue = '<c:out value="${board.bno}"/>';
	var replyUL = $(".chat-list");
	
	showList(1); //1페이지 댓글 목록을 불러와줌
	
	//댓글 목록 보여주는 함수
	function showList(page) {
		console.log("showList page: "+page);
		
		                                   //저장된 페이지 값이 없으면 1페이지
		replyService.passlatter_GetList({bno:bnoValue, page:page||1},
				function(replyCnt, list) {
			//reply.js    ReplyPageDTO > list
					console.log("list : "+list);
					console.log("replyCnt : "+replyCnt);
					
					//-1 : 새 댓글이 추가 될 경우의 넘겨받을 page 값
					if(page == -1){
						pageNum = Math.ceil(replyCnt/10.0); //마지막 페이지 (최신 댓글 페이지)
						//replyCnt(21)/10.0 => 2.1 =>ceil => 3 (마지막 페이지)
						showList(pageNum);
						console.log("pageNum2 : "+pageNum);
						return;
					}
					
			var str = "";
			
			//글이 없거나 배열의 길이가 0이면
			if(list == null || list.length == 0){
				//.chat 의 내용을 비운다.
				replyUL.html("");
				return;
			}
			
			//for문으로 댓글 내용을 넣어준다.
			for(var i=0, len=list.length || 0; i < len; i++){
				//data-rno = list[i].rno > 커스텀속성
				str += "<li class='chat-value' data-rno='"+list[i].rno+"' style='background: rgba(109, 109, 109, 0.575); list-style: none;'>";
			 	str += "<div><div class='chat-content'><strong class='reply-user'>"
			 			+list[i].userid+"</strong>";
			 	str += "<small class='reply=date'> "
			 			+replyService.displayTime(list[i].regdate)
			 			+"</small></div>";
				str += "<p>"+list[i].reply+"</p>";	
				str += "</div></li>";
			}
			
			//str에 담아준 내용으로 replyUL의 내용 변경
			replyUL.html(str);
			
			//댓글 페이지를 계산하여 보여줌
			showReplyPage(replyCnt);
		}); //end replyService.passlatter_GetList
		
		console.log("showList page2: "+page);
	}; //end showList

	//등록 버튼 클릭 시 댓글 create
	var replyReg = $(".chat-reg");
	var replyText = replyReg.find("textarea[name = 'reply']");
	
	//댓글 등록 함수
	
	$(".addReply").on("click", function (e) {
		"<sec:authorize access="isAuthenticated()">"		
		var reply = {
				reply : replyText.val(),
				userid : "<sec:authentication property="principal.username"/>",
				bno : bnoValue
			};
		"</sec:authorize>"
		replyService.passlatter_Add(reply, function (result) {
			alert("등록되었습니다.");
			
			//textarea에 들어있는 내용 비우기
			replyText.val("");
			console.log("text return------!!!!");
			
			//새 댓글 추가 시 마지막 페이지로 호출
			showList(-1);
			console.log("page return------!!!!");
		}); //end replyService.passlatter_Add
	}); //.addReply onclick function
	
	var pageNum = 1;
	var replyPageFooter = $(".chat-footer");
	
	//댓글 페이지 생성 함수
	function showReplyPage(replyCnt) {
		//10페이지씩 자르기 위한 계산
		console.log("showReplyPage====="+replyCnt);
		var endNum = Math.ceil(pageNum/10.0)*10;
		var startNum = endNum-9;
		
		var prev = startNum != 1;
		var next = false;
		
		//댓글 총 갯수가 마지막페이지 댓글 번호를 넘지 않으면
		//replyCnt 101 > 10.1 > 11
		if(endNum*10 >= replyCnt){
			endNum = Math.ceil(replyCnt/10.0);
		}else if(endNum*10 < replyCnt){
			//댓글 총 갯수가 마지막페이지 댓글 번호를 넘으면
			next = true;
		}
		
		var str = "<ul class='pagination pull-right'>";
		
		//이전 버튼 생성 조건
		if(prev){
			str += "<li class='page-item'><a class='page-link' href='"
					+(startNum-1)+"'>이전</a></li>";
		}
		
		for(var i=startNum; i<=endNum; i++){
			//클릭한 li에 탭 기능 구현 = class에 active 속성 추가
			//class="active"를 썼을 때 현재 active 한 부분을 보여줌
			//페이지 번호를 클릭했을 때 pageNum이 바뀌고 url이 이동되도록 설정
			var active = pageNum == i? "active":"";
			str += "<li class='page-item"+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		
		if(next){
			str += "<li class='page-item'><a class='page-link' href='"
					+(endNum+1)+"'>다음</a></li>";
		}
		
		str += "</ul>";
		
		console.log(str);
		replyPageFooter.html(str);
	}; //end showReplyPage
	
	//페이지탭 클릭 이벤트 href에 넣은 pageNum 값
	replyPageFooter.on("click", "li a", function (e) {
		e.preventDefault();
		console.log("page click!!");
		
		//페이지 탭의 href 값을 targetPageNum에 담기
		var targetPageNum = $(this).attr("href");
		
		console.log("targetPageNum : "+targetPageNum);
		
		//pageNum을 targetPageNumfh로 변경
		pageNum = targetPageNum;
		
		//pageNum을 보여주기
		showList(pageNum);
	}); //end replyPageFooter onclick function
	
	var modal = $("#myModal");
	var modalInputReply = modal.find("input[name='replyInput']");
	var modalInputUserid = modal.find("input[name='userid']");
	var modalInputRegdate = modal.find("input[name='regdate']");
	
	//----------------------------------------------------
	
	var modalModBtn	= $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var myModalLabel = $("#myModalLabel");
	
	//특정 댓글 보여주는 함수 (모달창)
	//댓글을 클릭하면 모달 창을 띄우고 li에도 영향이 가도록 설정
	$(".chat-list").on("click", "li", function (e) {
		//클래스 chat을 클릭하는데, 하위 요소가 li라면
		
		//this = .chat-list
		//.data("rno") = li val("rno")
		var rno = $(this).data("rno");
		//댓글에 포함된 값들 중에서 rno를 추출하여 변수 할당.
		
		//function (reply) 로 받아온 내용을 모달 input에 셋팅
		replyService.passlatter_Get(rno, function (reply) {
			modalInputReply.val(reply.reply);
			modalInputUserid.val(reply.userid).attr("readonly","readonly");
			modalInputRegdate.val(replyService.displayTime(reply.regdate)).attr("readonly","readonly");
			
	         //표시 되는 모달창에 rno라는 이름으로 data-rno를 저장
	         modal.data("rno", reply.rno);
	      "<sec:authorize access="isAuthenticated()">"   
	         var a= reply.userid;
	         var b= "<sec:authentication property="principal.username"/>";
	         
	         console.log("a..........."+a);
	         console.log("b..........."+b);
	         
	               
	         //modalCloseBtn이 아닌 다른 버튼은 숨기기
	         modal.find("button[id !='modalCloseBtn']").hide();
	         
	         if(a===b){
	            //.closest() : 선택한 요소의 가장 가까운 상위요소를 선택
	            $("#modalModBtn").show();
	            $("#modalRemoveBtn").show();
	            $("#myModal").modal("show");
	         }else if(a!==b){
	            $("#modalModBtn").hide();
	            $("#modalRemoveBtn").hide();
	            $("#myModal").modal("show");
	         }
	      "</sec:authorize>"
		}); //end replyService.passlatter_Get
	}); //end .chat-list onclick function

	//댓글 수정
	modalModBtn.on("click", function(e){
		var reply = {
				rno : modal.data("rno"),
				reply : modalInputReply.val()
		};
		
		replyService.passlatter_Update(reply, function(result){
			alert("댓글이 수정되었습니다.");
			$("#myModal").modal("hide");
			showList(pageNum);
		});//end replyService.passlatter_Update
	});//end modalModBtn onclick function
	
	//댓글 삭제
	modalRemoveBtn.on("click", function(e){
		var rno = modal.data("rno");
		
		replyService.passlatter_Remove(rno, function(deleteResult){
			alert("댓글이 삭제되었습니다.");
			$("#myModal").modal("hide");
			showList(pageNum);
		}); //end replyService.passlatter_Remove
	});//end modalRemoveBtn onclick function
});
</script>
	
<script type="text/javascript">

function goPost(Like){
	var p = document.createElement('form');
	var obj;	

	obj = document.createElement('input');
	obj.setAttribute('type', 'hidden');
	obj.setAttribute('name', 'likes');
	obj.setAttribute('value', 'Passlatter');

	p.appendChild(obj);
	p.setAttribute('method','post');
	document.body.appendChild(p);

	var p2 = document.createElement('form');
	var obj2;

	obj2 = document.createElement('input');
	obj2.setAttribute('type', 'hidden');
	obj2.setAttribute('name', '${_csrf.parameterName}');
	obj2.setAttribute('value', '${_csrf.token}');

	p2.appendChild(obj2);
	p2.setAttribute('method','post');
	p2.setAttribute('action',"/board/user/Passlatter/reg-detail2?bno=<c:out value="${board.bno }"/>");
	document.body.appendChild(p2);
	p2.submit(); 
};

$(document).ready(function () {
	var operForm = $("#operForm");
	//button 중 data-oper의 값이 modify인 것이 클릭 됐을 때 메서드 실행
	//= $(".또는 #").click(function (e)
	$(".btn-reg-detail").on("click", "button", function (e) {
		//잘 실행되는지 확인 this == button
		var operation = $(this).data("oper");
		console.log(operation);
		
		if(operation === "modify"){
			$("button[data-oper='modify']").unbind('click');
			operForm.attr("action", "/board/user/Passlatter/modify");
			
		}else if(operation === "community"){
			$("button[data-oper='community']").unbind('click');
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/user/Passlatter/community");
			
		}else if(operation === "remove"){
			if(confirm("정말 삭제하시겠습니까?") == true){
				$("button[data-oper='remove']").unbind('click');
				operForm.attr("action", "/board/user/Passlatter/remove").attr("method", "post");
				}else{
					return false;
				}
		}else if(operation === "reg-detail+"){
			operForm.attr("action", "/board/user/Passlatter/reg-detail?bno=<c:out value="${board.bno }"/>").attr("method","post");
		}
		
		operForm.submit();
	});
	
	"<sec:authorize access="isAuthenticated()">"	
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
	"</sec:authorize>"
});	
</script>