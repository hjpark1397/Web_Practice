<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>201704013 ������ �ڹٺ����</title>
</head>
<script type="text/javascript">
function check(){//�׸��� ���õǾ����� Ȯ���ϴ� �Լ�
	
	var frm = document.getElementById("form");
	
	if(frm.coffee.value == null||frm.coffee.value ==""){//���� Ŀ�Ǹ� �������� �ʾ��� ���!
		alert("Ŀ�Ǹ� �������ּ���.");//�˸��� ���
		return false;		
	}
	
	else if(frm.size.value=="�������ּ���"){//������ ������ ���� �ʾ�����
		alert("����� �������ּ���.");
		return false;
	}
}
	
function reset_chk(){//��� ���� ����
	var reset = confirm("����Ͻðڽ��ϱ�?");//��� �������� Ȯ���� ������ �и��� ��Ҹ� ������ �������� ���� ����  
}
</script>
<body>
	<form action="Lab4_result.jsp" id = "form" method="post" onsubmit="return check()" onreset="">
		<h1>���� �ֹ��ϱ�</h1>
		<hr>
		Ŀ������ <br> 
		<input type="radio" name="coffee" value="�Ƹ޸�ī��">�Ƹ޸�ī��
		<input type="radio" name="coffee" value="ī���">ī���
		<input type="radio" name="coffee" value="ī���ī">ī���ī <br>
		�ɼ�<br> 
		<input type="radio" name="option" value="hot">hot
		<input type="radio" name="option" value="ice" checked>ice <br>
		������<br> <select name="size">
			<option>�������ּ���</option>
			<option value="Tall">Tall</option>
			<option value="Grande">Grande</option>
			<option value="Venti">Venti</option>
		</select> 
		<input type="submit" value="���� �ֹ� �ϱ�"> 
		<input type="reset"	value="����ϱ�" onclick="reset_chk()">
		<!--Ŭ���ϸ� üũ�ϴ� �Լ��� ���ư���. -->
	</form>
</body>
</html>