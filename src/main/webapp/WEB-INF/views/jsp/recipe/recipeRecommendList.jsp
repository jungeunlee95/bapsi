<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Site made with Mobirise Website Builder v4.8.1, https://mobirise.com -->
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

<Script>
   var result = '${result}';

   if (result == 'Update') {
      alert("게시글이 수정 되었습니다!");
   }

   if (result == 'Delete') {
      alert("게시글이 삭제 되었습니다!");
   }

   if (result == 'Write') {
      alert("게시글이 등록 되었습니다!");
   }
</Script>
</head>
<body>

   <header><jsp:include page="/WEB-INF/views/jsp/include/topMenu.jsp" /></header>

   <section class="features3 cid-r4QcxVNCog" id="features3-17">

   <div class="container">

      <div align="center">
            <h2>조건에 맞는 레시피가  <b style="color: red">${pagingMaker.totalData}</b>개 있습니다.</h2> 
            <br><br>
       </div>
      
         <div class="media-container-row">
            <c:forEach begin="0" end="2" items="${recipeList}" var="recipe"
               varStatus="loop">
               <div class="card p-3 col-12 col-md-6 col-lg-4">
                  <div class="card-wrapper">
                     <div class="card-img">
                        <c:choose>
                        <c:when test="${empty userVO }">
                           <a href="#" onclick="AfterLogin();"> <c:choose>
                                 <c:when test="${empty recipe.file_fakename}">
                                    <img
                                       src="${pageContext.request.contextPath}/resources/images/Bapsi_logo.png"
                                       style="min-height: 300px; max-height: 300px;"  alt="이미지를 불러올수 없습니다.">
                                 </c:when>
                                 <c:otherwise>
                                    <img
                                       src="${pageContext.request.contextPath}/imgR/${recipe.file_fakename}"
                                       style="min-height: 300px; max-height: 300px;"  alt="이미지를 불러올수 없습니다.">
                                 </c:otherwise>
                              </c:choose>
                           </a>
                        </c:when>
                        <c:otherwise>
                           <a
                              href="${pageContext.request.contextPath}/recipe/readPage${pagingMaker.makeFind(pagingMaker.cri.page)}&no=${recipe.no}&userNo=${userVO.no}&click=1">
                              <!-- <img src="/bapsi/recipeImg/177232178popo.png" style="width:328px; height: 290px;"> -->
                              <c:choose>
                                 <c:when test="${empty recipe.file_fakename}">
                                    <img
                                       src="${pageContext.request.contextPath}/resources/images/Bapsi_logo.png"
                                       style="min-height: 300px; max-height: 300px;" alt="이미지를 불러올수 없습니다.">
                                 </c:when>
                                 <c:otherwise>
                                    <img
                                       src="${pageContext.request.contextPath}/imgR/${recipe.file_fakename}"
                                       style="min-height: 300px; max-height: 300px;"  alt="이미지를 불러올수 없습니다.">
                                 </c:otherwise>
                              </c:choose>
                           </a>
                        </c:otherwise>
                     </c:choose>
                     </div>
                     <div class="card-box">
                        <h10 class="mbr-text mbr-fonts-style display-7">조회수:&nbsp;${recipe.viewCnt}</h10>
                        
                        <c:if test="${recipe.title.length()>10}">
                           <h4 class="card-title mbr-fonts-style display-7">${recipe.title.substring(0,10)} ... </h4>
                        </c:if>
                        <c:if test="${recipe.title.length()<=10}">
                           <h4 class="card-title mbr-fonts-style display-7">${recipe.title}</h4>
                        </c:if>
                        
                        <c:if test="${recipe.subTitle.length()>10}">
                           <p class="mbr-text mbr-fonts-style display-7">${recipe.subTitle.substring(0,10)} ...</p>
                        </c:if>
                        <c:if test="${recipe.subTitle.length()<=10}">
                           <p class="mbr-text mbr-fonts-style display-7">${recipe.subTitle}</p>
                        </c:if>
                        
                        
                        <p class="mbr-text mbr-fonts-style display-7">${recipe.userNickName}님</p>
                        <br>
                        <h5 class="mbr-text mbr-fonts-style display-7">추천수:&nbsp;${recipe.point}</h5>
                     </div>

                  </div>
               </div>
            </c:forEach>
         </div>

         <div class="media-container-row">
            <c:forEach begin="3" end="5" items="${recipeList}" var="recipe"
               varStatus="loop">
               <div class="card p-3 col-12 col-md-6 col-lg-4">
                  <div class="card-wrapper">
                     <div class="card-img">
                           <c:choose>
                        <c:when test="${empty userVO }">
                           <a href="#" onclick="AfterLogin();"> <c:choose>
                                 <c:when test="${empty recipe.file_fakename}">
                                    <img
                                       src="${pageContext.request.contextPath}/resources/images/Bapsi_logo.png"
                                       style="min-height: 300px; max-height: 300px;" alt="이미지를 불러올수 없습니다.">
                                 </c:when>
                                 <c:otherwise>
                                    <img
                                       src="${pageContext.request.contextPath}/imgR/${recipe.file_fakename}"
                                       style="min-height: 300px; max-height: 300px;" alt="이미지를 불러올수 없습니다.">
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
                                       style="min-height: 300px; max-height: 300px;" alt="이미지를 불러올수 없습니다.">
                                 </c:when>
                                 <c:otherwise>
                                    <img
                                       src="${pageContext.request.contextPath}/imgR/${recipe.file_fakename}"
                                       style="min-height: 300px; max-height: 300px;" alt="이미지를 불러올수 없습니다.">
                                 </c:otherwise>
                              </c:choose>
                           </a>
                        </c:otherwise>
                     </c:choose>
                     </div>
                     <div class="card-box">
                        <h10 class="mbr-text mbr-fonts-style display-7">조회수:&nbsp;${recipe.viewCnt}</h10>
                        <h4 class="card-title mbr-fonts-style display-7">${recipe.title}</h4>
                        <p class="mbr-text mbr-fonts-style display-7">${recipe.subTitle}</p>
                        <p class="mbr-text mbr-fonts-style display-7">${recipe.userNickName}님</p>
                        <br>
                        <h5 class="mbr-text mbr-fonts-style display-7">추천수:&nbsp;${recipe.point}</h5>
                     </div>

                  </div>
               </div>
            </c:forEach>
         </div>


         <div class="media-container-row">
            <div class="btn-group" role="group" aria-label="Basic example"
               style="text-align: center;">
               <c:if test="${pagingMaker.prev}">
                  <button type="button" class="btn btn-outline-danger btn-sm"
                     onclick="location.href='${pageContext.request.contextPath}/recipe/recommend${pagingMaker.makeRecommend(pagingMaker.startPage-1)}'" style="cursor:pointer;">◀</button>
               </c:if>
               
            <form id="my-form-paging" action="${pageContext.request.contextPath}/recipe/recommend" method="get">
               <input type="hidden" name="ingNo" value="${ingNo}">
               <input type="hidden" id="my-pagingParam" name="page">
                     <input type="hidden" name = "numPerPage" value="6">
            

               <c:forEach begin="${pagingMaker.startPage}"
                  end="${pagingMaker.endPage}" var="pNum">
                  <a href="#" class="my-btn-paging">
                     <button type="button"
                        class="<c:out value="${pagingMaker.cri.page == pNum?'btn btn-outline-danger btn-sm  active':' btn  btn-default btn-sm'}"/>" style="cursor:pointer;">${pNum}</button>
                  </a>
               </c:forEach>
               </form>
               
               <c:if test="${pagingMaker.next&&pagingMaker.endPage>0}">
                  <button type="button" class="btn btn-outline-danger btn-sm"
                     onclick="location.href='${pageContext.request.contextPath}/recipe/recommend${pagingMaker.makeRecommend(pagingMaker.endPage+1)}'" style="cursor:pointer;">▶</button>
               </c:if>
            </div>
         </div>
      </div>
   </section>
   
    <script type="text/javascript">
          function AfterLogin(){
             if(confirm('로그인 후 이용해주시길 바랍니다.')){
                location.href="${pageContext.request.contextPath}/login";
             }
          }
    
          $(document).ready(function(){
                  $('.my-btn-paging').on("click",function(e){
                     $('#my-pagingParam').val($(this).children('button').text());
                     
                     console.log($('#pagingParam input').val());
                     $('#my-form-paging input').each(function(){
                        console.log($(this).attr('name')+"/"+$(this).val());
                     })
                     $('#my-form-paging').submit();
                     return false;
                  });
          });
      
      </script>

   <footer><jsp:include page="/WEB-INF/views/jsp/include/footer.jsp" /></footer>

</body>
</html>