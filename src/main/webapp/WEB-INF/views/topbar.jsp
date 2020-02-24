<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


		<nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #ffffff;box-shadow: 0 1px 0 0 rgba(0,0,0,.1);">
	        <div style="width: 1060px; margin: auto;">
	        	<div style="float: left;">
		        	<a class="navbar-brand" href="/wd/list">
		            	<i class="icon-logo_new" style="font-size: 19px;font-weight: 400;"></i>
		        	</a>
		        </div>
		        <div class="collapse navbar-collapse" style="float: left;width: 800px;">
		            <ul class="navbar-nav" style="margin: auto;">
		                <li class="nav-item">
		                    <a class="nav-link" href="/wd/list"><span style="font-size: 16px;font-weight: 600;">탐색</span></a>
		                </li>
		                <li class="nav-item">
			                <a class="nav-link" href="/cv/list"><span style="font-size: 16px;font-weight: 600;">이력서</span></a>
		                </li>
		            </ul>
		        </div>
		        <div style="float:right;">
		        <c:choose>
		        	<c:when test="${user == null}">
			            <ul class="navbar-nav">
			                <li class="nav-item">
			                    <a class="nav-link" href="#" data-toggle="modal" data-target="#signInModal"><span style="font-size: 16px;font-weight: 600;">회원가입/로그인</span></a>
			                </li>
			            </ul>
			        </c:when>
			        <c:when test="${user != null}">
			            <ul class="navbar-nav" style="float:right;position: relative;">
			                <li class="nav-item dropdown">
			                    <a class="nav-link dropdown-toggle"  role="button" id="menu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 16px;font-weight: 600;">${user.name}</a>
			                    <div class="dropdown-menu" aria-labelledby="menu">
				                    <a class="dropdown-item" href="/mypage">내정보</a>
				                    <a class="dropdown-item" href="/applications">지원현황</a>
				                    <a class="dropdown-item" href="/user/signout">로그아웃</a>
				                </div>
			                </li>
			            </ul>
			        </c:when>
		        </c:choose>
		        </div>
	        </div>
		</nav>