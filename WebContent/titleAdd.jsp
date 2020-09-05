<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직책 추가</title>
<script type="text/javascript"
    src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() { 
    $.get('<%=request.getContextPath()%>/TitleAddServlet', 
            function(nextNo) {
        $('form').find("input[name='titleNo']").val(nextNo);
        });
    
    $('#reg').on("click", function(){
        var newTitle = {
                titleNo:   $('form').find("input[name='titleNo']").val(), 
                titleName: $('form').find("input[name='titleName']").val() };
        $.ajax({
            type : 'post',
            url : "<%=request.getContextPath()%>/TitleAddServlet",
            contentType: 'application/json',
            data : JSON.stringify(newTitle),
            dataType:"json",
            success : function(data){
                console.log("data===>"+data);
                alert('추가하였습니다.' + data.res );
            },
            complete : function() {
                location.href = "http://localhost:8080/e_jquery_study/titleList.jsp";
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
            
        });

    });
    
});


$(function() {
    

});
</script>
</head>
<body>
    <form method="post">
        <div>
            <label for="titleNo">직책번호</label> 
            <input name='titleNo' id="titleNo">
        </div>
        <div>
            <label for="titleName">직책명</label> 
            <input name='titleName' id="titleName" />
        </div>
        <div>
            <button id="reg">직책 추가</button>
            <button type="reset">취소</button>
        </div>
    </form>
</body>
</html>