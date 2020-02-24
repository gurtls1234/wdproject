<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>새 이력서 | 원티드</title>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/wanted-font.css"/>
    
    <style>
        body {
             font-family: -apple-system, Helvetica, Arial, "hiragino kaku gothic pro", meiryo, "Microsoft YaHei", "ms pgothic", "Apple SD Gothic Neo", "Nanum Gothic", "Malgun Gothic", sans-serif;
        }

        .container{
            padding: 0;
        }
        .row{
            margin: 0;
        }
        .col{
        	padding: 0;
        }
        
        .downloadbutton{
       	    border-color: #999;
       	    border: 1px solid;
		    width: 40px;
		    min-width: unset;
		    height: 40px;
		    padding: 0;
		    margin-left: 10px;
		    color: #76797e;
    		background-color: #ffffff;
    		border-radius: 3px;
        }
        
        .input-name{
        	width: 100%;
        	margin: 30px 0px 30px 0px;
        	color: #3b3d40;
		    font-size: 30px;
		    font-weight: 500;
		    border: none;
		    height: auto;
        }
        
        input{
        	border: none;
        }
        
        .input-email{
        	margin-top: 10px;
        	font-size: 16px;
        	border: none;
        	width: 100%;
        	height: auto;
        }
        
        .input-phone{
        	margin-top: 10px;
        	font-size: 16px;
        	border: none;
        	width: 100%;
        	height: auto;
        }
        
        .textarea-introduce{
        	overflow: hidden;
        	resize: none;
        	width: 100%;
        	border: none;
        	margin-bottom: 63px;
        	font-size: 16px;
        	margin-top: 30px;
        	height: 34px;
        }
        
        textarea:focus {
  			outline: none;
		}
		
		input:focus {
		 	outline: none;
		}
		
		.resume-list{
			padding: 40px 0 6px;
		    font-size: 16px;
		    font-weight: 500;
		    color: #3b3d40;
		    border-bottom: 1px solid #bababa;
		}
		
		.resume-button{
			width: 100%;
		    padding: 30px 0;
		    display: block;
		    font-size: 18px;
		    font-weight: 400;
		    text-align: left;
		    border: none;
		    border-radius: 0;
		    color: #176fd8;
		    background-color: transparent;
		    border-bottom: 1px solid #f1f1f1;
		}
		ul{
			list-style: none;
		    margin-bottom: 20px;
    		padding-left: 0;
		}
		
		.checkbox{
			font-size: 14px;
		    font-weight: 600;
		    color: rgba(0, 0, 0, 0.4);
		}
		
		textarea{
			overflow: auto;
			resize: none;
		}
		
		.col-sm-offset-3 {
		    margin-left: 25%;
		}
		
		.dropdown-toggle.after-display-none::after {
        	display:none;
        }
    </style>
</head>
<body>
	<div>
		<div>
			<jsp:include page="../topbar.jsp"></jsp:include>
		</div>
		<div>
			<div class="container" style="padding-top: 80px;">
				<div class="row justify-content-end">
					<div class="col-md-auto">
						<button type="button" class="btn btn-primary" id="cv-save-button">저장</button>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<input id="input-user-name" class="input-name" type="text" placeholder="이름" value="${ cv == null ? user.name : cv.content.userName }">
					</div>
					<div style="display: none;">
						<input id ="input-cv-title" type="hidden" value="${user.name}">
					</div>
				</div>
				<div class="row">
					<div class="col">
						<input id="input-user-email" class="input-email" type="text" maxlength="120" placeholder="이메일(필수)" value="${ cv == null ? user.email : cv.content.userEmail }">
					</div>
				</div>
				<div class="row">
					<div class="col">
						<input id="input-user-phone" class="input-phone" type="text" maxlength="200" placeholder="연락처(필수)" value="${ cv == null ? user.phone : cv.content.userPhone }">
					</div>
				</div>
				<div class="row">
					<div class="col">
						<textarea id="input-introduction" class="textarea-introduce" maxlength="2000" placeholder="간단한 자기소개를 통해 이력서를 돋보이게 만들어보세요. (3~5줄 권장)">${cv == null ? "" : cv.content.introduction}</textarea>
					</div>
				</div>
				<div class="row">
					<div class="col resume-list">
						<span>경력</span>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<button class="resume-button" type="button" id="career-list-add-button">+ 추가</button>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<ul id="career-list-ul"></ul>
					</div>
				</div>
				<div class="row">
					<div class="col resume-list">
						<span>학력</span>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<button class="resume-button" type="button" id="education-list-add-button">+ 추가</button>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<ul id="education-list-ul"></ul>
					</div>
				</div>
				<div class="row">
					<div class="col resume-list">
						<span>수상 및 기타</span>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<button class="resume-button" type="button" id="activity-list-add-button">+ 추가</button>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<ul id="activity-list-ul"></ul>
					</div>
				</div>
				<div class="row">
					<div class="col resume-list">
						<span>외국어</span>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<button class="resume-button" type="button" id="language-cert-list-add-button">+ 추가</button>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<ul id="language-cert-list-ul"></ul>
					</div>
				</div>
				<div class="row">
					<div class="col resume-list">
						<span>링크</span>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<button class="resume-button" type="button" id="link-list-add-button">+ 추가</button>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<ul id="link-list-ul"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script id="career-list-item-template" type="text/x-handlebars-template">
		<li style="padding: 30px;" id="career-list-li-{{index}}">
			<div class="row">
				<div class="col-sm-3" style="padding-left: 0px; padding-right: 0px;">
					<div>
						<div>
							<div style="display: inline-block;">
								<div style="display: inline-block;">
									<input type="text" id="input-start-year" maxlength="4" placeholder="YYYY" value="{{startYear}}" style="width: 36px; font-size: 14px;"/>
								</div>
								<span>.</span>
								<div style="display: inline-block;">
									<input type="text" id="input-start-month" maxlength="2" placeholder="MM" value="{{startMonth}}" style="width: 26px; margin-left: 4px; font-size: 14px;"/>
								</div>
							</div>
							<div style="display: inline-block;">
								<span>-</span>
								<div style="display: inline-block;">
									<input type="text" id="input-end-year" maxlength="4" placeholder="YYYY" value="{{endYear}}" style="width: 36px; font-size: 14px;"/>
								</div>
								<span>.</span>
								<div style="display: inline-block;">
									<input type="text" id="input-end-month" maxlength="2" placeholder="MM" value="{{endMonth}}" style="width: 26px; margin-left: 4px; font-size: 14px;"/>
								</div>
							</div>
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox"/>
								<span>현재 재직중</span>
							</label>
						</div>
					</div>
				</div>
				<div class="col-sm-9" style="padding-left: 0px; padding-right: 0px;">
					<div>
						<input type="search" id="input-company-name" placeholder="회사명" value="{{companyName}}" style="font-size: 20px; color: #3b3d40; font-weight: 600; width: 90%;"/>
						<button type="button" style="font-size: 10px; padding: 15px; border: 0; background-color: transparent; color: #d1d1d1;" onclick="removeItem('career-list-li-{{index}}')"><i class="icon-close"></i></button> 
					</div>
					<div>
						<input type="text"id="input-part-name" maxlength="255" placeholder="부서명/직책" value="{{partName}}" style="font-size: 16px; width: 100%;"/>
					</div>
					<div>
						<div>
							<button type="button" style="color: #176fd8; width: 100%; 
												font-size: 16px; padding-top: 20px; 
												padding-bottom: 20px; text-align: left;
												border: none;
												background-color: transparent;">+ 주요 성과 추가</button>
						</div>
					</div>
				</div>
			</div>
		</li>
	</script>
	
    <script id="education-list-item-template" type="text/x-handlebars-template">
		<li style="padding: 30px;" id="education-list-li-{{index}}">
			<div class="row">
				<div class="col-sm-3" style="padding-left: 0px; padding-right: 0px;">
					<div>
						<div>
							<div style="display: inline-block;">
								<div style="display: inline-block;">
									<input id="input-start-year" type="text" maxlength="4" placeholder="YYYY" value="{{startYear}}" style="width: 36px; font-size: 14px;">
								</div>
								<span>.</span>
								<div style="display: inline-block;">
									<input id="input-start-month" type="text" maxlength="2" placeholder="MM" value="{{startMonth}}" style="width: 26px; margin-left: 4px; font-size: 14px;">
								</div>
							</div>
							<div style="display: inline-block;">
								<span>-</span>
								<div style="display: inline-block;">
									<input id="input-end-year" type="text" maxlength="4" placeholder="YYYY" value="{{endYear}}" style="width: 36px; font-size: 14px;">
								</div>
								<span>.</span>
								<div style="display: inline-block;">
									<input id="input-end-month"type="text" maxlength="2" placeholder="MM" value="{{endMonth}}" style="width: 26px; margin-left: 4px; font-size: 14px;">
								</div>
							</div>
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox"/>
								<span>현재 재학중</span>
							</label>
						</div>
					</div>
				</div>
				<div class="col-sm-9" style="padding-left: 0px; padding-right: 0px;">
					<div>
						<input id="input-school-Name"type="search" placeholder="학교명" value="{{schoolName}}" style="font-size: 20px; color: #3b3d40; font-weight: 500; width: 90%;">
						<button type="button" style="font-size: 10px; padding: 15px; border: 0; background-color: transparent; color: #d1d1d1;" onclick="removeItem('education-list-li-{{index}}')"><i class="icon-close"></i></button>
					</div>
					<div>
						<input id="input-major" type="text" placeholder="전공 및 학위(ex: 경영학과 학사)" value="{{major}}" style="font-size: 16px; width: 100%;">
					</div>
					<div>
						<div>
							<textarea id="input-description" rows="" cols="" style="height:34px; width: 100%; border: none; font-size: 14px; line-height: 1.6;" placeholder="이수과목 또는 연구내용">{{description}}</textarea>
						</div>
					</div>
				</div>
			</div>
		</li>
	</script>

    <script id="activity-list-item-template" type="text/x-handlebars-template">
		<li style="padding: 30px;" id="activity-list-li-{{index}}">
			<div class="row">
				<div class="col-sm-3" style="padding-left: 0px; padding-right: 0px;">
					<div>
						<div>
							<div style="display: inline-block;">
								<div style="display: inline-block;">
									<input id="input-year" type="text" maxlength="4" placeholder="YYYY" value="{{year}}" style="width: 36px; font-size: 14px;">
								</div>
								<span>.</span>
								<div style="display: inline-block;">
									<input id="input-month"type="text" maxlength="2" placeholder="MM" value="{{month}}" style="width: 26px; margin-left: 4px; font-size: 14px;">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-9" style="padding-left: 0px; padding-right: 0px;">
					<div>
						<input id="input-activity-name" type="text" maxlength="255" placeholder="활동명" value="{{name}}" style="font-size: 20px; color: #3b3d40; font-weight: 500; width: 90%;">
						<button type="button" style="font-size: 10px; padding: 15px; border: 0; background-color: transparent; color: #d1d1d1;" onclick="removeItem('activity-list-li-{{index}}')"><i class="icon-close"></i></button> 
					</div>
					<div>
						<div>
							<textarea id="input-description" rows="" cols="" maxlength="1000" style="height:34px; width: 100%; border: none; font-size: 14px; line-height: 1.6;" placeholder="세부사항">{{description}}</textarea>
						</div>
					</div>
				</div>
			</div>
		</li>
	</script>

    <script id="language-cert-list-item-template" type="text/x-handlebars-template">
		<li style="padding: 30px;" id="language-cert-list-li-{{index}}">
			<div class="row">
				<div class="col-sm-9 col-sm-offset-3" style="padding-left: 0px; padding-right: 0px;">
					<div style="display: flex;">
						<div class="dropdown" style="flex: 1">
							<button class="dropdown-toggle after-display-none" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" type="button" style="font-size: 20px; color: #3b3d40; font-weight: 500; background: transparent; border: 0; padding: 0;">
								<span id="span-language">{{#if language}}{{language}}{{else}}언어{{/if}}</span>
								<input type="hidden" id="input-language"/>
								<i style="margin-top: 3px; margin-left: 5px; color: #258bf7; font-size: 20px; vertical-align: top;" class="icon-arrow_down"></i>
							</button>
							<div class="dropdown-menu" aria-labelledby="input-language">
			                    <a class="dropdown-item" href="javascript:setLanguageCertLang('language-cert-list-li-{{index}}', '영어')">영어</a>
			                    <a class="dropdown-item" href="javascript:setLanguageCertLang('language-cert-list-li-{{index}}', '중국어')">중국어</a>
			                    <a class="dropdown-item" href="javascript:setLanguageCertLang('language-cert-list-li-{{index}}', '일본어')">일본어</a>
			            	</div>
						</div>
						<button type="button" style="font-size: 10px; border: 0; background-color: transparent; color: #d1d1d1;" onclick="removeItem('language-cert-list-li-{{index}}')"><i class="icon-close"></i></button>
						
					</div>
					<div class="dropdown">
						<button class="dropdown-toggle after-display-none" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" type="button" style="font-size: 16px; color: #3b3d40; background: transparent; border: 0; padding: 0;">
							<span id="span-level">{{#if level}}{{level}}{{else}}수준{{/if}}</span>
							<input type="hidden" id="input-level"/>
							<i style="margin-top: 3px; margin-left: 5px; color: #258bf7; font-size: 20px; vertical-align: top;" class="icon-arrow_down"></i>
						</button>
						<div class="dropdown-menu" aria-labelledby="input-level">
			                <a class="dropdown-item" href="javascript:setLanguageCertLevel('language-cert-list-li-{{index}}', '유창함')">유창함</a>
			                <a class="dropdown-item" href="javascript:setLanguageCertLevel('language-cert-list-li-{{index}}', '비즈니스회화')">비즈니스회화</a>
			                <a class="dropdown-item" href="javascript:setLanguageCertLevel('language-cert-list-li-{{index}}', '일상회화')">일상회화</a>
			            </div>
					</div>
					<div>
						<div>
							<button type="button" style="color: #176fd8; width: 100%; 
							font-size: 16px; padding-top: 20px; 
							padding-bottom: 20px; text-align: left;
							border: none;
							background-color: transparent;
							font-weight: 400;">+ 어학시험 추가</button>
						</div>
					</div>
				</div>
			</div>
		</li>
	</script>

    <script id="link-list-item-template" type="text/x-handlebars-template">
		<li style="padding: 30px;" id="link-list-li-{{index}}">
			<div>
				<div>
					<input id="input-link" type="text" maxlength="300" placeholder="http://" value="{{link}}" style="width: 90%;"/>
					<button type="button" style="font-size: 10px; padding: 15px; border: 0; background-color: transparent; color: #d1d1d1;" onclick="removeItem('link-list-li-{{index}}')"><i class="icon-close"></i></button> 
				</div>
			</div>
		</li>
	</script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.5.3/handlebars.min.js"></script>
    <script src="/resources/js/jquery-serialize-object.js"></script>
    <script src="/resources/js/sign-check.js"></script>
    
	<script>
		$(document).ready(function(){

			var source, template, data, ul, li;

			source = $("#career-list-item-template").html();
			template = Handlebars.compile(source);
			ul = $("#career-list-ul");
			<c:forEach items="${cv.content.careerList}" var="career" varStatus="status">
				data = {
					"index" : ${status.index}, 
					"startYear": "${career.startYearStr}", 
					"startMonth": "${career.startMonthStr}", 
					"endYear": "${career.endYearStr}", 
					"endMonth": "${career.endMonthStr}", 
					"companyName": "${career.companyName}", 
					"partName": "${career.partName}"
				};
				li = template(data);
				ul.append(li);
			</c:forEach>

			source = $("#education-list-item-template").html();
			template = Handlebars.compile(source);
			ul = $("#education-list-ul");
			<c:forEach items="${cv.content.educationList}" var="education" varStatus="status">
				data = {
					"index" : ${status.index}, 
					"startYear": "${education.startYearStr}", 
					"startMonth": "${education.startMonthStr}", 
					"endYear": "${education.endYearStr}", 
					"endMonth": "${education.endMonthStr}", 
					"schoolName": "${education.schoolName}", 
					"major": "${education.major}",
					"description":"${education.description}"
				};
				li = template(data);
				ul.append(li);
			</c:forEach>

			source = $("#activity-list-item-template").html();
			template = Handlebars.compile(source);
			ul = $("#activity-list-ul");
			<c:forEach items="${cv.content.activityList}" var="activity" varStatus="status">
				data = {
					"index" : ${status.index}, 
					"year": "${activity.yearStr}", 
					"month": "${activity.monthStr}",
					"name": "${activity.name}",
					"description":"${activity.description}"
				};
				li = template(data);
				ul.append(li);
			</c:forEach>

			source = $("#language-cert-list-item-template").html();
			template = Handlebars.compile(source);
			ul = $("#language-cert-list-ul");
			<c:forEach items="${cv.content.languageCertList}" var="languageCert" varStatus="status">
				data = {
					"index" : ${status.index}, 
					"language": "${languageCert.language}",
					"level":"${languageCert.level}"
				};
				li = template(data);
				ul.append(li);
			</c:forEach>

			source = $("#link-list-item-template").html();
			template = Handlebars.compile(source);
			ul = $("#link-list-ul");
			<c:forEach items="${cv.content.linkList}" var="link" varStatus="status">
				data = {
					"index" : ${status.index}, 
					"link": "${link}"
				};
				li = template(data);
				ul.append(li);
			</c:forEach>
			
			$("#career-list-add-button").click(function(){
				var source = $("#career-list-item-template").html();
				var template = Handlebars.compile(source);
				var ul = $("#career-list-ul");
				var lastChildId = $("#career-list-ul li:last-child").attr('id'); // "career-list-li-?"
				var index = !lastChildId ? 1 : Number(lastChildId.substr(lastChildId.lastIndexOf("-")+1)) + 1;
				var data = { "index" : index };
				var li = template(data);
				ul.append(li);
			});
			$("#education-list-add-button").click(function(){
				var source = $("#education-list-item-template").html();
				var template = Handlebars.compile(source);
				var ul = $("#education-list-ul");
				var lastChildId = $("#education-list-ul li:last-child").attr('id'); // "career-list-li-?"
				var index = !lastChildId ? 1 : Number(lastChildId.substr(lastChildId.lastIndexOf("-")+1)) + 1;
				var data = { "index" : index };
				var li = template(data);
				ul.append(li);
			});
			$("#activity-list-add-button").click(function(){
				var source = $("#activity-list-item-template").html();
				var template = Handlebars.compile(source);
				var ul = $("#activity-list-ul");
				var lastChildId = $("#activity-list-ul li:last-child").attr('id'); // "career-list-li-?"
				var index = !lastChildId ? 1 : Number(lastChildId.substr(lastChildId.lastIndexOf("-")+1)) + 1;
				var data = { "index" : index };
				var li = template(data);
				ul.append(li);
			});
			$("#language-cert-list-add-button").click(function(){
				var source = $("#language-cert-list-item-template").html();
				var template = Handlebars.compile(source);
				var ul = $("#language-cert-list-ul");
				var lastChildId = $("#language-cert-list-ul li:last-child").attr('id'); // "career-list-li-?"
				var index = !lastChildId ? 1 : Number(lastChildId.substr(lastChildId.lastIndexOf("-")+1)) + 1;
				var data = { "index" : index };
				var li = template(data);
				ul.append(li);
			});
			$("#link-list-add-button").click(function(){
				var source = $("#link-list-item-template").html();
				var template = Handlebars.compile(source);
				var ul = $("#link-list-ul");
				var lastChildId = $("#link-list-ul li:last-child").attr('id'); // "career-list-li-?"
				var index = !lastChildId ? 1 : Number(lastChildId.substr(lastChildId.lastIndexOf("-")+1)) + 1;
				var data = { "index" : index };
				var li = template(data);
				ul.append(li);
			});
			$("#cv-save-button").click(function(){
				var content = {};

				content["userName"] = $("#input-user-name").val();
				content["userEmail"] = $("#input-user-email").val();
				content["userPhone"] = $("#input-user-phone").val();
				content["introduction"] = $("#input-introduction").val();

				//============================================================================================================

				var careerList = [];

				//children() == getChildList()
				if($("#career-list-ul").children().length > 0) {
					//[li,li,li]
					$("#career-list-ul").children().each(function(){
						
						var li = $(this);
						
						careerList.push(
							{
								"startDate": li.find("#input-start-year").val() + "-" + li.find("#input-start-month").val(),
								"endDate": li.find("#input-end-year").val() + "-" + li.find("#input-end-month").val(),
								"companyName": li.find("#input-company-name").val(),
								"partName": li.find("#input-part-name").val()
							}
						);
					});
				}
				
				content["careerList"] = careerList;

				//============================================================================================================
				
				var educationList = [];

				//children() == getChildList()
				if($("#education-list-ul").children().length > 0) {
					//[li,li,li]
					$("#education-list-ul").children().each(function(){
						var li = $(this);
						educationList.push(
							{
								"startDate": li.find("#input-start-year").val() + "-" + li.find("#input-start-month").val(),
								"endDate": li.find("#input-end-year").val() + "-" + li.find("#input-end-month").val(),
								"schoolName": li.find("#input-school-name").val(),
								"major": li.find("#input-major").val(),
								"description": li.find("#input-description").val()
							}
						);
					});
				}
				
				content["educationList"] = educationList;
				
				//============================================================================================================
				
				var activityList = [];

				//children() == getChildList()
				if($("#activity-list-ul").children().length > 0) {
					//[li,li,li]
					$("#activity-list-ul").children().each(function(){
						var li = $(this);
						activityList.push(
							{
								"date": li.find("#input-year").val() + "-" + li.find("#input-month").val(),
								"name": li.find("#input-activity-name").val(),
								"description": li.find("#input-description").val()
							}
						);
					});
				}
				
				content["activityList"] = activityList;
				
				//============================================================================================================
				
				var languageCertList = [];

				//children() == getChildList()
				if($("#language-cert-list-ul").children().length > 0) {
					//[li,li,li]
					
					$("#language-cert-list-ul").children().each(function(){

						var li = $(this);
						
						if( li.find("#input-language").val() === "" || li.find("#input-level").val() === "" ) {
							return false;
						}
						
						languageCertList.push(
							{
								"language": li.find("#input-language").val(),
								"level": li.find("#input-level").val()
							}
						);
					});

					if($("#language-cert-list-ul").children().length != languageCertList.length) {
						alert("외국어 항목에 선택하지 않은 필드가 있습니다.");
						return;
					}
				}
				
				content["languageCertList"] = languageCertList;
				
				//============================================================================================================
				
				var linkList = [];

				//children() == getChildList()
				if($("#link-list-ul").children().length > 0) {
					//[li,li,li]
					$("#link-list-ul").children().each(function(){
						var li = $(this);
						linkList.push(li.find("#input-link").val());
					});
				}
				
				content["linkList"] = linkList;
				
				//============================================================================================================
				
				<c:choose>
					<c:when test="${cv == null}">
					$.ajax({
						url:"/cv",
						type:"POST",
						data:JSON.stringify({"title": $("#input-cv-title").val(), "content": content}),
						contentType: "application/json;charSet=UTF-8",
						success:function(data){
							location.href='/cv/list';
						},
						error:function(err){
							alert(err.responseJSON);
						}
					});
					</c:when>
					<c:otherwise>
					$.ajax({
						url:"/cv/${cv.sn}",
						type:"PUT",
						data:JSON.stringify({"title": $("#input-cv-title").val(), "content": content}),
						contentType: "application/json;charSet=UTF-8",
						success:function(data){
							location.href='/cv/list';
						},
						error:function(err){
							alert(err.responseJSON);
						}
					});
					</c:otherwise>
				</c:choose>
			});
			
		});

		function removeItem(id){
			$('#'+id).remove();
		}

		function setLanguageCertLang(parentId, value) {
			$("#"+parentId).find("#span-language").html(value);
			$("#"+parentId).find("#input-language").val(value);
		}

		function setLanguageCertLevel(parentId, value) {
			$("#"+parentId).find("#span-level").html(value);
			$("#"+parentId).find("#input-level").val(value);
		}
	</script>
</body>
</html>
