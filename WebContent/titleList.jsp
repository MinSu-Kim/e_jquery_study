<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
    src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
$(function(){

    $('#addTitle').on("click", function(){
        self.location = "titleAdd.jsp";
    });
    
     $.ajax({
        timeout: 10000, // 시간 제한
        type:"POST", // 전송 방식 GET , POST , PUT , DELETE
        url:"<%=request.getContextPath()%>/TitleServlet", // 전송할 경로
        /*  contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: {"key1":"한글"} , */ // 전송할 키와 값
        dataType:"json",
        beforeSend : function () {
            // 전송 전 작업 , 화면을 흐르게 하기..
        },
        success : function(json) {
            // 작업이 성공했을 경우
            //alert ( json );
            
            var dataLength = json.length;
            if ( dataLength >=1 ){
                var sCont = "";
                for ( i=0 ; i < dataLength ; i++){
                    sCont += "<tr><td>" + json[i].titleNo + "</td>";
                    sCont += "<td>" + json[i].titleName + "</td></tr>";
                }
                $("table > tbody:last-child").append(sCont);  
            }
        },
        complete : function() {
            // 성공여부와 상관없이 ajax 완료후 작업    
        },
        error : function(request, status, error) {
            // 에러가 났을 경우의 작업
        }
    }); 

});
</script>

</head>
<body>
    <h2>사원목록</h2>
    <table border=1>
        <thead>
            <td>직책번호</td>
            <td>직책명</td>
        </thead>
        <tbody>

        </tbody>
    </table>
    <button id="addTitle">직책 추가</button>
</body>
</html>