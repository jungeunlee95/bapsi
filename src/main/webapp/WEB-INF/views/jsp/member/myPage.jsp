<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v4.8.1, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/css/assets/images/bapsi-logo31-1-134x134.png" type="image/x-icon">
  <meta name="description" content="Web Site Builder Description">
  <title>bapsi</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons-bold/mobirise-icons-bold.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/web/assets/mobirise-icons/mobirise-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/theme/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/assets/mobirise/css/mbr-additional.css" type="text/css">
  
  <script src="${pageContext.request.contextPath}/resources/css/assets/web/assets/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/popper/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/dropdown/js/script.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/touchswipe/jquery.touch-swipe.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/smoothscroll/smooth-scroll.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/assets/theme/js/script.js"></script>
<!--****************모달 창 이미지(팔로우한 사람, 좋아요한 사람)소스 링크및 스크립트**************************  -->   
<!--Bootstrap-->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!--Latest stable release of jQuery Core Library-->
<script src="https://code.jquery.com/jquery-1.12.2.min.js" integrity="sha256-lZFHibXzMHo3GGeehn1hudTAP3Sc0uKXBXAzHX1sjtk=" crossorigin="anonymous"></script> 
<!--Bootstrap JS-->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!--****************************************************************************************  -->
<script>
   if(${empty userVO}){
      alert("로그인이 필요합니다");
      location.href = "${pageContext.request.contextPath}/login";      
   } 
</script>

  <script>
     $(document).ready(function(){
    	 $('#changePassword').click(function(){
             if(confirm('비밀번호를 수정하시겠습니까?')){
                location.href = "${pageContext.request.contextPath}/changePassword"
             }
          });   
    	 
        $('#memberUpdate').click(function(){
           if(confirm('회원정보를 수정하시겠습니까?')){
              location.href = "${pageContext.request.contextPath}/mypage/update"
           }
        });
        

        $('#selfDelete').click(function(){
           if(confirm('정말로 탈퇴를 하시겠습니까?')){
              location.href = "${pageContext.request.contextPath}/selfdelete"
           }
        });
        
        $('#fileDelete').click(function(){
            if(confirm('프로필을 삭제 하시겠습니까?')){

               location.href = "${pageContext.request.contextPath}/fileDelete"
            }
         });
        
        
     });
  </script>

  <style type="text/css">
     #textModify{
        color: black;
       padding: 40px;
       text-align: center;
       font-size: large;
       color: #c12048;
     }
  </style>
  
</head>
<body>

   <header><jsp:include page = "/WEB-INF/views/jsp/include/topMenu.jsp" /></header>

   <section class="mbr-section form4 cid-r5i8KQIDUV" id="form4-21">

    

    
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                  <div class="mbr-figure">
                     <form action = "${pageContext.request.contextPath}/upload/uploadFile" enctype="multipart/form-data" method="post">
                         <c:choose>
                             <c:when test = "${empty upload.file_fakename}">
                           <img src="${pageContext.request.contextPath}/resources/images/Bapsi_logo.png"   alt="이미지를 불러올수 없습니다.">
                        </c:when>
                        <c:otherwise>
                           <img src="${pageContext.request.contextPath}/img/${upload.file_fakename}" style="width:435px; height:435px;"   alt="이미지를 불러올수 없습니다.">
                        </c:otherwise>
                     </c:choose>
                     
                     <c:choose>
                        <c:when test = "${empty upload.file_fakename}">
                           
                        </c:when>
                        <c:otherwise>
                           <input type = "button" id = "fileDelete" name = "fileDelete" value = "프로필 삭제">
                        </c:otherwise>
                     </c:choose>
                    </form>
                     <!--팔로우,좋아요  레시피 모달버튼  -->
                    <ul class="list-inline">
	                    <li data-toggle="modal" data-target="#myFollower"><button type="button" class="btn btn-outline-primary btn-lg" id="myBtn">팔로우한 레시피</button></li>
	                    <li data-toggle="modal" data-target="#myLike"><button type="button" class="btn btn-outline-danger btn-lg" id="myBtn">좋아요한 레시피</button></li>
	                    <li><a href="${pageContext.request.contextPath}/ranking/userPage?no=${userVO.no}&userNo=${userVO.no}"><button type="button" class="btn btn-outline-warning btn-lg" id="myBtn">  마이홈 가기    </button></a></li>
	                     
                  <!--end of thumbnails-->
                    </ul>
                 </div>
               </div>
    <!--****************************************************마이페이지 팔로우 모달 시작************************************************************  -->           
              <!--begin modal window-->
            <div class="modal fade" id="myFollower">
               <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                     <div class="modal-header">
                        <div class="pull-left">
                           <h2>안녕하세요</h2>
                           <h3 style="color: #c12048;">팔로우한 사람 레시피</h3>
                        </div>
                        <button type="button" class="close" data-dismiss="modal" title="Close">
                           <span class="glyphicon glyphicon-remove"></span>
                        </button>
                     </div>
                     <div class="modal-body">

                        <!--CAROUSEL CODE GOES HERE-->
                        <!--begin carousel-->
                        <div id="myGallery" class="carousel slide" data-interval="false">
                        <div class="carousel-inner">
                           <div class="item active">
                              <img src="${pageContext.request.contextPath}/resources/images/Bapsi_logo.png" alt="item0">
                              <br><br><br>
                              <div class="carousel-caption">
                                    <div id="textModify">${userVO.nickname}님의<br>팔로워 레시피</div>
                              </div>
                           </div>

                              
                                 <c:forEach items="${myPageRecipeProfile}" var="myPageRecipeProfile" varStatus="loop" >
                                    <div class="item">
                                    <a href="${pageContext.request.contextPath}/recipe/readPage?no=${myPageRecipeProfile.no}&userNo=${userVO.no}&click=1"><img src="${pageContext.request.contextPath}/imgR/${myPageRecipeProfile.file_fakename }" alt="item1"></a>
                                          <div class="carousel-caption">
                                             <h3>${myPageRecipeProfile.userNickName}</h3>
                                             <h3>${myPageRecipeProfile.recipeName}</h3>
                                             <p>글번호: ${myPageRecipeProfile.no}</p>
                                          </div>
                                    
                                    </div>
                                 </c:forEach>
                           
                  
                              <!--end carousel-inner-->
                           </div>
                           
                           <!--Begin Previous and Next buttons-->
                           <a class="left carousel-control" href="#myGallery"
                              role="button" data-slide="prev"> <span
                              class="glyphicon glyphicon-chevron-left"></span></a> <a
                              class="right carousel-control" href="#myGallery" role="button"
                              data-slide="next"> <span
                              class="glyphicon glyphicon-chevron-right"></span></a>
                           <!--end carousel-->
                        </div>
                        <!--end modal-body-->
                     </div>
                     <div class="modal-footer">
                        <button class="btn-sm close" type="button" data-dismiss="modal">Close</button>
                        <!--end modal-footer-->
                     </div>
                     <!--end modal-content-->
                  </div>
                  <!--end modal-dialoge-->
               </div>
               <!--end myModal-->
               
            </div>

            
<!--*****************************************팔로워모달 끝************************************************************* *********************** -->                      
 <!--****************************************************마이페이지 좋아요 모달 시작************************************************************  -->           
              <!--begin modal window-->
            <div class="modal fade" id="myLike">
               <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                     <div class="modal-header">
                        <div class="pull-left">
                           <h2>안녕하세요</h2>
                           <h3 style="color: #c12048;">좋아요한 사람 레시피</h3>
                        </div>
                        <button type="button" class="close" data-dismiss="modal" title="Close">
                           <span class="glyphicon glyphicon-remove"></span>
                        </button>
                     </div>
                     <div class="modal-body">

                        <!--CAROUSEL CODE GOES HERE-->
                        <!--begin carousel-->
                        <div id="myGallery2" class="carousel slide" data-interval="false">
                        <div class="carousel-inner">
                           <div class="item active">
                              <img src="${pageContext.request.contextPath}/resources/images/Bapsi_logo.png" alt="item0">
                              <br><br><br>
                              <div class="carousel-caption">
                                    <div id="textModify">${userVO.nickname}님의<br>좋아요 레시피</div>
                              </div>
                           </div>

                              
                                 <c:forEach items="${likeRecipe}" var="likeRecipe" varStatus="loop" >
                                    <div class="item">
                                    <a href="${pageContext.request.contextPath}/recipe/readPage?no=${likeRecipe.no}&userNo=${userVO.no}&click=1"><img src="${pageContext.request.contextPath}/imgR/${likeRecipe.file_fakename }" alt="item1"></a>
                                          <div class="carousel-caption">
                                             <h3>${likeRecipe.userNickName}</h3>
                                             <h3>${likeRecipe.recipeName}</h3>
                                             <p>글번호: ${likeRecipe.no}</p>
                                          </div>
                                    
                                    </div>
                                 </c:forEach>
                           
                  
                              <!--end carousel-inner-->
                           </div>
                           
                           <!--Begin Previous and Next buttons-->
                           <a class="left carousel-control" href="#myGallery2"
                              role="button" data-slide="prev"> <span
                              class="glyphicon glyphicon-chevron-left"></span></a> <a
                              class="right carousel-control" href="#myGallery2" role="button"
                              data-slide="next"> <span
                              class="glyphicon glyphicon-chevron-right"></span></a>
                           <!--end carousel-->
                        </div>
                        <!--end modal-body-->
                     </div>
                     <div class="modal-footer">
                        <button class="btn-sm close" type="button" data-dismiss="modal">Close</button>
                        <!--end modal-footer-->
                     </div>
                     <!--end modal-content-->
                  </div>
                  <!--end modal-dialoge-->
               </div>
               <!--end myModal-->
               
            </div>

            
<!--*****************************************모달 끝************************************************************* *********************** -->                      
 
 
            <div class="col-md-6">
                <h2 class="pb-3 align-left mbr-fonts-style display-2">마이 페이지</h2>
                <div>
                    <div class="icon-block pb-3">
                        <span class="icon-block__icon">
                            <span class="mbr-iconfont mbri-info"></span>
                        </span>
                        <h4 class="icon-block__title align-left mbr-fonts-style display-5">
                            회원님의 프로필 입니다.</h4>
                    </div>
                    
                </div>
                <div data-form-type="formoid">
                    
                    <form class="block mbr-form">
                        <div class="row">
                        
                           <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="회원번호" id="no" readonly="readonly" style = "text-align : center;">
                            </div>
                           <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="no" data-form-field="Email" placeholder="회원번호" id="no" value = "${member.no}" readonly="readonly">
                            </div>
                                                    
                           <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="아이디" id="email" readonly="readonly" style = "text-align : center;">
                            </div>
                           <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="email" data-form-field="Email" placeholder="이메일" id="email" value = "${member.email}" readonly="readonly">
                            </div>
                            
                            <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input"  data-form-field="Email" placeholder="이름" id="name" readonly="readonly" style = "text-align : center;">
                            </div>
                            <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="name" data-form-field="Email" placeholder="이름" id="name" value = "${member.name}" readonly="readonly">
                            </div>
                            
                             <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="성별" id="gender" readonly="readonly" style = "text-align : center;">
                            </div>
                           	 <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="gender" data-form-field="Email" placeholder="성별" id="gender" value = "${member.gender}" readonly="readonly">
                            </div>
                
                            
                            <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="나이대" id="age" readonly="readonly" style = "text-align : center;">
                            </div>
                            <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="age" data-form-field="Email" placeholder="나이대" id="age" value = "${member.age}" readonly="readonly">
                            </div>
                            
                            <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="닉네임" id="nickname" readonly="readonly" style = "text-align : center;">
                            </div>
                            <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="nickname" data-form-field="Email" placeholder="닉네임" id="nickname" value = "${member.nickname}" readonly="readonly">
                            </div>
                            
                            <div class="col-md-3" data-for="email">
                                <input type="text" class="form-control input" data-form-field="Email" placeholder="전화번호" id="tel" readonly="readonly" style = "text-align : center;">
                            </div>
                            <div class="col-md-9" data-for="email">
                                <input type="text" class="form-control input" name="tel" data-form-field="Email" placeholder="전화번호" id="tel" value = "${member.tel}" readonly="readonly">
                            </div>
                            
                            <div class="col-md-3" data-for="message">
                                <textarea class="form-control input" rows="3" data-form-field="Message" placeholder="소  개" style="resize:none; text-align : center;" id="comments" readonly="readonly"></textarea>
                            </div>
                            <div class="col-md-9" data-for="message">
                                <textarea class="form-control input" name="comments" rows="3" data-form-field="Message" placeholder="한 줄 자기소개" style="resize:none" id="comments" readonly="readonly">${member.comments}</textarea>
                            </div>
                            
                            <div class="input-group-btn col-md-12" style="margin-top: 15px;">
                     
								<input type="button" class="btn btn-form btn-secondary display-4" id = "changePassword" value="비밀번호변경">
					
                            <input type="button" class="btn btn-form btn-secondary display-4" id = "memberUpdate" value="정보 수정">
                            <input type="button" class="btn btn-form btn-secondary display-4" id = "selfDelete" value="회원 탈퇴">
                               <!-- <button href="" type="submit" class="btn btn-form btn-secondary display-4">회원정보 수정</button> -->
                               <!-- <input type="button" class="btn btn-secondary btn-form display-4" style="width:199px; padding-left:31px; padding-right:31px;"  id="checkNickname" value="회원정보 수정"> -->
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

   <footer><jsp:include page = "/WEB-INF/views/jsp/include/footer.jsp" /></footer>

</body>
</html>