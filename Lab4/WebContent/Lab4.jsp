<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>201704013 박현주 자바빈과제</title>
</head>
<script type="text/javascript">
function check(){//항목이 선택되었는지 확인하는 함수
	
	var frm = document.getElementById("form");
	
	if(frm.coffee.value == null||frm.coffee.value ==""){//만약 커피를 선택하지 않았을 경우!
		alert("커피를 선택해주세요.");//알림을 띄움
		return false;		
	}
	
	else if(frm.size.value=="선택해주세요"){//사이즈 선택이 되지 않았을때
		alert("사이즈를 선택해주세요.");
		return false;
	}
}
	
function reset_chk(){//취소 여부 질문
	var reset = confirm("취소하시겠습니까?");//취소 눌렀을때 확인을 누르면 밀리고 취소를 누르면 웹페이지 정보 유지  
}
</script>
<body>
	<form action="Lab4_result.jsp" id = "form" method="post" onsubmit="return check()" onreset="">
		<h1>음료 주문하기</h1>
		<hr>
		커피종류 <br> 
		<input type="radio" name="coffee" value="아메리카노">아메리카노
		<input type="radio" name="coffee" value="카페라떼">카페라떼
		<input type="radio" name="coffee" value="카페모카">카페모카 <br>
		옵션<br> 
		<input type="radio" name="option" value="hot">hot
		<input type="radio" name="option" value="ice" checked>ice <br>
		사이즈<br> <select name="size">
			<option>선택해주세요</option>
			<option value="Tall">Tall</option>
			<option value="Grande">Grande</option>
			<option value="Venti">Venti</option>
		</select> 
		<input type="submit" value="음료 주문 하기"> 
		<input type="reset"	value="취소하기" onclick="reset_chk()">
		<!--클릭하면 체크하는 함수가 돌아간다. -->
	</form>
</body>
</html>