<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Start</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function checkID(){
		var id = $("#userId").val();
		alert('check '+id);
		$.ajax(
			{
	         type:"get",
	         url:"/rest/member/checkId.do",
	         contentType: "application/json",
	         data :{"userId":id},
		     success:function (data,textStatus){
		    	 alert(data);
		    	 var obj = JSON.parse(data);
		    	 alert(obj.result);
		    	 if(obj.result){
		    	 	$('#message').text(id+" 사용불가능");
		    	 } else {
		    		$('#message').text(id+" 사용가능");
		    	 }
		     },
		     error:function(data,textStatus){
		        alert("에러가 발생했습니다.");
		     },
		     complete:function(data,textStatus){
		    	 
		     }
		  }	
		);
		return false;
	}
</script>
</head>
<body>
	<form action="" method="">
		<input type="text" name="userId" id="userId">
		<input type="button" value="ID확인" onclick="checkID()"><br>
		<span id="message"></span><br>
		<input type="password" name="pwd" id="pwd">
		<input type="submit" value="회원가입">
	</form>
</body>
</html>