<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="/resources/css/wanted-font.css"/>
    
</head>
<body style="background-color: #f3f3f3;">
	<jsp:include page="./topbar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div style="width:250px;text-align: center; margin-top:70px; background-color: white; border: 1px solid #e1e2e3; padding: 42px 20px; border-radius: 3px;">
				<div class="profile">
					<div style="width: 77px; height: 77px;margin: auto;">
						<input type="file" accept="image/*" style="display:none;width: 100%;height: 100%;"/>
					</div>
				</div>
				<div class="info" style="margin-top: 31px; ">
					<div class="name" style="font-size: 18px; font-weight: 600; ">${user.name }</div>
					<div class="email" style="margin-top: 20px; font-size: 14px; font-weight: 500; color: #999;">${user.email }</div>
					<div class="phone" style="margin-top: 10px; font-size: 14px; font-weight: 500; color: #999;">${user.phone }</div>
				</div>
				<div class="modify-button" style="margin: 30px auto 0;">
					<button type="button" style="color: #258bf7; border-radius: 20px; border: 1px solid #e1e2e3; font-size: 16px; font-weight: 600; width: 160px; height: 40px;">기본정보 수정</button>
				</div>
			</div>
			<div class="col-9" style="padding: 41px 30px; margin-top:70px; margin-left:30px;background-color: white; border: 1px solid #e1e2e3; border-radius: 3px;"">
				<div class="title">
					<div style="font-size: 20px;font-weight: 600;">기본정보 수정</div>
					<div style="margin-top: 18px;color: #9a9a9a;font-size: 16px;font-weight: 400;">지원 결과 또는 추천 포지션 정보를 받아볼 이메일/연락처 정보 입력해주세요.</div>
				</div>
				<div class="row" style="margin-top: 43px;">
					<div class="col-3">
						<div style="color: #999;font-size: 16px; margin:19px 0px;">이름</div>
					</div>
					<div class="col-9">
						<div>
							<input id = "name" style="width:100%; font-size: 16px;font-weight: 400;border:0;border-bottom: 1px solid #e1e2e3;padding: 12px 0;" type="text" id="name" value="${user.name }"/>
						</div>
					</div>
				</div>
				<div class="row" style="margin-top: 15px;">
					<div class="col-3">
						<div style="color: #999;font-size: 16px;margin:19px 0px;">이메일</div>
					</div>
					<div class="col-9">
						<div>
							<input id="email" style="width:100%; font-size: 16px;font-weight: 400;border:0;border-bottom: 1px solid #e1e2e3;padding: 12px 0;" type="text" id="email" value="${user.email }"/>
						</div>
					</div>
				</div>
				<div class="row" style="margin-top: 15px;">
					<div class="col-3">
						<div style="color: #999;font-size: 16px;margin:19px 0px;">연락처</div>
					</div>
					<div class="col-3">
						<div>
							<select  style="padding: 14px 20px; font-size: 16px;font-weight: 400; border: 0;border-radius: 3px;background-color: #f8f8fa;">
								<option value="+82">+82 South Korea</option>
								<option value="+81">+81 Japan</option>
								<option value="+886">+886 Taiwan</option>
							</select>
						</div>
					</div>
					<div class="col-6">
						<input id="phone" style="width:100%; font-size: 16px;font-weight: 400;border:0;border-bottom: 1px solid #e1e2e3;padding: 12px 0;" id="mobile" type="text" value="${user.phone }"/>
					</div>
				</div>
				<div>
					<button class="btn-primary" id = "mypage-button"; style="float:right; border: 0; width: 190px; height: 50px; margin-top:45px; border-radius: 3px;font-size: 18px;font-weight: 600;">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="/resources/js/jquery-serialize-object.js"></script>
    <script src="/resources/js/sign-check.js"></script>
    
    <script type="text/javascript">
    $("#mypage-button").click(function(){
        var email = $("#email").val();
        var name = $("#name").val();
        var phone = $("#phone").val();
         
        $.ajax({
            type:"PUT",
            url:"/updatemyinfo",
            data:JSON.stringify({"name": name, "phone": phone, "email":email}),
			contentType: "application/json;charSet=UTF-8",
			success:function(data){
				location.reload();
			},
			error:function(err){
				alert(err.responseJSON);
			}
        })
     });
    </script>
</body>
</html>