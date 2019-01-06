<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="js/jquery.min.js"></script>
<link href="css/jquery-ui.min.css" rel="stylesheet" />
<script src="js/jquery-ui.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<script src="js/bootstrap.min.js"></script>
<link href="css/style.css" rel="stylesheet" />
</head>
<body>
	<h1 id="title">Ứng dụng hỗ trợ đọc báo tiếng nhật</h1>
	<form action="result.php" method="post">
		<textarea id="content" rows="10" cols="100" name="content"
			placeholder="Nhập văn bản.."></textarea>
		<input type="submit" value="Tách từ" class="btn btn-default">
		
	</form>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<c:forEach var="p" items="${text}">
					<span class="ttip">${p.getSurfaceForm()}
<%-- 						<span class="ttiptext">${p.getBaseForm()}</span> --%>
<%-- 						<span class="ttiptext">${p.getPartOfSpeech()}</span> --%>
						<span class="ttiptext">${p.getReading()}
<%-- 							<button class="btn btn-warning"  selected-token="${p.getId()}">+</button> --%>
							<button class="btn btn-warning">+</button>
						</span>
					</span>
					<c:if test="${p.equals('。')}">
						<br>
					</c:if>
				</c:forEach>
			</div>
			<div class="col-sm-2"></div>
			
		</div>
		<input type="submit" value="Xem Flashcard đã tạo" class="btn btn-default">
		<ul>
		</ul>
	</div>

</body>
</html>