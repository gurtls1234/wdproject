<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>[${wd.company.name }] ${wd.title} | 원티드</title>

    <link rel="shortcut icon" href="//static.wanted.co.kr/favicon/favicon.ico" class="next-head"/>
    <link rel="icon" type="image/png" sizes="16x16" href="//static.wanted.co.kr/favicon/16x16.png" class="next-head"/>
    <link rel="icon" type="image/png" sizes="32x32" href="//static.wanted.co.kr/favicon/32x32.png" class="next-head"/>
    <link rel="icon" type="image/png" sizes="96x96" href="//static.wanted.co.kr/favicon/96x96.png" class="next-head"/>
    <link rel="icon" type="image/png" sizes="192x192" href="//static.wanted.co.kr/favicon/192x192.png" class="next-head"/>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css"/>
    <link rel="stylesheet" href="/resources/css/wanted-font.css"/>
	
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86b7174052e7cd29e1392325a62cac5d"></script>

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

        .container > .row {
            margin: 0;
        }

        .compensation {
            width:100%;
            height:190px;
            border: 1px solid #e1e2e3; 
            border-radius: 3px; 
            background-color: #fff; 
            padding: 20px;
        }

        .compensation > ul > li {
            float: left;
            width: 50%;
            letter-spacing: normal;
            text-align: left;
            list-style: none;
        }
        .compensation > ul > li > h4 {
            font-size: 14px;
            font-weight: 600;
            color: #999;
            margin-bottom: 8px;
        }

        .compensation > ul > li > p {
            font-size: 15px;
            color: #333;
            font-weight: 600;
        }

        .likes {
            width: 74px;
            height: 30px;
            border-radius: 15px;
            border: 1px solid #e1e2e3;
            padding: 0 15px;
        }

        .company-tag {
            margin-top: 20px;
        }

        .company-tag > ul {
            list-style: none;
            padding: 0;
        }

        .company-tag > ul > li {
            float: left;
            text-align: left;
            list-style: none;
        }

        .company-tag > ul > li > a {
            display: inline-block;
            margin-right: 6px;
            margin-bottom: 10px;
            padding: 9px 14px;
            font-size: 12px;
            font-weight: 500;
            line-height: 1;
            color: #333;
            background-color: #f3f5f8;
            border-radius: 25px;
        }
        
        .sub-title {
            color:rgb(51, 51, 51);
            font-size: 16px;
            font-weight: 600;
        }

        .hh {
            display: inline-block;
            width: 80px;
            font-size: 16px;
            font-weight: 600;
            color: #999;
        }

        .bb {
            color: #333;
            font-size: 16px;
            font-weight: 600;
        }
        
        pre {
        	font-family: apple-system, Helvetica, Arial, "hiragino kaku gothic pro", meiryo, "Microsoft YaHei", "ms pgothic", "Apple SD Gothic Neo", "Nanum Gothic", "Malgun Gothic", sans-serif;
    		margin: 0;
    		font-size: 16px;
    		white-space: pre-wrap;
        }
        
        .user-info {
        	 padding-left: 20px;
        	 padding-right: 20px;
        }
        
        .user-info > div {
        	 display: flex;
        	 flex-direction: row;
        	 width: 100%;
        	 height: 52px;
        	 border-bottom: 1px solid #e1e2e3;
        	 margin-bottom: 5px;
        }
        
        .user-info > div > h4 {
        	 line-height: 50px;
        	 font-size: 16px;
        	 font-weight: 600;
        	 width: 80px;
        	 color: #333;
        } 
        
        .user-info > div > input {
        	 flex: 1;
        	 height: 50px;
        	 padding: 0;
        	 border: none;
        	 line-height: 50px;
        	 font-size: 16px;
        	 font-weight: 600;
        }
        
        .cvList-cvCreatedAt {
        	margin-right: 20px;
        	font-size: 11px;
        	font-weight: 500;
        	line-height: 15px;
        	letter-spacing: normal;
        	text-align: left;
        	color: #999;
        }
        
        .cvList-cvState {
        	 font-size: 11px;
        	 font-weight: 500;
        	 line-height: 15px;
        	 letter-spacing: normal;
        	 text-align: left;
        	 color: #999;
        }
        
        .cvList-cvTitle {
        	font-size: 14px;
        	font-weight: 600;
        	line-height: 18px;
        	letter-spacing: normal;
        	text-align: left;
        	margin: 0 0 5px;
        	overflow: hidden;
        	text-overflow: ellipsis;
        	white-space: nowrap;
        	width: 100%;
        }
        
        .cvList-cvLi {
        	width: 100%;
        	height: 50px;
        	border: 1px solid #f4f5f7;
        	background: #f4f5f7;
        	border-radius: 2px;
        	margin-bottom: 10px;
        	list-style: none;
        }
        
        .cvList-cvLi > label > i {
        	width: 20px;
        	height: 20px;
        	margin: 15px;
        	background: #fff;
        	border: 1px solid;
        	color: #fff;
        	display: block;
        	border-radius: 2px;
        	font-size: 8px;
        	line-height: 18px;
        	text-align: center;
        	border-color: #e1e2e3;
        }
        
        .cvList-newCv-button {
        	width: 100%;
        	height: 50px;
        	text-align: center;
        	border-radius: 2px;
        	border: 1px solid #999;
        	background-color: #fff;
        	font-size: 16px;
        	font-weight: 600;
        	line-height: 50px;
        	letter-spacing: normal;
        	color: #333;
        }
        
        .cvList-submit-button {
        	 width: 100%;
        	 height: 50px;
        	 font-size: 16px;
        	 font-weight: 600;
        	 background: #999;
        	 color: hsla(0,0%,100%,.5);
        	 border-width: 0px;
        	 padding: 0px;
        }
        
        .cvList-back-button {
        	 position: absolute;
        	 top: 50%;
        	 right: 20px;
        	 -webkit-transform: translateY(-50%);
        	 transform: translateY(-50%);
        	 font-size: 16px;
        	 font-weight: 600;
        	 color: #999;
        }

    </style>
  </head>
  <body>
  	<jsp:include page="../topbar.jsp"></jsp:include>
    <div class="container" style="margin-left: 50px; margin-right: 50px; padding-top: 80px; padding-bottom: 70px;">
        <div class="row">
            <div class="col-8">
                <div id="row carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <div id="div-company-image-set" class="carousel-inner">
                    	<c:choose>
                    		<c:when test="${wd.company.imageSet != null && fn:length(wd.company.imageSet) > 0}">
                    			<c:forEach items="${wd.company.imageSet}" var="companyImage">
                    				<div class="carousel-item">
			                            <img src="${companyImage.path}" class="d-block w-100">
			                        </div>
			                    </c:forEach>
                    		</c:when>
                    		<c:otherwise>
                   				<div class="carousel-item active">
		                            <img src="https://static.wanted.co.kr/images/company/2826/j2zprcmrfmreef5c__1080_790.jpg" class="d-block w-100">
		                        </div>
		                        <div class="carousel-item">
		                            <img src="https://static.wanted.co.kr/images/company/2826/rshdhx1ihkr6vymg__1080_790.jpg" class="d-block w-100">
		                        </div>
		                        <div class="carousel-item">
		                            <img src="https://static.wanted.co.kr/images/company/2826/ifb1th7yke00ozd4__1080_790.jpg" class="d-block w-100">
		                        </div>
                    		</c:otherwise>
                    	</c:choose>
                        
                    </div>
                </div>
                <div style="margin-top:40px">
                    <span style="color: #333;font-size: 22px;font-weight: 600;word-break: keep-all;word-wrap: break-word;">${wd.title }</span>
                </div>
                <div style="margin-top: 10px">
                    <a href="#"><span style="font-size:14px;font-weight: 600;color: rgb(51, 51, 51);">${wd.company.name}</span></a>
                    &nbsp;
                    <span style="color: rgb(203, 203, 203)">|</span>
                    &nbsp;
                    <span style="font-size:14px;font-weight: 600;color: rgb(153, 153, 153);">${wd.location.nameKo}</span>
                </div>
                <div class="company-tag" style="height: 90px">
                    <ul>
                        <li><a href="#">#연봉상위10%</a></li>
                        <li><a href="#">#인원급성장</a></li>
                        <li><a href="#">#50명이하</a></li>
                        <li><a href="#">#설립10년미만</a></li>
                        <li><a href="#">#누적투자100억이상</a></li>
                        <li><a href="#">#스타트업</a></li>
                        <li><a href="#">#음료</a></li>
                        <li><a href="#">#간식</a></li>
                        <li><a href="#">#IT, 컨텐츠</a></li>
                    </ul>
                </div>
                <div>
                    <pre>${wd.content}</pre>
                </div>
                <div style="margin-top:20px">
                    <span class="sub-title">주요업무</span><br/>
                    <pre>${wd.mainTask}</pre>
                </div>
                <div style="margin-top:20px">
                    <span class="sub-title">자격요건</span><br/>
                    <pre>${wd.qualification}</pre>
                </div>
                <div style="margin-top:20px">
                    <span class="sub-title">우대사항</span><br/>
                    <pre>${wd.preference}</pre>
                </div>
                <div style="margin-top:20px">
                    <span class="sub-title">혜택 및 복지</span><br/>
                    <pre>${wd.benefit}</pre>
                </div>
                <hr style="margin-top:80px"/>
                <div style="margin-top:20px">
                    <span class="hh">마감일</span>
                    <span class="bb">${wd.endDt}</span>
                </div>
                <div style="margin-top:24px">
                    <span class="hh">근무지역</span>
                    <span class="bb">${wd.workLocation}</span>
                </div>
                <div id="map" style="width:100%;height:350px;margin-top:20px"></div>
                <div style="margin-top:80px;border-radius: 3px;border: 1px solid #e1e2e3;padding: 20px;display: flex;">
                        <div class="logo" style="width:50px; height: 50px; background-position: center; background-size: cover; background-image: url('${wd.company.iconPath}');"></div>
                        <div style="margin-left:15px">
                            <span style="color: rgb(51, 51, 51); font-size: 15px; font-weight: 600;">${wd.company.name}</span><br/>
                            <span style="color:rgb(153, 153, 153); font-size: 15px; font-weight: 600;">IT, 컨텐츠</span>
                        </div>
                </div>
            </div>
          	<div class="col-4">
                <div id="application-button-before" style="width:340px; height:250px; position:absolute; visibility:visible;">
                    <div class="compensation" style="width:100%;height:190px;border: 1px solid #e1e2e3; border-radius: 3px; background-color: #fff; padding: 20px;">
                        <span style="font-size: 15px;font-weight: 600;letter-spacing: normal;text-align: left;color: #333;">채용보상금</span>
                        <ul style="margin-top:20px;padding: 0;height: 45px;">
                            <li><h4>추천인</h4><p>500,000원</p></li>
                            <li><h4>지원자</h4><p>500,000원</p></li>
                        </ul>
                        <hr/>
                        <button class="likes" type="button" style="background:none;"><i class="fas fa-heart" style="color: rgb(219, 219, 219); margin-right: 10px;"></i><span style="font-size: 14px;font-weight: 600;color:rgb(51, 51, 51);">58</span></button>
                    </div>
                    <div style="height: 10px;"></div>
                    <button id="application-button" type="button" class="btn btn-success" style="width:100%;font-size:16px;font-weight: 600;">지원하기</button>
                </div>
                <c:if test="${user != null}">
                <div id="application-button-after" style="width:340px;height:auto;position:relative;visibility: hidden;">
                    <div style="width:100%;height:auto;border: 1px solid #e1e2e3; border-radius: 3px; background-color: #fff;">
                        <div style="position:relative;width:100%;height:53px;border-bottom: 1px solid #e1e2e3;padding: 15px 20px;">
                            <h2 style="text-align: center;font-size: 16px;font-weight: 600;color: #333;line-height: 22px;">지원하기</h2>
                            <a class="cvList-back-button" href="javascript:backHidden();">뒤로</a>
                        </div>
                        <h3 style="border-left: 2px solid #258bf7;font-size: 16px;font-weight: 600;margin-top:25px;padding-left: 20px;line-height: 22px;">지원 정보</h3>
                        <div class="user-info">
                            <div>
                                <h4>이름</h4>
                                <input type="text" name="" value="${user.name }"/>
                            </div>
                            <div>
                                <h4>이메일</h4>
                                <input type="text" name="" value="${user.email }"/>
                            </div>
                            <div>
                                <h4>연락처</h4>
                                <input type="text" name="" value="${user.phone }"/>
                            </div>
                        </div>
                        <h3 style="border-left: 2px solid #258bf7;font-size: 16px;font-weight: 600;margin-top:25px;padding-left: 20px;line-height: 22px;">이력서</h3>
                        <ul style="margin:20px;padding-left: 0px;">
                            <c:forEach items="${cvList}" var="cv">
	                            <li class="cvList-cvLi">
	                                <label style="width: 50px;height: 50px;margin: 0;display: inline-block;vertical-align: middle;">
	                                    <input type="checkbox" style="display:none"/>
	                                    <i class="fas fa-check" value="${cv.sn}"></i>
	                                </label>
	                                <div style="width: calc(100% - 88px);color: #999;display: inline-block;vertical-align: middle;">
	                                    <h4 class="cvList-cvTitle">${cv.title }</h4>
	                                    <div style="margin-top: -9px;">
	                                        <span class="cvList-createdAt">${cv.createdAtFormatted }</span>
	                                        <span class="cvList-cvState">작성 중</span>
	                                    </div>
	                                </div>
	                            </li>
                            </c:forEach>
                            <button class="cvList-newCv-button" onclick="location.href='/cv/new'">새 이력서 작성</button>
                            <p style="text-align: left;color: #999;font-size: 14px;font-weight: 400;line-height: 1.29;letter-spacing: normal;margin-top: 10px;">원티드 이력서로 지원하면 최종 합격률이 40% 높아집니다.</p>
                        </ul>
                        <button class="cvList-submit-button" onclick="submitCv();">제출하기</button>
                    </div>
                </div>
                </c:if>
            </div>
        </div>
    </div>
    
    <jsp:include page="../user/signUpAndsignInModal.jsp"></jsp:include>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="/resources/js/jquery-serialize-object.js"></script>
    <script src="/resources/js/sign-check.js"></script>
    <script>
			var isSignIn = ${user == null ? "false" : "true"};

    		$(function(){
        		$("#application-button").click(function(){
            		if(isSignIn) {
	        			$("#application-button-before").css('visibility', 'hidden');
	        			$("#application-button-after").css('visibility', 'visible');
            		} else {
            			$('#signInModal').modal('show');
                	}
            	});

            	$(".cvList-cvLi label i").click(onCheckCv);

        		$("#div-company-image-set .carousel-item:first-child").addClass("active");
        	});

        	function backHidden(){
        		$("#application-button-after").css('visibility', 'hidden');
        		$("#application-button-before").css('visibility', 'visible');
            }

            var checkedIComponent = null;

            function onCheckCv() {
            	var iComponent = $(this);

            	if(checkedIComponent != null) {
                	checkedIComponent.css("background", "#fff");
                	checkedIComponent.css("border-color", "#e1e2e3");

                	if(checkedIComponent[0] === iComponent[0]) {
                    	checkedIComponent = null;
                    	$(".cvList-submit-button").css("background", "#999");
                    	$(".cvList-submit-button").css("color", "hsla(0,0%,100%,.5)");
                    	return;
                    }
                }

            	iComponent.css("background", "#258bf7");
            	iComponent.css("border-color", "#258bf7");
            	checkedIComponent = iComponent;

            	$(".cvList-submit-button").css("background", "#258bf7");
            	$(".cvList-submit-button").css("color", "#fff");
            }
            
            function submitCv(){
				if(checkedIComponent == null) {
					alert("이력서를 선택해주세요.");
					return;
				}

				var cvSn = checkedIComponent.attr("value");
                
                $.ajax({
                    url:"/applications",
                    type:"POST",
                    data: JSON.stringify({"wd_sn":${wd.sn},"cv_sn":cvSn}),
                    contentType: "application/json;charSet=UTF-8",
                    success:function(){
                        location.href = "/applications";
                    },
                    error: function(err){
                        
                    }
                });
            }
    	
            var mapContainer = document.getElementById('map'),
                mapOption = { 
                    center: new kakao.maps.LatLng(37.497301, 127.029667),
                    level: 3
                };
            
            var map = new kakao.maps.Map(mapContainer, mapOption); 
                
            var markerPosition  = new kakao.maps.LatLng(37.497301, 127.029667); 
            
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
                
            marker.setMap(map);
            
    </script>
  </body>
</html>