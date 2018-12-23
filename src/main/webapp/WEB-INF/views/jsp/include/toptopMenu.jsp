<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  
<!-- 자도완성 기능 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/autocomplete/css/jquery-ui.css" type="text/css">

   

<script src="${pageContext.request.contextPath}/resources/css/assets/web/assets/jquery/jquery.min.js"></script>
<!-- 자동완성 기능 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/autocomplete/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/autocomplete/js/jquery-ui.js"></script>

<script src="${pageContext.request.contextPath}/resources/css/assets/popper/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/tether/tether.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/touchswipe/jquery.touch-swipe.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/parallax/jarallax.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/viewportchecker/jquery.viewportchecker.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/smoothscroll/smooth-scroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/dropdown/js/script.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/css/assets/theme/js/script.js"></script>
<!-- 드롭박스 추가  -->


<style>
   
   @media ( min-width :576px) {
      #extra {
         max-width: 920px;
         margin: 1.75rem auto
      }
      .modal-dialog-centered {
         min-height: calc(100% - ( 1.75rem * 2))
      }
      .modal-sm {
         max-width: 300px
      }
   }
   
   @media ( min-width :576px) {
      .whatIngredient {
         width:458px;
      }
   }
   
   
   .inner > li {
      padding:0;
   }
   
   .field1 {
      float:left;
   }
   
   .field1 > ul {
      border : 1px solid #a73f40;
      background-attachment: scroll;
      height:270px;
      overflow-x:hidden;
      overflow-y:visible;
      list-style:none;
      float:left;
   }
   
   .big_wrap {
      width:190px;
      padding:0;
      margin-right:9px;
   }
   
   .big_wrap > li {
      font-size:15px;
      border-bottom:1px solid #dddddd;
      padding-left:18px;
      cursor:pointer;
      
   }
   
   .big_wrap > li > a {
      line-height:44px;
      color:#565656;
   }
   
   .IngredientSearch {
      
      margin-bottom : 9px;
   }
   
   .small_wrap {
      width:396px;
      padding:0;
      margin-right:9px;
      box-sizing:border-box;
   }
   
   .small_wrap > li {
      font-size:15px;
      border-bottom:1px solid #dddddd;
      padding-left:18px;
      cursor:pointer;
   }
   
   .small_wrap > li > a {
      line-height:44px;
      color:#565656;
   }
   
   .whatIngredient{
        background-color: #f5f5f5; 
        line-height: 1.43; 
        padding: 1.07em .5em; 
        border: 1px solid #e8e8e8; 
        border-radius: .25rem; 
        color: #565656; 
     }
  
     .search2{
        background-color: #c12048 !important;
        border-color: #c12048 !important; 
        color: #ffffff !important; 
        line-height: 1.43;
        padding: 1.07em .5em; 
        padding: 1rem 3rem; 
        border-radius: .25rem;
        cursor: pointer;
        letter-spacing: 1px; 
        border: 1px solid transparent;
     }
     
     .field2 {
        width:280px;
        float:right;
     }
     
     .field2 > dl {
        border:1px solid #a73f40;
        background:#fff;
        position:relative;
        
     }
     
     .field2 > dl > dt {
        height:59px;
        color:#565656;
        font-size:20px;
        padding:10px 15px;
        box-sizing:border-box;
        border-bottom:1px solid #dddddd;
        text-align: center;
     }
     
     .field2 > dl > dd {
        height:268px;
        box-sizing : border-box;
     }
     
     .field2 > dl > dd > ul {
        list-style:none;
        height:205px;
        padding:12px 0;
        overflow-x:hidden;
        overflow-y:visible;
        box-sizing:border-box;
     }
     
     .field2 > dl > dd > ul > li.select_Ingredients {
        float:none;
        font-size:17px;
        color:#b7b7b7;
        text-align:center;
        /* margin-top:80px; */
        padding:0;
     }
     
     .field2 > dl > dd > .btn {
        position:absolute;
        left:0;
        right:0;
        bottom:0;
        padding:12px 16px;
        background-color:#fff;
     }
     
     .field2 > dl > dd > .btn > button {
        width:194px;
        height:48px;
        background-color: #c12048 !important;
        border-color: #c12048 !important; 
        color: #ffffff !important;
        line-height: 1.43;
        border-radius: .25rem;
        cursor: pointer;
        letter-spacing: 1px; 
        border: 1px solid transparent;
     }
     
    #head {
      display: inline;
      text-align:center;
      -webkit-box-align: start;
      -ms-flex-align: start;
      align-items: flex-start;
      -webkit-box-pack: justify;
      -ms-flex-pack: justify;
      justify-content: space-between;
      padding: 1rem;
      border-bottom: 1px solid #e9ecef;
      border-top-left-radius: .3rem;
      border-top-right-radius: .3rem
   }
   
    div.topads{
      background-color:#c12048;
      height:70px;
      text-align:center;
      position: relative;
      line-height:70px;
      color:#fff;
      cursor:pointer;
      margin-bottom:10px;
   }
   
   
   	.ui-autocomplete {
      max-height: 200px;
      overflow-y: auto;
      overflow-x: hidden;
      padding-right: 20px;
  }
   
 
</style>

<script>

	// 자동완성기능을 위함
    var availableTags = [];
    // 선택한 재료이름
    var selectIngredientsName=[];
    // 선택하고 넘길때 각 재료의 넘버를 넘기기 위해서
    var selectIngredientsNo=[];
    
 $(function(){
    $('#btnRecommend').click(function(){
    	
    	if(selectIngredientsName.length == 0){
    		alert('재료를 선택해주시길 바랍니다.');
    	} else {
    		$('#select_go').children('input[type="hidden"]').remove();
    		console.log(selectIngredientsNo);
    	       var param='';
    	       for(var i=0;i<selectIngredientsNo.length; i++){
    	          param += '<input type="hidden" name="ingNo" value="'+selectIngredientsNo[i]+'">';
    	       }
    	       $('#select_go').append(param);
    	       $('#select_go').submit();
    	}
       return false;
    });
    
    // 재료 이름 입력해서 추가하기
    $('#search2').bind('click',function(){
          console.log($(this).val());
          var searched = $('#thisIngredients').val();
          var selectIngredientsNameInsert = "";
          var findExistIngredientNo=-1;
          // 입력한 내용이 선택한 재료 목록에 있는지 찾기
          $.each($('.ingredientsName'), function(){
             if($(this).text() == searched){
              findExistIngredientNo = $(this).siblings('input').val();
             }
          })
          
          // 쌩뚱맞은 재료 입력했는지 검사
          if(findExistIngredientNo>0){
          	if(selectIngredientsName.indexOf(searched) == -1){
          		selectIngredientsName.push(searched);
             	selectIngredientsNo.push(findExistIngredientNo);
             	selectIngredientsNameInsert += '<div class="topads" title="클릭하면 지워집니다."><input type="hidden" class="topads-no" value="'+findExistIngredientNo+'">'+searched+'</div>';
             
           		if($("#select_Ingredients").text() == '재료를 선택해주세요.') {
               		console.log('재료를 선택해주세요 없앰')
               		$("#select_Ingredients").html("");
           		}
           		$("#select_Ingredients").append(selectIngredientsNameInsert);
              
              // 담기 누르면 text 초기화
           		$('#thisIngredients').val('');

           	}else{
              alert("이미 선택한 재료입니다.");
           	}
          }else{
             alert('없는 재료입니다.');
          }
         return false;
       });
    
    	// 엔터 누르면 오른쪽으로 가게
    		$('#thisIngredients').keypress(function (e) {
                if(e.which == 13){
                   $(this).blur();
                   $('#search2').focus().click();
                }
             });
    
        // 전체 타입 얻어오기
        $.ajax({
               url:"${pageContext.request.contextPath}/ingredientsType",
               method:"get",
               success:function(ingredientsTypeList){
                  var ingredientsTypeInsert = "";
                  $.each(ingredientsTypeList, function(i, type){
                     ingredientsTypeInsert += '<li><a class="ingredientsType" href="#">'+type+'</a></li>';
                  })
                  
                  $("#big_wrap").html(ingredientsTypeInsert);   
                  
                  // 타입을 클릭하면 해당 타입의 재료 얻어와서 보여주기
                  $('.ingredientsType').bind('click', function(){
                     ajaxIngredientsName($(this).text());
                     return false;
                  }); 
                  
               }
         })
            
         // 전체 재료 얻어오기
         ajaxIngredientsName(null);
            
         $('#Modals').on('shown.bs.modal',function(){
               $( "#thisIngredients" ).autocomplete({
                   source: availableTags
                 },'appendTo','#Modals');
         })
         
         $('#Modals').on('hidden.bs.modal', function (e) {
            console.log('modal close');
            $("#select_Ingredients").html("");
            selectIngredientsName = [];
            var newStartInsert = "";
            newStartInsert += '<li class="select_Ingredients" id = "select_Ingredients">재료를 선택해주세요.</li>';
            $("#select_Ingredients").html(newStartInsert);
         });
         
      // 클릭하면 슬라이드로 사라지게
         $(document).on('click','.topads',function(){
               var cancel = $(this).text();
               var cancelNo = $(this).children('input').val();
               console.log('before22:'+selectIngredientsName);
               $(this).slideUp("slow");
               selectIngredientsName.splice($.inArray(cancel, selectIngredientsName),1);
               selectIngredientsNo.splice($.inArray(cancelNo, selectIngredientsNo),1);
               console.log('after:'+selectIngredientsName);
               return false;
          });
});
   
    
    
    
    function ajaxIngredientsName(Type){
       
       $.ajax({
             url:"${pageContext.request.contextPath}/ingredientsName",
             method:"get",
             data:{"Type":Type},
             success:function(ingredientsNameList){
                    var ingredientsNameInsert = "";
                   	availableTags = [];
                    $.each(ingredientsNameList, function(i, ingVO){
                       	availableTags.push(ingVO['ingName']);
                        ingredientsNameInsert += '<li><a class="ingredientsName" href="#">'+ingVO['ingName']+'</a><input type="hidden" value="'+ingVO['ingNo']+'"></li>';
                    })
                      
                    $("#small_wrap").html(ingredientsNameInsert);
   
                    $('.ingredientsName').on('click', function(){
                       var selectedIngNo = $(this).siblings('input').val();
                        var selected = $(this).text();
                        var selectIngredientsNameInsert = "";
                        if(selectIngredientsName.indexOf(selected) == -1){
                           selectIngredientsName.push(selected);
                           selectIngredientsNo.push(selectedIngNo);
                           selectIngredientsNameInsert += '<div class="topads" title="클릭하면 지워집니다."><input type="hidden" class="topads-no" value="'+selectedIngNo+'">'+$(this).text()+'</div>';
                           
                           if($("#select_Ingredients").text() == '재료를 선택해주세요.') {

                               $("#select_Ingredients").html("");
                           }
                           
                           $("#select_Ingredients").append(selectIngredientsNameInsert);
                           
                        }else{
                           alert("이미 선택한 재료입니다.");
                        }
                        
                        return false;
                      });
                          
                     
                    
                }
          })
    }
    
    
       
</script>


</head>
<body>

<div class="modal fade" id="Modals">
  <div class="modal-dialog" id="extra">
    <div class="modal-content">
      <div class="modal-header" id = "head"><h2 style="color:#c12048;">내가 가진 재료로 레시피 추천받자!</h2></div>
      <div class="modal-body">
      <section class="recomand">
         <div class="inner">
              <fieldset class="field1">
                 <div class="IngredientSearch ui-front">
                    <label for="thisIngredients"></label>
                 <input class="whatIngredient" id="thisIngredients" placeholder = "재료명으로 검색해보세요"/>
                 <input type="button" class="search2" id="search2" value="담기" />
                 </div>
           <ul class="big_wrap" id="big_wrap">

           </ul>
                       
           <ul class="small_wrap" id="small_wrap">

           </ul>
                 </fieldset>
    <form class="mbr-form" id = "select_go" action="${pageContext.request.contextPath}/bapsi" method="get" data-form-title="Mobirise Form">
       <fieldset class="field2">
        <dl>
           <dt>
              <h3>내가 선택한 재료</h3>
           </dt>
           <dd>
              <ul>
                 <li class="select_Ingredients" id = "select_Ingredients">재료를 선택해주세요.</li>
              </ul>
              <div class = "btn">
                 <button id="btnRecommend">이 재료로 추천받기</button>
              </div>
           </dd>
        </dl>
       </fieldset>
     </form>
   </div>
  </section>
 </div>
</div>
</div>
</div>

   <section class="menu cid-r4OiAWAZRu" once="menu" id="menu2-0">



      <nav
         class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">
         <button class="navbar-toggler navbar-toggler-right" type="button"
            data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <div class="hamburger">
               <span></span> <span></span> <span></span> <span></span>
            </div>
         </button>
         <div class="menu-logo">
            <div class="navbar-brand">
               <span class="navbar-logo"> <a
                  href="${pageContext.request.contextPath}"> <img
                     src="${pageContext.request.contextPath}/resources/css/assets/images/bapsi-logo31-1-134x134.png"
                     alt="Mobirise" title="" style="height: 5.9rem;">
               </a>
               </span> <span class="navbar-caption-wrap"><a
                  class="navbar-caption text-secondary display-4"
                  href="${pageContext.request.contextPath}">Bapsi</a></span>
            </div>
         </div>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <c:if test="${not empty userVO}">
               <b style="color: red">${userVO.nickname}(${userVO.email})</b>님 환영합니다.
                 </c:if>

            <ul class="navbar-nav nav-dropdown nav-right"
               data-app-modern-menu="true">
               <li class="nav-item"><a
                  class="nav-link link text-black display-5"
                  href="#" data-toggle="modal" data-target="#Modals"><span
                     class="mbrib-smile-face mbr-iconfont mbr-iconfont-btn" title="있는 재료로 추천받기"><br><span style="font-size:10px;">재료 추천</span></span></a></li>
               <li class="nav-item"><a
                  class="nav-link link text-black display-5" href="${pageContext.request.contextPath}/recipe/new"><span
                     class="mbri-plus mbr-iconfont mbr-iconfont-btn" title="내 레시피 등록하기"><br><span style="font-size:10px;">레시피 등록</span></span></a></li>
               <li class="nav-item dropdown open"><a
                  class="nav-link link text-black dropdown-toggle display-5" href=""
                  data-toggle="dropdown-submenu" aria-expanded="true"><span
                     class="mbri-users mbr-iconfont mbr-iconfont-btn"></span></a>
                  <div class="dropdown-menu">
                     <c:choose>
                        <c:when test="${empty userVO}">
                           <a class="text-black dropdown-item display-5"
                              href="${pageContext.request.contextPath}/login">로그인</a>
                        </c:when>
                        <c:when test="${0 ne userVO.socialLogin}">
                           <a class="text-black dropdown-item display-5"
                              href="${pageContext.request.contextPath}/logout">로그아웃</a>
                           <!--                               href="#" onclick='signOut()'>로그아웃</a> -->
                           <a class="text-black dropdown-item display-5"
                              href="${pageContext.request.contextPath}/mypage"
                              aria-expanded="false">마이페이지</a>
                        </c:when>
                        <c:otherwise>
                           <a class="text-black dropdown-item display-5"
                              href="${pageContext.request.contextPath}/logout">로그아웃</a>
                           <!--                               href="#" onclick='signOut()'>로그아웃</a> -->
                           <a class="text-black dropdown-item display-5"
                              href="${pageContext.request.contextPath}/mypage"
                              aria-expanded="false">마이페이지</a>
                        </c:otherwise>
                     </c:choose>
                     <c:if test="${userVO.type == 'S'}">
                        <a class="text-black dropdown-item display-5"
                           href="${pageContext.request.contextPath}/list"
                           aria-expanded="false">회원목록</a>
                     </c:if>
                  </div></li>
            </ul>

         </div>
      </nav>
   </section>
   
   
   </body>
   

</html>