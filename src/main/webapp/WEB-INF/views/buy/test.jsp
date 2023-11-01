<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button type="button" target="_blank" onclick="openPop({${sessionScope.vo.u_id })">
    
</body>

<script type="text/javascript">
function openPop(u_id) {
    var popup = window.open('/delivery?u_id=' + u_id , '', 'width=700px,height=800px,scrollbars=yes');
}


</script>
</html>