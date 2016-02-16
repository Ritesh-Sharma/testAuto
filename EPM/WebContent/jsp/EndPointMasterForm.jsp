<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<link rel="stylesheet" type="text/css" href="styles/index.css" />
<title>Disable User</title>

<script>
	function loadForm() {
		//alert("Page is loaded");
		document.forms.EndPointMasterForm.submit();
	}
</script>
</head>

<body onload="loadForm()">

	<form name="EndPointMasterForm" action="../EndPointMasterListingServlet"></form>
</body>
</html>


