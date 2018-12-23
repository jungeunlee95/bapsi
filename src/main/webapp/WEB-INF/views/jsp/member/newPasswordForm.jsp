<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="Mobirise v4.8.1, mobirise.com">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/css/assets/images/bapsi-logo31-1-134x134.png"
	type="image/x-icon">
<meta name="description" content="Web Generator Description">
<title>bapsi</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons-bold/mobirise-icons-bold.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons/mobirise-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap-grid.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap-reboot.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/dropdown/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/socicon/css/styles.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/theme/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/assets/mobirise/css/mbr-additional.css"
	type="text/css">

<script
	src="${pageContext.request.contextPath}/resources/css/assets/web/assets/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/assets/popper/popper.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/assets/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/assets/dropdown/js/script.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/assets/touchswipe/jquery.touch-swipe.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/assets/smoothscroll/smooth-scroll.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/assets/theme/js/script.js"></script>


</head>
<body>


	<section class="mbr-section form1 cid-r4PR64ZLCL" id="form1-t">




		<div class="container">
			<div class="row justify-content-center">
				<div class="title col-12 col-lg-8">
					<h2
						class="mbr-section-title align-center pb-3 mbr-fonts-style display-2">비밀번호
						찾기</h2>

				</div>
			</div>
		</div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="media-container-column col-lg-8"
					data-form-type="formoid">
					<form class="mbr-form"
						action="${pageContext.request.contextPath}/newPassword"
						method="post" data-form-title="Mobirise Form"
						onclick="return findPasswordOK()">
						<div class="row row-sm-offset">
							<div class="col-md-7 multi-horizontal" data-for="name">
								<div class="form-group">
									<label class="form-control-label mbr-fonts-style display-7"
										for="name-form1-t">가입되어있는 이메일을 입력해주세요</label> <input
										type="email" class="form-control" name="email"
										data-form-field="Name" placeholder="이메일" id="email" required>
						
								</div>
						
							</div>
							<br> <input type="submit"
								class="btn btn-secondary btn-form display-4"
								style="width: 50%; padding-left: 10px; padding-right: 10px; font-size: 130%; border-radius: 30px;"
								id="findPasswordOK" value="비밀번호 재설정">
						</div>
					</form>
				</div>
			</div>

		</div>
	</section>


</body>

</html>