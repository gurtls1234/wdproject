<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <title>이력서 | 원티드</title>
    
   	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="/resources/css/wanted-font.css"/>
    
    <style>
        body {
             font-family: -apple-system, Helvetica, Arial, "hiragino kaku gothic pro", meiryo, "Microsoft YaHei", "ms pgothic", "Apple SD Gothic Neo", "Nanum Gothic", "Malgun Gothic", sans-serif;
        }

        .container {
            padding: 0;
        }
        .row {
            margin: 0;
        }
        
        .dropdown-toggle.after-display-none::after {
        	display:none;
        }

    </style>
</head>
<body style="background-color: #f3f3f3;">
    <jsp:include page="../topbar.jsp"></jsp:include>
    <div class="container" style="margin-left:auto;margin-right: auto; padding-top: 80px;">
        <div class="row" style="margin:25px 0px 0px 8px;">
            <div>
                <p style="padding: 15px 0;margin: 0;"><span style="font-size: 16px;font-weight: 600;">최근문서</span></p>
            </div>
        </div>
        <div class="row" style="border-radius:5px;margin:5px 8px 0px 8px;background:url(https://static.wanted.co.kr/images/resume/resume_banner_pc.png) no-repeat 85% 0;background-color: black;">
            <span style="color:white; padding: 16px 0 16px 40px;width: 100%;">직무 전문가와의 1:1 이력서 코칭을 통해, 완성된 이력서를 만들어보세요.</span>
        </div>
        <div class="row" style="margin-top:24px">
            <div class ="col-3"style="padding: 10px 10px 10px 10px; height: 190px;">
                <button type="button" onclick="location.href='/cv/new'" style="border: 1px solid #DBDBDB;width: 100%; height: 100%;background-color: white;">
                    <div>
                        <div style="background-color: rgb(87, 122, 236);width: 74px;height: 74px;margin: 0 auto;border-radius: 50%;">
                            <i class="icon-new_resume" style="line-height: 74px;font-size: 26px;color: rgb(255, 255, 255)" ></i>
                        </div>
                        <p style="margin-top: 20px;margin-bottom:0px; font-size: 16px;font-weight: 600;text-align: center;">새 이력서 작성</p>
                    </div>
                </button>
            </div>
            
            <c:forEach items="${cvlist}" var="cv">
            <div class ="col-3"style="padding: 10px; height: 190px ;" id="div-cv-${cv.sn}">
                <div style="border: 1px solid #DBDBDB;height: 100%;background-color: white;"> 
                    <div style="height: 80%;padding: 20px;">
                        <%-- <a href="/cv/${cv.sn }"><span style="font-size: 18px; font-weight: 600;">${cv.content.title}</span></a><br> --%>
                         <a href="/cv/${cv.sn }"><input id="input-title" type="text" disabled style="background-color: rgb(255, 255, 255); color:gray; border: none;width:100%; font-size: 18px; font-weight: 600;" onk value="${cv.title }"></a>
                        <p style="margin-top: 5px;font-size: 16px;color:#999999;font-weight: 500;">${cv.createdAtFormatted}</p>
                    </div>
                    <div style="display: flex;height:20%; border-top:1px solid #DBDBDB; padding-top: 3px 0;">
                        <div style="width: 20px;height: 20px;font-size: 12px; color:gray; margin: auto 15px;text-align:center;border: 1px solid ;border-color: gray;">
                            한
                        </div>
                        <div style="flex:80%;padding: 5px 0;font-size: 16px;font-weight: 600;">
                            <span>작성 완료</span>
                        </div>
                        <div style="flex:20%; padding: 5px 0;">
                            <button class="dropdown" style="border: none; background-color: white;outline: none;">
                            	<i class="dropdown-toggle after-display-none fas fa-ellipsis-v" id="menu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: gray;"></i>
                            	<div class="dropdown-menu" aria-labelledby="menu">
				                    <!-- <a class="dropdown-item" href='javascript:void(0);' onclick="modifytitle();">수정하기</a> -->
				                    <a class="dropdown-item" href="javascript:void(0);" onclick="modifyTitle(${cv.sn},'div-cv-${cv.sn}')">수정하기</a>
				                    <a class="dropdown-item" href="javascript:showDeleteCvModal(${cv.sn},'${cv.title}')" >삭제하기</a>
				                </div>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
        
        <div class="modal fade" id="deleteCvModal" tabindex="-1" role="dialog" aria-labelledby=#deleteCvModalLabel aria-hidden="true">
		  <div class="modal-dialog wdsize" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">삭제 확인</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<div>
		      		<span>선택한 '</span>
		      		<span id="span-cv-title"></span>
		      		<span>' 를 정말 삭제하시겠습니까?</span>
		      	</div>
		      	<input id="input-cv-sn" type="hidden" name="sn"/>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" onclick="deleteCv()">삭제</button>
		      </div>
		    </div>
		  </div>
		</div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="/resources/js/jquery-serialize-object.js"></script>
    <script src="/resources/js/sign-check.js"></script>
    
    <%-- var cvList = [
    <c:forEach items="${cvlist}" var="cv">
    	{"sn":${cv.sn}."title":"${cv.title}"},
    </c:forEach>
    ]; --%>
    
    <script>
    function showDeleteCvModal(cvSn, cvTitle) {
        var modal = $('#deleteCvModal');

		modal.find("#span-cv-title").html(cvTitle); //setHtml

		modal.find("#input-cv-sn").val(cvSn); //setValue
        
        modal.modal('show');
    }

    function deleteCv() {
    	var cvSn = $('#deleteCvModal').find("#input-cv-sn").val();
    	$.ajax({
        	url:"/cv/"+cvSn,
        	type:"DELETE",
        	success:function(data){
        		location.reload();
            },
            error:function(err){
				alert(err.responseJSON);
			}
        });
    }

    function modifyTitle(cvSn, divId){
		var inputTitle = $("#"+divId).find("#input-title");
        
		inputTitle.prop("disabled",false);
		
		inputTitle.keydown(function(key){
            var title = inputTitle.val();
            
        	if (key.which == 13) {
            	$.ajax({
                	url: "/cv/"+cvSn+"/title",
                	type: "PUT",
                	data: JSON.stringify({"title": title}),
					contentType: "application/json;charSet=UTF-8",
                	success:function(data){
                		inputTitle.prop("disabled",true);
					},
					error:function(err){
						alert(err.responseJSON);
					}
               	})
            }
        });
	}
    </script>
</body>
</html>