var status = true;
$(function() {
    //modify.jsp페이지의 [정보수정]버튼을 클릭하면 자동실행
	//입력한 비밀번호를 갖고 memberCheck.jsp페이지 실행
	$("#modify").click(function(){//[회원정보수정]버튼 클릭
  		var query = {passwd:$("#passwd").val()};
		$.ajax({
			type: "post",
			url: "memberCheck.do",
			data: query,
			success: function(data){
                if(data == 1)//비밀번호가 맞음
                    $("#main_auth").load("login/modifyForm.jsp");	
                else {//비밀번호 틀림
                    alert("비밀번호가 맞지 않습니다.");
                    $("#passwd").focus();
                }   
		   }
		});
	});
	
	//modifyForm.jsp페이지의 [수정]버튼 클릭시 자동실행
	$("#modifyProcess").click(function(){
        var query = {
                "email":$("#email").val(), 
                "passwd":$("#passwd").val(),
                "empName":$("#name").val(),
                "address":$("#address").val(),
                "tel":$("#tel").val(),
                "empNo":$("#empNo").val(),
                "title":{"titleNo":$("#title").val()},
                "dept":{"deptNo":$("#dept").val()},
                "manager":{"empNo":$("#manager").val()},
                "salary":$("#salary").val()
        };
		
		$.ajax({
			type: "post",
			url: "modifyMember.do",
			data:JSON.stringify(query),
            dataType:"json",
			success: function(data){
				if(data == 1) {//정보수정 성공
				    alert("회원정보가 수정되었습니다.");
				    window.location.reload();
				}
		   }
		});
	});
	
	$("#cancel").click(function(){
	    window.location.reload();
	});
	
	//modify.jsp페이지의 [탈퇴]버튼을 클릭하면 자동실행
	//입력한 비밀번호를 갖고 memberCheck.jsp실핼 후 
	//비밀번호가 맞으면 deletePro.jsp페이지를 실행
	$("#delete").click(function(){//[회원탈퇴]버튼 클릭
		var query = {passwd:$("#passwd").val()};
		
		//입력한 비밀번호를 갖고 memberCheck.jsp페이지 실행 
		$.ajax({
			type: "post",
			url: "memberCheck.jsp",
			data: query,
			success: function(data){
				if(data == 1){//비밀번호 맞음
					//회원탈퇴 페이지 deletePro.jsp 실행
					$.ajax({
						   type: "POST",
						   url: "deletePro.jsp",
						   data: query,
						   success: function(data){
							   if(data == 1){//탈퇴 성공
								  alert("회원 탈퇴가 되었습니다.");
								  $("#main_auth").load("loginForm.jsp");
						       }   
						   }
				    });
				}else {//비밀번호 틀림
		    	  	 alert("비밀번호가 맞지 않습니다.");
		    	  	 $("#passwd").val("");
		    	  	 $("#passwd").focus();
		    	}   
		   }
		});
	});	
	
 });