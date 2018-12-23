<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
<head>
  <!-- Site made with Mobirise Website Builder v4.8.1, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v4.8.1, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/css/assets/images/bapsi-logo31-1-134x134.png" type="image/x-icon">
  <meta name="description" content="">
  <title>bapsi</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons-bold/mobirise-icons-bold.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons/mobirise-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/theme/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  
  <script src="${pageContext.request.contextPath}/resources/css/assets/web/assets/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/popper/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/touchswipe/jquery.touch-swipe.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/parallax/jarallax.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/viewportchecker/jquery.viewportchecker.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/smoothscroll/smooth-scroll.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/dropdown/js/script.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/theme/js/script.js"></script>
 <style>
 @import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
 
.floating {
	position: fixed;
	z-index: 100;
	text-align: center;
	width: 230px;
	padding: 5px;
	bottom: 80px;
	right: 0px;
	cursor: pointer;
}

@media ( min-width :576px) {
	.floating {
		max-width: 160px
	}
}

@media ( min-width :768px) {
	.floating {
		max-width: 180px
	}
}

@media ( min-width :992px) {
	.floating {
		max-width: 200px
	}
}

@media ( min-width :1500px) {
	.floating {
		max-width: 230px
	}
}

.span_plus {
   float:right;
   margin-top:5px;
}

.btn_plus {
   font-size:14px;
   color:#b0a69f;
   background:
      url("${pageContext.request.contextPath}/resources/images/plus.png")
      right center no-repeat;
   padding:1px 20px 0 0;
}

a.btn_plus:hover {
   color:#b0a69f;
}

.cid-r4OiBsP4t5 H2 {
	
	font-family: 'Hanna';
}
</style>
</head>
<body>

<header><jsp:include page = "/WEB-INF/views/jsp/include/topMenu.jsp" /></header>

<section class="header1 cid-r4Ph1rRQGM mbr-parallax-background" id="header1-j">

    

    

    <div class="container">
        <div class="row justify-content-md-center">
            <div class="mbr-white col-md-10">
                
                <h3 class="mbr-section-subtitle align-center mbr-light pb-3 mbr-fonts-style display-2"><font color="#ffffff"><strong>배고플 땐 Bapsi</strong></font></h3>
                <p class="mbr-text align-center pb-3 mbr-fonts-style display-7"><font color="#ffffff"><strong>여러분이 주인공입니다. &nbsp;지금 바로 셰프가 되어 보세요!</strong></font><br><strong><br></strong></p>
                <div class="mbr-section-btn align-center">
                	<c:choose>
                		<c:when test="${empty userVO}">
                			<a class="btn btn-md btn-secondary display-7" href="${pageContext.request.contextPath}/login"><span class="mbri-play mbr-iconfont mbr-iconfont-btn">시작하기</span></a>
                		</c:when>
                		<c:otherwise>
                			<a class="btn btn-md btn-secondary display-7" href="${pageContext.request.contextPath}/recipe/recipeList"><span class="mbri-play mbr-iconfont mbr-iconfont-btn">시작하기</span></a>
                		</c:otherwise>
                	</c:choose>
                </div>
            </div>
        </div>
    </div>

</section>

<section class="features16 cid-r4OiBsP4t5" id="features16-1">
<br><hr><br>
      <div class="container align-center">
         <h2 class="pb-3 mbr-fonts-style mbr-section-title display-2">뱁시맨의  추천 메뉴 <span class="span_plus"><a class="btn_plus" href="${pageContext.request.contextPath}/recipe/recipeList">더보기</a></span></h2>
				
         <div class="row media-row">
            <c:forEach begin="0" end="3" items="${recipeList}" var="recipe"
               varStatus="loop">
               <div class="team-item col-lg-3 col-md-6">
                  <div class="item-image">

                     <c:choose>
                        <c:when test="${empty userVO }">
                           <a href="#" onclick="AfterLogin();"> <c:choose>
                                 <c:when test="${empty recipe.file_fakename}">
                                    <img
                                       src="${pageContext.request.contextPath}/resources/images/Bapsi_logo.png"
                                       style="min-height: 300px" alt="이미지를 불러올수 없습니다.">
                                 </c:when>
                                 <c:otherwise>
                                    <img
                                       src="${pageContext.request.contextPath}/imgR/${recipe.file_fakename}"
                                       style="min-height: 300px" alt="이미지를 불러올수 없습니다.">
                                 </c:otherwise>
                              </c:choose>
                           </a>
                        </c:when>
                        <c:otherwise>
                           <a
                              href="${pageContext.request.contextPath}/recipe/readPage${pagingMaker.makeFind(pagingMaker.cri.page)}&no=${recipe.no}&userNo=${userVO.no}&click=1">
                              <c:choose>
                                 <c:when test="${empty recipe.file_fakename}">
                                    <img
                                       src="${pageContext.request.contextPath}/resources/images/Bapsi_logo.png"
                                       width="500px" height="400px" alt="이미지를 불러올수 없습니다.">
                                 </c:when>
                                 <c:otherwise>
                                    <img
                                       src="${pageContext.request.contextPath}/imgR/${recipe.file_fakename}"
                                       width="500px" height="400px" alt="이미지를 불러올수 없습니다.">

                                 </c:otherwise>
                              </c:choose>
                           </a>
                        </c:otherwise>
                     </c:choose>

                  </div>
                  <div class="item-caption py-3">
                     <div class="item-name px-2">
                        <c:if test="${recipe.title.length()>7}">
                           <p class="mbr-fonts-style display-5">${recipe.title.substring(0,7)}
                              ...</p>
                        </c:if>
                        <c:if test="${recipe.title.length()<=7}">
                           <p class="mbr-fonts-style display-5">${recipe.title}</p>
                        </c:if>
                     </div>
                     <div class="item-role px-2">
                        <p>${recipe.userNickName}님</p>
                     </div>
                     <div class="item-social pt-2">
                        <p>${recipe.point}점</p>
                     </div>
                  </div>
               </div>
            </c:forEach>
         </div>
      </div>
   </section>
   <br><hr><br>
   <section class="features16 cid-r4OiBsP4t5" id="features16-1">

      <div class="container align-center">
         <h2 class="pb-3 mbr-fonts-style mbr-section-title display-2">추운 겨울 마음 속까지 따뜻해지는 음식 <span class="span_plus"><a class="btn_plus" href="${pageContext.request.contextPath}/recipe/recipeTagList?TagName=겨울">더보기</a></span></h2>

         <div class="row media-row">
         <c:forEach begin="0" end="3" items="${winterRecipe}" var="winter"
               varStatus="loop">
            <div class="team-item col-lg-3 col-md-6">
               <div class="item-image">
                     <c:choose>
                        <c:when test="${empty userVO }">
                           <a href="#" onclick="AfterLogin();"> <c:choose>
                                 <c:when test="${empty winter.file_fakename}">
                                    <img
                                       src="${pageContext.request.contextPath}/resources/images/Bapsi_logo.png"
                                       style="min-height: 300px" alt="이미지를 불러올수 없습니다.">
                                 </c:when>
                                 <c:otherwise>
                                    <img
                                       src="${pageContext.request.contextPath}/imgR/${winter.file_fakename}"
                                       style="min-height: 300px" alt="이미지를 불러올수 없습니다.">
                                 </c:otherwise>
                              </c:choose>
                           </a>
                        </c:when>
                        <c:otherwise>
                           <a
                              href="${pageContext.request.contextPath}/recipe/readPage${pagingMaker.makeFind(pagingMaker.cri.page)}&no=${winter.no}&userNo=${userVO.no}&click=1">
                              <c:choose>
                                 <c:when test="${empty winter.file_fakename}">
                                    <img
                                       src="${pageContext.request.contextPath}/resources/images/Bapsi_logo.png"
                                       width="800px" height="400px" alt="이미지를 불러올수 없습니다.">
                                 </c:when>
                                 <c:otherwise>
                                    <img
                                       src="${pageContext.request.contextPath}/imgR/${winter.file_fakename}"
                                       width="800px" height="400px" alt="이미지를 불러올수 없습니다.">

                                 </c:otherwise>
                              </c:choose>
                           </a>
                        </c:otherwise>
                     </c:choose>
                  </div>
               <div class="item-caption py-3">
                  <div class="item-name px-2">
                     <c:if test="${winter.title.length()>7}">
                        <p class="mbr-fonts-style display-5">${winter.title.substring(0,7)} ...</p>
                     </c:if>
                     <c:if test="${winter.title.length()<=7}">
                        <p class="mbr-fonts-style display-5">${winter.title}</p>
                     </c:if>
                  </div>
                  <div class="item-role px-2">
                     <p>${winter.userNickName}님</p>
                  </div>
                  <div class="item-social pt-2">
                     <p>${winter.point}점</p>
                  </div>
               </div>
            </div>
             </c:forEach>
         </div>
      </div>
   </section>
<br><hr><br>
  <section class="features16 cid-r4OiBsP4t5" id="features16-1">

      <div class="container align-center">
         <h2 class="pb-3 mbr-fonts-style mbr-section-title display-2">쉽고 맛있는 실생활 요리 <span class="span_plus"><a class="btn_plus" href="${pageContext.request.contextPath}/recipe/recipeTagList?TagName=실생활 요리">더보기</a></span></h2>

         <div class="row media-row">
         <c:forEach begin="0" end="3" items="${easyRecipe}" var="easyR"
               varStatus="loop">
            <div class="team-item col-lg-3 col-md-6">
               <div class="item-image">
                     <c:choose>
                        <c:when test="${empty userVO }">
                           <a href="#" onclick="AfterLogin();"> <c:choose>
                                 <c:when test="${empty easyR.file_fakename}">
                                    <img
                                       src="${pageContext.request.contextPath}/resources/images/Bapsi_logo.png"
                                       style="min-height: 300px" alt="이미지를 불러올수 없습니다.">
                                 </c:when>
                                 <c:otherwise>
                                    <img
                                       src="${pageContext.request.contextPath}/imgR/${easyR.file_fakename}"
                                       style="min-height: 300px" alt="이미지를 불러올수 없습니다.">
                                 </c:otherwise>
                              </c:choose>
                           </a>
                        </c:when>
                        <c:otherwise>
                           <a
                              href="${pageContext.request.contextPath}/recipe/readPage${pagingMaker.makeFind(pagingMaker.cri.page)}&no=${easyR.no}&userNo=${userVO.no}&click=1">
                              <c:choose>
                                 <c:when test="${empty easyR.file_fakename}">
                                    <img
                                       src="${pageContext.request.contextPath}/resources/images/Bapsi_logo.png"
                                       width="800px" height="400px" alt="이미지를 불러올수 없습니다.">
                                 </c:when>
                                 <c:otherwise>
                                    <img
                                       src="${pageContext.request.contextPath}/imgR/${easyR.file_fakename}"
                                       width="800px" height="400px" alt="이미지를 불러올수 없습니다.">

                                 </c:otherwise>
                              </c:choose>
                           </a>
                        </c:otherwise>
                     </c:choose>
                  </div>
               <div class="item-caption py-3">
                  <div class="item-name px-2">
                     <c:if test="${easyR.title.length()>7}">
                        <p class="mbr-fonts-style display-5">${easyR.title.substring(0,7)} ...</p>
                     </c:if>
                     <c:if test="${easyR.title.length()<=7}">
                        <p class="mbr-fonts-style display-5">${easyR.title}</p>
                     </c:if>
                  </div>
                  <div class="item-role px-2">
                     <p>${easyR.userNickName}님</p>
                  </div>
                  <div class="item-social pt-2">
                     <p>${easyR.point}점</p>
                  </div>
               </div>
            </div>
             </c:forEach>
         </div>
      </div>
   </section>
   
   <br><hr><br>
<section class="counters1 counters cid-r4OiDA6F9z" id="counters1-4">

    

    

    <div class="container">
        
        

        <div class="container pt-4 mt-2">
            <div class="media-container-row">
                <div class="card p-3 align-center col-12 col-md-6 col-lg-4">
                    <div class="panel-item p-3">
                        <div class="card-img pb-3">
                            <span class="mbr-iconfont mbri-preview"></span>
                        </div>

                        <div class="card-text">
                            <h3 class="count pt-3 pb-3 mbr-fonts-style display-2">
                                  ${viewCnt}</h3>
                            <h4 class="mbr-content-title mbr-bold mbr-fonts-style display-7">페이지 뷰 수</h4>
                            <p class="mbr-content-text mbr-fonts-style display-7">
                                
                            </p>
                        </div>
                    </div>
                </div>


                <div class="card p-3 align-center col-12 col-md-6 col-lg-4">
						<div class="panel-item p-3">
							<div class="card-img pb-3">
								<span class="mbr-iconfont mbri-touch"></span>
							</div>
							<div class="card-text">
								<h3 class="count pt-3 pb-3 mbr-fonts-style display-2">${pagingMaker.totalData}</h3>
								<h4 class="mbr-content-title mbr-bold mbr-fonts-style display-7">
									레시피 수</h4>
								<p class="mbr-content-text mbr-fonts-style display-7"></p>
							</div>
						</div>
					</div>
					

                <div class="card p-3 align-center col-12 col-md-6 col-lg-4">
                    <div class="panel-item p-3">
                        <div class="card-img pb-3">
                            <span class="mbr-iconfont mbri-user"></span>
                        </div>
                        <div class="card-text">
                            <h3 class="count pt-3 pb-3 mbr-fonts-style display-2">
                                 ${pagingMaker2.totalData}
                            </h3>
                            <h4 class="mbr-content-title mbr-bold mbr-fonts-style display-7">
                                회원수</h4>
                            <p class="mbr-content-text mbr-fonts-style display-7">
                                    
                            </p>
                        </div>
                    </div>
                </div>


                
            </div>
        </div>
   </div>
</section>

	 <script type="text/javascript">
	 		function AfterLogin(){
	 			if(confirm('로그인 후 이용해주시길 바랍니다.')){
	 				location.href="${pageContext.request.contextPath}/login";
	 			}else{
	 				location.href="${pageContext.request.contextPath}/recipe/recipeList";
	 			}
	 		}
	 
      
      </script>

<div class = "floating">
   <div><a href="${pageContext.request.contextPath}/WhatToEat">
   <img src="${pageContext.request.contextPath}/resources/images/Floating_logo2.png" style="width:100%" title="뭐 먹을지 모르겠다면 클릭!"></a></div> <!-- 원래 200px -->
</div>

<footer><jsp:include page = "/WEB-INF/views/jsp/include/footer.jsp" /></footer>

</body>
</html>