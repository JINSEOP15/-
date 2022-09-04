<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Dev'ils</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- icons -->
  <link rel="icon" type="img/png" sizes="16x16" href="/resources/image/favicon-16x16.png">
  <!-- Google Fonts -->
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,600,700"
    rel="stylesheet">
  
 <script src="https://code.jquery.com/jquery-3.4.1.js" ></script>
  
  <!--  CSS Files -->
  <link href="/resources/dist/css/aos.css" rel="stylesheet">
  <link href="/resources/dist/css/bootstrap.inquiry_m.css" rel="stylesheet">
  <link href="/resources/dist/css/style.css" rel="stylesheet">  
  <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/headers/">

<style type="text/css">
.container2{
  display: flex;
 flex-direction: row;
width: 1200px;
}
</style>
</head>

<body>

  <!-- ======= Header ======= -->
<header id="header" class="fixed-top d-flex align-items-center" style="position: relative; left: 50px;">
<div class="container d-flex align-items-center">
  
      	 <!-- img logo -->
  <a href="/board/user/index.html" class="logo me-auto" id="headlogo">
    <img src="/resources/image/logo.png" alt="" height="150" width="200" class="img-fluid ">
  </a>

  <nav id="navbar" class="navbar order-last order-lg-0">
  	<ul id="main-menu">
    	<li><a class="nav-link scrollto " href="/board/user/index.html">홈</a></li>
    	<li><a class="nav-link scrollto" href="/board/user/CompanyVal/community.html">회사평가</a></li>
    	<li><a class="nav-link scrollto" href="/board/user/InterviewAns/community.html">면접질문</a></li>
    	<li><a class="nav-link scrollto" href="/board/user/Passlatter/community.html">합격후기</a></li>
    	<li><a class="nav-link scrollto" href="/board/user/WorryQnA/community.html">Q&A</a></li>
    	<li><a class="nav-link scrollto " href="/board/user/PassSelfIntroduct/community.html">합격자소서</a></li>
  	</ul>
          


	<div class="container" id="log" style="width: 300px;">
		<sec:authorize access="isAuthenticated()">
			<div class="container" id="nickname"><b id="log2"><sec:authentication property="principal.username"/></b> 님</div>
		</sec:authorize>
		<sec:authorize access="isAnonymous()">
			<a href="/board/user/login.html">
  				<button type="button" class="btn btn-outline-primary" name="login" id="loginbtn" >로그인</button></a>
  			<a href="/board/user/sign.html">
  				<button type="button" class="btn btn-outline-primary" name="signup" id="signbtn" style="position: relative; right: 80px;">회원가입</button></a>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_USER')"> 
			<a href="/board/user/mypage?userid=<sec:authentication property="principal.username"/>" id="mypagelink">
				<button type="button" class="btn btn-outline-primary" data-oper="mypage" id="mypage">마이페이지</button></a>
			<form action="/customLogout" method="post">
				<button type="submit" class="btn btn-outline-primary" data-oper="logout" id="logout">로그아웃</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>	
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_ADMIN')" >
			<a href="/board/admin/management.html">
				<button type="button" class="btn btn-outline-primary" data-oper="admin" id="adminpage">관리자페이지</button></a>
			<form action="/customLogout" method="post">
				<button type="submit" class="btn btn-outline-primary" data-oper="logout" id="adminlogout">로그아웃</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>	
		</sec:authorize>
	</div>
	<i class="bi bi-list mobile-nav-toggle"></i>
  </nav><!-- .navbar -->
</div>
</header>

<body>

<script src="/resources/dist/js/aos.js"></script>