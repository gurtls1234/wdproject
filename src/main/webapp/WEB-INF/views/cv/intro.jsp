<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="/resources/css/wanted-font.css"/>
    
    <title>이력서 | 원티드</title>
    
    <style>
        body {
             font-family: -apple-system, Helvetica, Arial, "hiragino kaku gothic pro", meiryo, "Microsoft YaHei", "ms pgothic", "Apple SD Gothic Neo", "Nanum Gothic", "Malgun Gothic", sans-serif;
        }
        
        .inputstyle {
			width: 100%;
			border: 1px solid #dbdbdb;
			border-radius: 3px;
			padding: 13px 15px;
			font-size: 16px;
			color: #333;
			margin-bottom: 10px;
		 }
    </style>
</head>
<body>
	<jsp:include page="../topbar.jsp"></jsp:include>
    <div class="row" style="text-align:center;height: 400px;">
        <div class="col-2"></div>
        <div class="col-8" style="padding: 100px 0px 20px 0px;">
            <h1 style="font-size: 56px;font-weight: 600; margin-bottom: 10px;">이력서 양식, 그 이상</h1>
            <h2 style="font-size: 18px;font-weight: 400; margin-bottom: 30px;">
                <span>채용 전문가들의 조언을 얻어, 이력서를 잘 쓸 수 있는 도구를 만들었습니다. </span><br>
                <span>서류 통과가 잘 되는 원티드 이력서를 쉽고 빠르게 작성해 보세요.</span>
            </h2>
            <div>
                <button type="button" class="btn btn-outline-primary" style="border-radius: 2rem; padding-top: 15px;
                padding-bottom: 15px; padding-left: 50px; padding-right: 50px; font-weight: 600;">이력서 관리</button>&nbsp;
                <button type="button" class="btn btn-primary" style="border-radius: 2rem; padding-top: 15px;
                padding-bottom: 15px; padding-left: 50px; padding-right: 50px; font-weight: 600;">새 이력서 작성</button>
            </div>
        </div>
        <div class="col-2"></div>
    </div>
    <div class="row" style="height: 270px;">
        <div class="col-1"></div>
        <dic class="col-10" style="background-position: center;background-image:url('https://s3.ap-northeast-2.amazonaws.com/wanted-public/resume_intro/resume_01_en.png');width: 100%;"></dic>
        <div class="col-1"></div>
    </div>
    <div class="row">
        <div style="background-position: center;background-size: cover;padding-bottom: 20%;background-image: url('https://s3.ap-northeast-2.amazonaws.com/wanted-public/resume_intro/resume_02.jpg');width: 100%;">
            <div style="width: 100%;text-align: center;padding-top: 80px;">
                <span style="color: white; font-weight: 600;
                font-size: 40px;">지원에 유리한</span>
            </div>
            <div style="width: 100%;text-align: center;padding-top: 20px;">
                <span style="color: white;font-size: 18px;
                font-weight: 400;">글로벌 기업에 보편적이고, 성별이나 가족관계 등 차별 금지 정책에 맞춰서 제작하였습니다.
                   <br> 군더더기 없이, 당신의 진짜 경쟁력을 드러 내 보세요.</span>
            </div>
        </div>
    </div>
    <div class="row">
        <div style="padding-top: 5%;">
            <div>
                <span>본질에 집중한</span>
            </div>
            <div>
                <span>보다 명확한 정보 설계로 당신의 커리어를 돋보이게 만들어 드립니다.
                        <br>불필요한 정보 입력을 최소화하고 이력서 작성에 방해가 되는 UI 요소들을 제거하였습니다.</span>
            </div>
        </div>
        <div>

        </div>
    </div>
    <jsp:include page="../user/signUpAndsignInModal.jsp"></jsp:include>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="/resources/js/jquery-serialize-object.js"></script>
    <script src="/resources/js/sign-check.js"></script>
</body>
</html>