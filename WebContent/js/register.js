var status = true;

$(function() {
    
	//[ID중복확인]버튼을 클릭하면 자동실행
	//입력한 아이디 값을 갖고 confirmId.jsp페이지 실행
	$("#checkId").click(function(){
	    
	  if($("#email").val()){
		//아이디를 입력하고 [ID중복확인]버튼을 클릭한 경우
		var query = {email:$("#email").val()};
		
	    $.ajax({
	    	type:"post",//요청방식
	    	url:"confirmId.do",//요청페이지
	    	data:query,//파라미터
	    	success:function(data){//요청페이지 처리에 성공시
	    		if(data == 1){//사용할 수 없는 아이디
	    			alert("사용할 수 없는 아이디");
	    	    	$("#email").val("");
	    	     }else if(data == 0)//사용할 수 있는 아이디
	    	  	    alert("사용할 수 있는 아이디");
	 	    }
	    });
	  }else{//아이디를 입력하지 않고 [ID중복확인]버튼을 클릭한 경우
		  alert("사용할 아이디를 입력");
		  $("#email").focus();
	  }
	});
	
	//[가입하기]버튼을 클릭하면 자동실행
	//사용자가 가입폼인 registerForm.jsp페이지에 입력한 내용을 갖고
	//registerPro.jsp페이지 실행
	$("#process").click(function(){
	   checkIt(); //입력폼에 입력한 상황 체크
	   
	   if(status){
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
		      type:"post",
		      url:"registerEmp.do",
		      data:JSON.stringify(query),
		      dataType:"json",
		      success:function(data){
		          if (data == 1) {// 
		              window.location.replace("main.jsp");
                  } else if (data == 0) {
                        alert("가입 실패");
                  }
		 	  }
		  });
	   }
	});
	
	//[취소]버튼을 클릭하면 자동실행
	$("#cancle").click(function(){
		window.location.href("main.jsp");
	});

});

//사용자가 입력폼에 입력한 상황을 체크
function checkIt() {
	status = true;
	
    if(!$("#email").val()) {//아이디를 입력하지 않으면 수행
        alert("aaaa 아이디를 입력하세요");
        $("#email").focus();
        status = false;
        return false;//사용자가 서비스를 요청한 시점으로 돌아감
    }
    
    if(!$("#passwd").val()) {//비밀번호를 입력하지 않으면 수행
        alert("비밀번호를 입력하세요");
        $("#passwd").focus();
        status = false;
        return false;
    }
    //비밀번호와 재입력비밀번호가 같지않으면 수행
    if($("#passwd").val() != $("#repass").val()){
        alert("비밀번호를 동일하게 입력하세요");
        $("#repass").focus();
        status = false;
        return false;
    }
    
    if(!$("#name").val()) {//이름을 입력하지 않으면 수행
        alert("사용자 이름을 입력하세요");
        $("#name").focus();
        status = false;
        return false;
    }
       
    if(!$("#tel").val()) {//전화번호를 입력하지 않으면 수행
        alert("전화번호를 입력하세요");
        $("#tel").focus();
        status = false;
        return false;
    }  
    
    if(!$("#empNo").val()) {//전화번호를 입력하지 않으면 수행
        alert("사원번호를 입력하세요");
        $("#empNo").focus();
        status = false;
        return false;
    }  
    
    if(!$("#salary").val()) {//전화번호를 입력하지 않으면 수행
        alert("급여를 입력하세요");
        $("#salary").focus();
        status = false;
        return false;
    } 
}