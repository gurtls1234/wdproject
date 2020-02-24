    
	$(function(){
		var email = $("#emailInput");
		var passwd = $("#passwdInput");
		const form = $("#signInForm");
        const data = form.serializeObject();
        
		email.keydown(function(key){
			if(key.which == 13){
				
				if(email.val().length == 0 && passwd.val().length == 0){
					alert("이메일과 비밀번호를 입력해주세요");
				}
				
				if(email.val().length == 0 && passwd.val().length != 0){
					 alert("이메일을 입력해주세요");
				}
				
				if(passwd.val().length == 0 && email.val().length != 0){
					 alert("비밀번호를 입력해주세요");
				}
				
				$.post(form.attr("action"),form.serialize())
		  		.done(function(data){
			  		location.reload();
			  	})
			  	
			  	.fail(function(error){
				  	alert(error.responseJSON.alertMessage);
				});
			}
		});
		
		passwd.keydown(function(key){
			if(key.which == 13){
				if(email.val().length == 0 && passwd.val().length == 0){
					alert("이메일과 비밀번호를 입력해주세요");
				}
				
				if(email.val().length == 0 && passwd.val().length != 0){
					 alert("이메일을 입력해주세요");
				}
				
				if(passwd.val().length == 0 && email.val().length != 0){
					 alert("비밀번호를 입력해주세요");
				}
				
				$.post(form.attr("action"),form.serialize())
		  		.done(function(data){
			  		location.reload();
			  	})
			  	
			  	.fail(function(error){
				  	alert(error.responseJSON.alertMessage);
				});
			}
		});
	});
	
	function submitSignInForm(){
        const form = $("#signInForm");
        const data = form.serializeObject();

        if (data.email.length == 0) {
            alert("이메일을 입력해주세요");
            return;
        }

        if (data.passwd.length == 0) {
            alert("비밀번호를 입력해주세요");
            return;
	  	}

	  	$.post(form.attr("action"),form.serialize())
	  		.done(function(data){
		  		location.reload();
		  	})
		  	
		  	.fail(function(error){
			  	alert(error.responseJSON.alertMessage);
			});
	}

  	function submitSignUpFrom(){
 		const form = $("#signUpForm");
  	  	const data = form.serializeObject();

  	  	if (data.name.length == 0) {
  	  	  	alert("이름을 입력해주세요");
  	  	  	return;
	  	  }
	  	  
	  	if (data.email.length == 0) {
		  	alert("이메일을 입력해주세요");
	  	  	return;
	  	  }
	  	
	  	if (data.phone.length == 0) {
		  	alert("전화번호를 입력해주세요");
	  	  	return;
	  	  }

	  	if (data.passwd.length == 0) {
	  	  	alert("비밀번호를 입력해주세요");
	  	  	return;
	  	  }

	  	if (data.repasswd.length == 0) {
	  	  	alert("비밀번호 확인란을 입력해주세요");
	  	  	return;
	  	  }

	  	  if(data.passwd != data.repasswd){
	  		alert("비밀번호가 일치하지 않습니다. 다시 입력 해주세요");
	  		$("#repasswd").focus();
	  		return;
 	  	}

		$.ajax({
			url:"/user/signup",
			type:"POST",
			data:$("#signUpForm").serializeObject(),
			success:function(data){
				alert("가입에 성공하셨습니다.");
				$("#signUpModal").modal('hide');
				$("#signInModal").modal('show');
			},
			error:function(err){
				alert(err.responseJSON);
			}
		});
		
	}