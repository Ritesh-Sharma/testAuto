<html>
<head>
<title>File Uploading Form</title>
<link rel="stylesheet" type="text/css" href="styles/cit.css" />
<link rel="stylesheet" type="text/css" href="styles/CITTable.css" />
<script type='text/javascript' src='scripts/jquery.js'></script>
<script type='text/javascript' src='scripts/ci.js'></script>
<script type='text/javascript' src='scripts/jquery.tablesorter.js'></script>

<script type="text/javascript" language="javascript">
	/* function isDecimal(str){
	 if(isNaN(str) || str.indexOf(".")<0){
	 alert("Please enter image quality value ranging from 0.1 To 1.0. Example: 0.1, 0.2,...0.7,..1.0");
	 }
	 }
	 */
	function validate() {
		var numbers = /^[0-9]+$/;
		/* 	 var imgQuality = document.ImageFileUpload.imagequality.value;
		 var numbers = /^[0.1-1.0]+$/;
		 alert("1: "+imgQuality.charAt(0));
		 alert("3: "+imgQuality.charAt(2));
		
		 if(imgQuality == "")
		 {
		 alert("Image Quality value can not be blank");
		 ImageFileUpload.imagequality.focus();
		 return false;
		 }
		
		 if(isNaN(imgQuality) || imgQuality.indexOf(".")<0){
		 alert("Please enter image quality value ranging from 0.1 To 1.0. Example: 0.1, 0.2,...0.7,..1.0");
		 ImageFileUpload.imagequality.focus();
		 return false;
		 }
		 */
		/* 	 if(document.ImageFileUpload.dpi.value == "")
		 {
		 alert("DPI value can not be blank");
		 ImageFileUpload.dpi.focus();
		 return false;
		 }
		 */

		if (!(document.ImageFileUpload.dpi.value == "")) {
			if (!(document.ImageFileUpload.dpi.value.match(numbers))) {
				alert("Please input numeric characters only");
				ImageFileUpload.dpi.value = "";
				ImageFileUpload.dpi.focus();
				return false;
			}
		}

		if (document.ImageFileUpload.file.value == "") {
			alert("Please select file to upload");
			//ImageFileUpload.file.focus();
			return false;
		}
		return true;
	}
</script>



<title>Case Investigator</title>
</head>
<body>

	<div class="header">
		<br>
	</div>

	<img src="images/CITitle.png" alt="CITitle" width="400px" />

	<div class="gr">
		<hr>
		<h3>Image Compression</h3>
		<hr>
	</div>

	<table border="1" width="100%" class="tableHead">
		<tr>
			<th><a href="index.jsp" style="color: white">HOME</a></th>
		</tr>
	</table>
	<br>


	<form name="ImageFileUpload" action="IOUploadFile.jsp" method="post"
		onsubmit="return(validate());" enctype="multipart/form-data">

		<h3>Image File Upload:</h3>

		<table align="center">
			<tr height="40">
				<td align="right">Image Quality :</td>
				<td width="40"></td>
				<td align="left"><select name="imagequality">
						<option value="0.1">0.1</option>
						<option value="0.2">0.2</option>
						<option value="0.3">0.3</option>
						<option value="0.4">0.4</option>
						<option value="0.5">0.5</option>
						<option value="0.6">0.6</option>
						<option value="0.7">0.7</option>
						<option value="0.8">0.8</option>
						<option value="0.9">0.9</option>
						<!-- <option value="1.0">1.0</option> --></td>
				<td width="20"></td>
				<td align="left">Setting low compression quality value produce
					high compressed image</td>
			</tr>

			<tr height="40">
				<td align="right">DPI :</td>
				<td width="40"></td>
				<td align="left"><input type="text" name="dpi" size="3"
					maxlength="5"></td>
				<td width="20"></td>
				<td align="left">DPI can be alter as per requirement</td>
			</tr>
		</table>

		<table align="left">

			<tr height="40">
				<td align="right" width="">Select a file to upload :</td>
				<td width="40"></td>
				<td align="left"><input type="file" name="file" size="10" /></td>
			</tr>


			<tr height="40">
				<td align="right" width="430"></td>
				<td width="40"></td>
				<td align="left"><input type="submit" value="Upload File" /></td>
			</tr>

			<tr height="100">
				<td align="right" width="390"></td>
				<td width="40"></td>
				<td align="left"></td>
			</tr>

		</table>
	</form>

	<br />
	<br />
	<br />
	<br />
<div class="footer"> 
		<br>
	</div>
</body>
</html>
