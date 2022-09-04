<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<style>
.footer {
   transform: translatY(-100%);
   width: 1663px;
   margin: 0px;
}

.f_row {
   display: flex;
   justify-content: space-between;
   background-color: rgb(72, 166, 144); 
   padding-left: 300px;
   padding-bottom: 20px;
}

.col {
   font-size: 15px;
}

.footer-top {
   margin-top: 15px;
   margin-bottom: 20px;
   font-size: 18px;
   font-weight: 700;   
}

.nav {
   display: inline-block;
}

.li_1 {
   list-style: none;
   line-height: 1.8;
}

.li_1 .btnn{
 border: 1px solid silver;
}
</style>

<div class="footer">
   <div class="f_row">
      <div class="col" style="padding-left: 50px;">
         <h4 class="footer-top">상담시간</h4>
         <ul class="nav">
            <li class="li_1"><b>평일 10:00-18:00</b> (점심시간 12:00-13:00)</li>
            <li class="li_1"><b>일요일 및 공휴일은 휴무</b></li>
            <li class="li_1"><b>Tel :</b> 1800-5011</li>
            <li class="li_1"><b>E-mail :</b> devilsdotcom@gmail.com</li><br>
            <li class="li_1">
	            <sec:authorize access="isAuthenticated()">
	            	<a href="/board/user/Ask/AskReg2"><button class="btnn" type="button">1:1 문의하기</button></a>
	            </sec:authorize>
            </li>
            
         </ul>
      </div>

      <div class="col" style="padding-right : 0px;">
         <form>
            <h4 class="footer-top">데빌스</h4>
            <div class="subscribe">
               <p>사용자들 간의 원활한 소통을 지향하고 있습니다.<br>
                바른 커뮤니티 문화를 위해 유저간 욕설, 비방 등의 댓글을 삼가주시기 바랍니다.
               </p>
               <p>
               <b>Copyright ⓒ</b> 2022 www.dev'ils.com  <b>All rights reserved.</b>
               </p>
            </div>
         </form>
      </div>
   </div>
</div>
</body>
</html>