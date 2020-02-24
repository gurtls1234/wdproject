<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 
signUpAndsignInModal 
1. 웹사이트 본문에서 별도의 윈도우가 필요한 경우에 띄우는 팝업 윈도우 같은 것
2. data- target의 value는 버튼 클릭 시 모달로 띄우고자 하는 id값을 #을 붙여서 연결
3. data- toggle의 value는 모달기능을 수행하겠다는 의미
4. 모달창 영역에 버튼태그의 data- dismiss 속성을 적용하면 모달을 닫게 하는 기능을 적용한다는 의미
5. aria- labelledby : 모달의 타이틀 지정
6. aria- hidden="true" : 리더기에게 이 부분은 건너뛰어도 된다고 알리는 부분
7. data- dismiss="modal" : 모달을 닫는 기능을 갖고 있다.
-->
<style>

.wdsize{
	width:400px;
}

.signinbutton{
	width: 100%;
    outline: none;
    border: 1px solid transparent;
    border-radius: 3px;
    color: #fff;
    padding: 13px 20px 13px 20px;
    font-size: 16px;
    font-weight: 600;
    text-align: center;
}
</style>
	<div class="modal fade" id="signInModal" tabindex="-1" role="dialog" aria-labelledby=signInModalLabel aria-hidden="true">
	  <div class="modal-dialog wdsize" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">회원가입 / 로그인</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form id="signInForm" action="/user/signin" method="post">
			   	<div>
			   		<input class="inputstyle"  name="email" type="email" id="emailInput" placeholder="이메일을 입력해주세요." autofocus>
			   	</div>
			   	<div>
			   		<input class="inputstyle" name="passwd" type="password" id="passwdInput" placeholder="비밀번호를 입력해주세요.">
			   	</div>
			   	<div>
			   		<a class="btn btn-primary signinbutton" href="javascript:submitSignInForm()"><i class="fas fa-sign-in-alt" style="float: left;margin:3px 0;"></i>로그인</a>
			   	</div>
			   	<hr>
			   	<a class="btn btn-primary" style="width: 100%;height: 52px; padding: 13px 20px;" role="button" data-dismiss="modal" data-toggle="modal" href="#signUpModal"><i class="fas fa-user-plus" style="float: left;margin:3px 0;"></i>회원가입</a>
		   	</form>
	      </div>
	      <!-- <div class="modal-footer">
	        <a href="#">forget password?</a>
	      </div> -->
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="signUpModal" tabindex="-1" role="dialog" aria-labelledby="signUpModalLabel" aria-hidden="true">
	  <div class="modal-dialog wdsize" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">회원가입 / 로그인</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      <form id="signUpForm" action="/user/signup" method="post">
	      	<div>
	      		<input class="inputstyle" type="text" name="name" id="signUpNameInput" placeholder="이름을 입력해주세요.">
	      	</div>
	      	<div>
	      		<input class="inputstyle" type="email" name="email" id="signUpEmailInput" placeholder="이메일을 입력해주세요.">
	      	</div>
	      	<div>
	      		<input class="inputstyle" type="text" name="phone" id="signUpPhoneInput" placeholder="전화번호를 입력해주세요.">
	      	</div>
	      	<div>
	      		<input class="inputstyle" type="password" name="passwd" id="signUpPasswdInput" placeholder="비밀번호를 입력해주세요.">
	      	</div>
	      	<div>
	      		<input class="inputstyle" type="password" name="repasswd" id="signUpRepasswdInput" placeholder="다시 한번 비밀번호를 입력해주세요.">
	      	</div>
	      	<hr>
	      	<a class="btn btn-primary" href="javascript:submitSignUpFrom();">등록</a>
	      </form>
	      </div>
		  <div class="modal-footer">
	        <a data-dismiss="modal" data-toggle="modal" href="#signInModal">already have a Account?</a>
	      </div>
	    </div>
	  </div>
	</div> 

	 