<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> --%>
<%@ page import="com.gurtls.wdproject.common.Const" %>
<!doctype html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>지원현황 | 원티드</title>

    <link rel="shortcut icon" href="//static.wanted.co.kr/favicon/favicon.ico" class="next-head"/>
    <link rel="icon" type="image/png" sizes="16x16" href="//static.wanted.co.kr/favicon/16x16.png" class="next-head"/>
    <link rel="icon" type="image/png" sizes="32x32" href="//static.wanted.co.kr/favicon/32x32.png" class="next-head"/>
    <link rel="icon" type="image/png" sizes="96x96" href="//static.wanted.co.kr/favicon/96x96.png" class="next-head"/>
    <link rel="icon" type="image/png" sizes="192x192" href="//static.wanted.co.kr/favicon/192x192.png" class="next-head"/>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

    <link rel="stylesheet" href="/resources/css/wanted-font.css"/>

    <style>
        body {
            font-family: -apple-system, Helvetica, Arial, "hiragino kaku gothic pro", meiryo, "Microsoft YaHei", "ms pgothic", "Apple SD Gothic Neo", "Nanum Gothic", "Malgun Gothic", sans-serif;
        }

        .application-summary-div-active {
            color:rgb(23, 111, 216);
        }

        .application-summary-div {
            color:rgb(134, 147, 158);
        }

        #summary > div:not(:last-child) {
            border-right-width: 1px; 
            border-right-style: solid; 
            border-color: rgba(134, 147, 158, 0.5);
        }

        #summary > div > span:first-child {
            font-size: 30px;
            font-weight: 300;
        }

        #summary > div > span:last-child {
            padding-top: 10px;
            font-size: 12px;
            font-weight: 400;
        }

        div.container > div.application-div {
            height: 83px;
            background-color: white;
            border-color:rgba(209, 209, 209, 0.4);
            border-bottom-style:solid;
            border-bottom-width:1px;
        }

        div.application-div > img:first-child {
            position: relative;
            width: 55px;
            height: 55px;
            margin-left:10px;
            border-width:1px;
            border-color:rgba(209, 209, 209, 0.4);
            border-style:solid;
            top:50%;
            transform: translate(0%, -50%);
        }

        div.application-div > div:nth-child(2) {
            height: fit-content;
            margin-left: 10px;
            line-height: 1;
            position: relative;
            top:50%;
            transform: translate(0%, -50%);
        }

        div.application-div > div:nth-child(2) > span:first-child {
            color: rgb(59, 61, 64); 
            font-size: 16px; 
            font-weight: 600;
            line-height: 25px;
        } 

        div.application-div > div:nth-child(2) > span:not(:first-child) {
            color: rgb(21, 21, 21); 
            font-size: 12px; 
            font-weight: 400;
            line-height: 17px;
        } 
    </style>
  </head>
  <body style="background-color: #f8f9fa;" data-target="#div-scrollspy" data-offset="0">
  	<jsp:include page="./topbar.jsp"></jsp:include>
  	
  	<div id="div-scrollspy" style="height: 0;">
		<li id="li-bottom-scrollspy" class="nav-item" style="visibility: hidden;">
			<a class="nav-link" href="#container-footer-spinner-div"></a>
		</li>
	</div>
    
    <div class="container" style="padding-top: 80px;">
        <div class="row" style="height: 60px;">
            <span style="height: fit-content;font-size: 16px;font-weight: 600;position: relative;top:50%;transform: translate(0%, -50%);">지원한 포지션</span>
        </div>
        <div id="summary" class="row" style="height: 70px;text-align: center;">
            <div class="col application-summary-div-active" id="all">
            	<%-- <span>${fn:length(applicationList)}</span><br/> --%>
                <span id="count">${applicationListTotalCount}</span><br/>
                <span>전체</span>
            </div>
            <c:forEach items="${applicationStatusCountList}" var="statusCount">
            	<div class="col application-summary-div" id="${statusCount.status.nameEn}">
	                <span id="count">${statusCount.count}</span><br/>
	                <span>${statusCount.status.nameKo}</span>
	            </div>
            </c:forEach>
        </div>
        
        <div class="row" style="height: 60px">
            <span id="span-total-count" style="height:27px;color:rgb(59, 61, 64);font-size: 16px;font-weight: 400;position: relative;top:50%;transform: translate(0%, -50%);">총 ${applicationListTotalCount}건</span>
        </div>
        
        <c:forEach items="${applicationList}" var="application">
        <div class="row application-div" style="border-top-style:solid;border-top-width:1px;">
            <img src="${application.wd.company.iconPath}" />
            <div>
                <span>${application.status.nameKo}</span><br/>
                <span>${application.wd.company.name}</span><br/>
                <span>${application.wd.title}</span>
            </div>
        </div>
        </c:forEach>
        
        <!-- <div class="row application-div">
            <img src="https://static.wanted.co.kr/images/wdes/0_5_5fec8f87-0258-4e8d-bfb6-9e5587368fe7.jpg" />
            <div>
                <span>채용 종료</span><br/>
                <span>터치웍스(touchworks)</span><br/>
                <span>iOS 개발자</span>
            </div>
        </div>
        <div class="row application-div">
            <img src="https://static.wanted.co.kr/images/wdes/0_5_586049c4-5aa5-46ce-b1b3-5dfd99ecaf8a.jpg" />
            <div>
                <span>채용 종료</span><br/>
                <span>레진엔터테인먼트</span><br/>
                <span>서비스 개발팀/백엔드개발자</span>
            </div>
        </div> -->
        <div id="container-footer-spinner-div">
            <i class="fas fa-spinner fa-pulse" style="position: relative;top:50%;left:50%;transform: translate(-50%, -50%);"></i>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.2/handlebars.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="/resources/js/jquery-serialize-object.js"></script>
    <script src="/resources/js/sign-check.js"></script>
    <!-- script 순서가 중요함 -->
    
    <script id="handlebar-template-application" type="text/x-handlebars-template">
	{{#applicationList}}
		<div class="row application-div" style="border-top-style:solid;border-top-width:1px;">
            <img src="{{wd.company.iconPath}}" />
            <div>
                <span>{{status.name_ko}}</span><br/>
                <span>{{wd.company.name}}</span><br/>
                <span>{{wd.title}}</span>
            </div>
        </div>
	{{/applicationList}}
	</script>
    
    <script>
    	$(document).ready(function(){
			if(${applicationListTotalCount} < <%= Const.APPLICATION_LIST_DEFAULT_SIZE %>) {
				$("#container-footer-spinner-div").css("visibility", "hidden");
			}
        	
        	var summaryIds = ['all'];
    		<c:forEach items="${applicationStatusCountList}" var="statusCount">
    			summaryIds.push('${statusCount.status.nameEn}');
    		</c:forEach>

    		var summaryDivClass = "application-summary-div";
    		var summaryDivActiveClass = "application-summary-div-active";

    		summaryIds.forEach(function(id){
    			$("#summary").find("#"+id).click(function(){ //.click(function(){}) .on("click",function(){})
        			var activeDiv = $(this);

        			if(activeDiv.hasClass(summaryDivActiveClass)) {
            			return;
            		}

        			// 모든 div를 먼저 일반 class 부여
        			$("#summary").children().each(function(){
            			var div = $(this);
        				if(div.hasClass(summaryDivActiveClass))
        					div.removeClass(summaryDivActiveClass);
        				if(!div.hasClass(summaryDivClass))
            				div.addClass(summaryDivClass);
        			});

        			// active class
        			activeDiv.removeClass(summaryDivClass);
        			activeDiv.addClass(summaryDivActiveClass);

        			changeStatus($(this).attr("id"));
        		});
        	});
    		
        });

    	const pagingSize = <%= Const.APPLICATION_LIST_DEFAULT_SIZE %>;
    	var applicationSize = <%= Const.APPLICATION_LIST_DEFAULT_SIZE %>;
		var isEnd = false;
		var isLoading = false;
		var status = null;

		function changeStatus(id) {
			$(".application-div").remove();

			$("#container-footer-spinner-div").css("visibility", "visible");

			status = (id === "all") ? null : id;
			applicationSize = 0;
			
	    	if(isLoading)
			    return;
	    	isLoading = true;

			var source = $("#handlebar-template-application").html(); 
			var template = Handlebars.compile(source);

			var data = {"limit_start": applicationSize};
			if(status != null && status !== "null")
				data["status"] = status;

			$.ajax({
				url:"/applications",
				type:"GET",
				data:data,
				headers: {
					"Accept": "application/json"
				},
				success:function(applicationList){
					applicationSize += applicationList.length;
					$("#container-footer-spinner-div").before( template({"applicationList":applicationList}) );
					isEnd = (applicationList.length < pagingSize);
					if(isEnd)
						$("#container-footer-spinner-div").css("visibility", "hidden");
					isLoading = false;
				},
				error:function(err){
					alert(err.responseJSON);
					isLoading = false;
				}
			});

			$.ajax({
				url:"/applications/statuses/counts",
				type:"GET",
				data:data,
				headers: {
					"Accept": "application/json"
				},
				success:function(statusCountMap){
					var isUpdated = false;
					var totalCount = 0;

					for(var sts in statusCountMap) {
						var count = statusCountMap[sts];
						totalCount += count;
						$("#summary").find("#"+sts).find("#count").html(count);

						if(status === sts) {
							$("#span-total-count").html("총 "+count+"건");
							isUpdated = true;
						}
					}

					$("#summary").find("#all").find("#count").html(totalCount);
					if(!isUpdated)
						$("#span-total-count").html("총 "+totalCount+"건");
				},
				error:function(err){
					alert(err.responseJSON);
				}
			});
		}
		
	    $(window).on("activate.bs.scrollspy", function () {
	    	if(isEnd || isLoading)
			    return;
	    	isLoading = true;
		    
			var source = $("#handlebar-template-application").html(); 
			var template = Handlebars.compile(source);
			
			var data = {"limit_start": applicationSize};
			if(status != null && status !== "null")
				data["status"] = status;

			$.ajax({
				url:"/applications",
				type:"GET",
				data:data,
				headers: {
					"Accept": "application/json"
				},
				success:function(applicationList){
					applicationSize += applicationList.length;
					$("#container-footer-spinner-div").before( template({"applicationList":applicationList}) );
					isEnd = (applicationList.length < pagingSize);
					if(isEnd)
						$("#container-footer-spinner-div").css("visibility", "hidden");
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