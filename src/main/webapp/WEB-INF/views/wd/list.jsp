<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.gurtls.wdproject.common.Const" %>
<!doctype html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link rel="stylesheet" href="/resources/css/wanted-font.css"/>
	
    <title>탐색 | 원티드</title>

    <style>
        body {
            font-family: -apple-system, Helvetica, Arial, "hiragino kaku gothic pro", meiryo, "Microsoft YaHei", "ms pgothic", "Apple SD Gothic Neo", "Nanum Gothic", "Malgun Gothic", sans-serif;
        }
        
        .col-3 a:hover {
        	text-decoration:none;
        }//hover는 마우스 올렸을때
        
        .dropdown-menu, show {
        	top:140px;
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
  <body data-spy="scroll" data-target="#div-scrollspy" data-offset="0">
	<jsp:include page="../topbar.jsp"></jsp:include>
	
	<div id="div-scrollspy" style="height: 0;">
		<li id="li-bottom-scrollspy" class="nav-item" style="visibility: hidden;">
			<a class="nav-link" href="#container-footer-spinner-div"></a>
		</li>
	</div>
	    
    <div class="container" style="padding-top: 80px;">
        <div class="row" style="height: 30px;"></div>
        <div class="row" style="padding: 0 15px;">
            <div class="dropdown">
                <button class="btn btn-outline-primary dropdown-toggle" type="button" id="wdSortMenuBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <!-- <c:choose>
                        <c:when test="${sort == 'latest'}">최신순</c:when>
                        <c:when test="${}">인기순</c:when>
                        <c:otherwise>최신순</c:otherwise>
                    </c:choose> -->
                	${selectedSort.nameKo}
                </button>
                <div class="dropdown-menu" aria-labelledby="wdSortMenuBtn">
                <c:forEach items="${sortList}" var="sortItem">
                    <a class="dropdown-item" href="${requestScope['javax.servlet.forward.request_uri']}?sort=${sortItem}&year=${year}&location=${location}">${sortItem.nameKo}</a>
                </c:forEach>
                </div>
            </div>&nbsp;&nbsp;
            <div class="dropdown">
                <button class="btn btn-outline-primary dropdown-toggle" type="button" id="wdSortMenuBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${selectedLocation.nameKo}
                </button>
                <div class="dropdown-menu" aria-labelledby="wdSortMenuBtn">
                <c:forEach items="${locationList}" var="lcItem">
                    <a class="dropdown-item" href="${requestScope['javax.servlet.forward.request_uri']}?sort=${sort}&year=${year}&location=${lcItem.nameEn}">${lcItem.nameKo}</a>
                </c:forEach>
                </div>
            </div>&nbsp;&nbsp;
            <div class="dropdown">
                <button class="btn btn-outline-primary dropdown-toggle" type="button" id="wdSortMenuBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
 					경력 ${selectedYear.nameKo}
                </button>
                <div class="dropdown-menu" aria-labelledby="wdSortMenuBtn">
                <c:forEach items="${yearList}" var="yearItem">
                    <a class="dropdown-item" href="${requestScope['javax.servlet.forward.request_uri']}?sort=${sort}&year=${yearItem.year}&location=${location}">${yearItem.nameKo}</a>
                </c:forEach>
                </div>
            </div>
        </div>
	    
        <div class="row" id="div-wd-list">
        	<c:forEach items="${wdList}" var="wd">
	            <div class="col-3" style="line-height: 0.8;">
	            	<a href="/wd/${wd.sn}">
		                <div style="margin-top: 40px; margin-bottom:10px; background-image: url('${wd.company.firstImagePath != null ? wd.company.firstImagePath : "https://static.wanted.co.kr/images/company/1922/6390_2_0.__400_400.jpg"}'); width:100%; padding-top: 75%; background-position: center; border-radius: 4px; box-shadow: inset 0 0 0 1px rgba(0,0,0,.1); background-size: cover;"></div>
		                <div style="padding: 14px 10px 14px 10px;">
			                <div style="margin-bottom: 10px;"><span style="font-size: 18px; font-weight: 600; color: #333; margin-top: 5px; margin-bottom: 5px; text-overflow:ellipsis;line-height:1.2em; word-break: break-word;">${wd.title}</span></div>
			                <div style="margin-bottom: 10px;"><span style="font-size: 14px; font-weight: 400; color: #999;">${wd.company.name }</span></div>
			                <div style="margin-bottom: 10px;"><span style="font-size: 14px; font-weight: 400; color: #999;">${wd.location.nameKo }</span></div>
			                <div><span style="font-size: 13px; font-weight: 400; color: #666;">채용보상금 1,000,000원</span></div>
	            		</div>
	            	</a>
	            </div>
	        </c:forEach>
        </div>
        
        <div class="row" id="container-footer-spinner-div" style="height:100px">
        </div>
        
    </div>

    <jsp:include page="../user/signUpAndsignInModal.jsp"></jsp:include>
    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.2/handlebars.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="/resources/js/jquery-serialize-object.js"></script>
    <script src="/resources/js/sign-check.js"></script>
    
    <script id="handlebar-template-wd" type="text/x-handlebars-template">
		{{#wdList}}
		<div class="col-3" style="line-height: 0.8;">
	    	<a href="/wd/{{sn}}">
		    	<div style="margin-top: 40px; margin-bottom:10px; background-image: url('https://static.wanted.co.kr/images/company/1922/6390_2_0.__400_400.jpg'); width:100%; padding-top: 75%; background-position: center; border-radius: 4px; box-shadow: inset 0 0 0 1px rgba(0,0,0,.1); background-size: cover;"></div>
		        <div style="padding: 14px 10px 14px 10px;">
			        <div style="margin-bottom: 10px;"><span style="font-size: 18px; font-weight: 600; color: #333; margin-top: 5px; margin-bottom: 5px;">{{title}}</span></div>
			        <div style="margin-bottom: 10px;"><span style="font-size: 14px; font-weight: 400; color: #999;">{{wd.company.name}}</span></div>
			        <div style="margin-bottom: 10px;"><span style="font-size: 14px; font-weight: 400; color: #999;">{{location.nameKo}}</span></div>
			        <div><span style="font-size: 13px; font-weight: 400; color: #666;">채용보상금 1,000,000원</span></div>
	            </div>
	        </a>
	    </div>
		{{/wdList}}
	</script>
    
    <script>
		var wdSize = <%= Const.WD_LIST_DEFAULT_SIZE %>;
		var isEnd = false;
		var isLoading = false;
		
	    $(window).on("activate.bs.scrollspy", function () {
		    if(isEnd || isLoading)
			    return;
	    	isLoading = true;
		    
			var source = $("#handlebar-template-wd").html(); 
			var template = Handlebars.compile(source);

			$.ajax({
				url:"/wd/list",
				type:"GET",
				data:{
					"sort": "${sort}",
					"year": ${year},
					"location": "${location}",
					"limit_start": wdSize
				},
				headers: {
					"Accept": "application/json"
				},
				success:function(wdList){
					wdSize += wdList.length;
					$("#div-wd-list").append( template({"wdList":wdList}) );
					isEnd = (wdList.length === 0);
					isLoading = false;
				},
				error:function(err){
					alert(err.responseJSON);
					isLoading = false;
				}
			});
	    });
	     
    </script>
 
  </body>
</html>