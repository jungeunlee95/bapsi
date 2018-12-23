<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon"
   href="${pageContext.request.contextPath}/resources/css/assets/images/bapsi-logo31-1-134x134.png"
   type="image/x-icon">

<title>bapsi</title>

<!---Font Icon
<link
   href="${pageContext.request.contextPath}/resources/writeRecipe/css/font-awesome.min.css"
   rel="stylesheet">-->

<!-- CSS -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
<link
   href="${pageContext.request.contextPath}/resources/writeRecipe/css/bootstrap.min.css"
   rel="stylesheet">
<link
   href="${pageContext.request.contextPath}/resources/writeRecipe/css/styles.min.css"
   rel="stylesheet">
<!-- <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet"> -->
<link href="${pageContext.request.contextPath}/resources/summernote/summernote.css" rel="stylesheet">
<link
   href="${pageContext.request.contextPath}/resources/writeRecipe/css/select2.min.css"
   rel="stylesheet">

<!-- Favicon -->
<!-- 
<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="favicon.ico" />
 -->
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<!-- summernote -->
<!-- <script src = "http://code.jquery.com/jquery-latest.min.js"></script> -->
<!-- include libraries(jQuery, bootstrap) -->


<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js" defer></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/summernote/summernote.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/summernote/summernote.min.js"></script>
 <!-- summer note korean language pack -->
<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script> 
<script>
if( ${empty userVO} ){
   alert("로그인이 필요합니다");
   location.href = "${pageContext.request.contextPath}/login";      
} 
</script> 
<script type="text/javascript">
$(document).ready(function() {
   $(document).ready(function() {
       $(".js-search-category").select2({
           maximumSelectionLength: 1,
           placeholder: "재료를 선택하세요"
       });
       $(".btn-light").click(function() {
           $('select').select2('destroy');
           var selectorParant = $('#append').html();
           $('#sortable').append('<div class="box ui-sortable-handle">' + selectorParant + '</div>');
           $(".js-search-category, .js-search-category2").select2();
           $(".js-search-category").select2({
               maximumSelectionLength: 1,
               placeholder: "재료를 선택하세요"
           });
       });
       $("#sortable").on("click", ".minusbtn", function() {
           $(this).parent().parent().parent().remove()
       })
   });   
   /////////////////////////////////////
   
    $('#my-summernote').summernote({
      height: 600,
      minHeight: null,
      maxHeight: null,
//       lang: 'ko-KR',
      placeholder: '조리과정을 입력하세요',
      callbacks: {
        onImageUpload: function(files, editor, welEditable) {
          for (var i = files.length - 1; i >= 0; i--) {
//              alert('test1');
            sendFile(files[i], this);
          }
        }
      },
      popover:{
         image:[],
         link:[],
         air:[]
      },
      tooltip:false
//       toolbar:[
//          ['para',['ul']]
//       ],
//       focus:true,
//       onInit : function(){
//          $('.note-editor [data-name="ul"]').tooltip('disable');
//       }
    });
    $('.dropdown-toggle').dropdown();
  });
//    $(function(){
//       $(".modal-dialog").dialog({
//          autoOpen: false,
//          modal: true
//       });
      
//       $("#btn-show-modal").on("click", function(e){
//          e.preventDefault();
//          $(".modal-dialog").dialog("open");
// //          return false;
//       })
//          $('#summernote').summernote({
//               height: 300,
//               minHeight: null,
//               maxHeight: null,
//               lang: 'ko-KR',
//               placeholder: '조리과정을 입력하세요',
//               callbacks: {
//                 onImageUpload: function(files, editor, welEditable) {
//                   for (var i = files.length - 1; i >= 0; i--) {
// //                      alert('test1');
//                     sendFile(files[i], this);
//                   }
//                 }
//               }
//             });
//    })
</script>
</head>
<body>
   <!-- topMenu -->
   <header class="navbar-fixed-top"><jsp:include page = "/WEB-INF/views/jsp/include/toptopMenu.jsp" /></header>

<br><br><br><br><br>
    <!-- 레시피 작성 -->
    <div class="submit">
        <div class="title">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>나만의 레시피 등록하기</h2>
                    </div>
                </div>
            </div>
        </div>
      <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                  <form:form method="post" commandName="recipeVO" name="wForm"
                     onsubmit="return doWrite()" enctype="multipart/form-data">
                     <hr>
                     <div class="content">
                        <div class="container">
                           <div class="row">
                              <div class="col-lg-12">
                                 <article>
                                    <h2 id="statuss"><strong>대표 사진 등록하기</strong></h2>
                                    <br><br>
                                    <p>
                                       <input type="file" name="file" id="inputPhoto" accept=".gif, .jpg, .png" class="file"/>
                                       
                                    </p>
                                    <p></p>
                                    <div id="holder"></div>
                                 </article>
<!--★★★★★★★★★★파일 미리보기 띄우기 ★★★★★★★★★★★★★★★★★★-->
<script>
var upload = document.getElementById('inputPhoto'),
    holder = document.getElementById('holder'),
    state = document.getElementById('statuss');

if (typeof window.FileReader === 'undefined') {
  state.className = 'fail';
} else {
  state.className = 'success';
}
 
upload.onchange = function (e) {
  e.preventDefault();

  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;
    // note: no onload required since we've got the dataurl...I think! :)
   // holder width
      img.width = 338;

 // holder height
        img.height = 300;

    
    holder.innerHTML = '';
    holder.appendChild(img);
  };
  reader.readAsDataURL(file);

  return false;
};
</script>
                              </div>
                           </div>
                        </div>
                     </div>
                     <hr>
                     <div class="form-group">
                        <br><h2>제목</h2><br>
                        <form:input type="text" path="title"
                           placeholder="레시피의 제목을 입력하세요" class="form-control" />
                        <form:errors path="title" />
                     </div>

                     <div class="form-group">
                        <h2>한줄 설명</h2><br>
                        <form:input type="text" path="subTitle"
                           placeholder="레시피를 설명할 수 있는 한줄설명을 입력하세요" class="form-control" />
                        <form:errors path="subTitle" />
                     </div>

                     <div class="form-group">
                        <h2>음식이름</h2><br>
                        <form:input type="text" path="recipeName"
                           placeholder="음식명을 입력하세요" class="form-control" />
                        <form:errors path="recipeName" />
                     </div>


                     <div class="form-group">
                        <h2>레시피 정보</h2><br>
                        <!-- summernote -->
                        <form:textarea path="content" id="my-summernote" name="content" />
                        <form:errors path="content" />
                        <!-- Modal 
<a data-toggle="modal"  href="${pageContext.request.contextPath}/summernote" data-target="#modal-testNew" role="button" data-backdrop="static">
 <span class="btn btn-xs btn-success" id="btn-show-modal" data-toggle="modal">테스트 등록</span>
</a>
<div id="modal-testNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="테스트정보 등록" aria-describedby="테스트 모달">
    <div class="modal-dialog">
        <div class="modal-content">
           <!-- call이 되는 영역 -->
                        <%--            <jsp:include page="summernote.jsp"/> --%>
                        <!--        </div>
    </div>
</div>
-->
                     </div>

                     <div class="form-group">
                        <h2>추가 정보</h2><br>
                        <hr>
                     </div>
                     <div class="form-group row">
                        <h2 class="col-sm-2 col-form-label">조리분량</h2><br>
                        <div class="col-sm-10">
                           <form:input type="number" path="servings" placeholder="조리분량"
                              min="0" class="form-control" />
                           인분
                           <form:errors path="servings" />
                        </div>
                     </div>

                     <div class="form-group row">
                        <h2 class="col-sm-2 col-form-label">조리시간</h2><br>
                        <div class="col-sm-10">
                           조리시간 총
                           <form:input type="number" path="time" placeholder="조리시간"
                              min="0" class="form-control" />
                           분 소요
                           <form:errors path="time" />
                        </div>
                     </div>
                     <div class="form-group row">
                        <h2 class="col-sm-2 col-form-label">금액</h2><br>
                        <div class="col-sm-10">
                           <form:input type="number" path="cost" placeholder="금액" min="0"
                              pattern="[0-9]+([,\.][0-9]+)?" class="form-control" />
                           원 소요
                           <form:errors path="cost" />
                        </div>
                     </div>


                     <div class="form-group">
                        <h2>재료정보</h2><br>

                        <div id="sortable">
                           <c:forEach var="i" begin="0" end="1">
                              <div class="box ui-sortable-handle">
                                 <div class="row">
                                    <div class="col-lg-1 col-sm-1">
                                       <i class="mbri-up-down mbr-iconfont mbr-iconfont-btn"
                                          aria-hidden="true"></i>
                                    </div>
                                    <div class="col-lg-5 col-sm-5">
                                       <form:select path="rIngList"
                                          class="js-search-category form-control select2-hidden-accessible"
                                          name="category" aria-hidden="true">
                                          <c:forEach items="${ ingList }" var="ing" varStatus="loop">
                                             <form:option path="rIngList" value="${ing.ingNo}"
                                                label="${ing.ingName}" />
                                             <form:errors path="rIngList" />
                                          </c:forEach>
                                       </form:select>
                                    </div>
                                    <div class="col-lg-5 col-sm-5">
                                       <form:input type="text" path="amountList"
                                          class="form-control" placeholder="분량(예. 1포기)" />
                                       <form:errors path="amountList" />
                                    </div>
                                    <div class="col-lg-1 col-sm-1">
                                       <i
                                          class="fa fa-times-circle-o minusbtn socicon socicon-macos mbr-iconfont mbr-iconfont-btn"
                                          aria-hidden="true"></i>
                                    </div>
                                 </div>
                              </div>
                           </c:forEach>

                        </div>

                        <a href="#sortable" class="btn btn-light">재료 추가하기</a>
                     </div>



                     <div class="form-group">
                        <h2>레시피 태그 정보</h2><br>
                        <hr>
                     </div>

                     <div class="form-group">
                        <h2 class="col-sm-2 col-form-label">태그카테고리</h2><br>
                        <div class="col-sm-10">

                           <c:forEach items="${ tagList }" var="tag" varStatus="loop">
                              <form:checkbox path="rTagList" value="${tag.tagNo}"
                                 label="${tag.tagName}" />
                              <form:errors path="rTagList" />
                           </c:forEach>

                        </div>
                     </div>

                     <form:input type="hidden" path="userNo" name="loginUserNo"
                        id="writer" value="${userVO.no}" />
                     <form:input type="hidden" path="userNickName" name="loginUserNo"
                        id="writer" value="${userVO.nickname}" />

                     <div aria-hidden="true">
                        <div class="box ui-sortable-handle" id="append">
                           <div class="row">
                              <div class="col-lg-1 col-sm-1">
                                 <i class="mbri-up-down mbr-iconfont mbr-iconfont-btn"
                                    aria-hidden="true"></i>
                              </div>
                              <div class="col-lg-5 col-sm-5">
                                 <form:select path="rIngList"
                                    class="js-search-category form-control select2-hidden-accessible"
                                    name="category" aria-hidden="true">
                                    <c:forEach items="${ ingList }" var="ing" varStatus="loop">
                                       <form:option path="rIngList" value="${ing.ingNo}"
                                          label="${ing.ingName}" />
                                       <form:errors path="rIngList" />
                                    </c:forEach>
                                 </form:select>
                              </div>
                              <div class="col-lg-5 col-sm-5">
                                 <form:input type="text" path="amountList" name="amountList"
                                    class="form-control" placeholder="분량(예. 1포기)" />
                                 <form:errors path="amountList" />
                              </div>
                              <div class="col-lg-1 col-sm-1">
                                 <i
                                    class="fa fa-times-circle-o minusbtn socicon socicon-macos mbr-iconfont mbr-iconfont-btn"
                                    aria-hidden="true"></i>
                              </div>
                           </div>
                        </div>
                     </div>

                     <input type="submit" value="등록하기" class="btn btn-submit">
                  </form:form>


               </div>
            </div>
         </div>
      </div>
   </div>

   <!-- footer -->
   <jsp:include page="/WEB-INF/views/jsp/include/footerfooter.jsp" />

   <!-- Javascript -->
   <script
      src="${pageContext.request.contextPath}/resources/writeRecipe/js/plugins/jquery.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/writeRecipe/js/plugins/popper.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/writeRecipe/js/plugins/bootstrap.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/writeRecipe/js/plugins/select2.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/writeRecipe/js/plugins/jquery-ui.js"></script>

</body>
<script>
   $(document).ready(function() {
      
      $("#append").hide();
   });
   
   function isNull(obj, msg) {
      if(obj.value == '') {
         alert(msg);
         obj.focus();
         return true;
      }
      return false;
   } 
   
   function doWrite() {
      var w = document.wForm;

      
      var fileNm = $("#inputPhoto").val();
      if(fileNm == ''){
           alert('대표 사진을 등록해주세요');
           $("#inputPhoto").focus();
          return false;   
     }
      
      var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
      if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
           alert("대표 사진은 (.jpg, .png, .gif )만 업로드 가능합니다.");
           $("#inputPhoto").focus();
           return false;
      }

      if(isNull(w.title, '제목을 입력하세요')) {
         return false;
      }
      if(isNull(w.subTitle, '한줄설명을 입력하세요')) {
         return false;
      }
      if(isNull(w.recipeName, '음식명을 입력하세요')) {
         return false;
      }
      if(isNull(w.content, '조리과정을 등록하세요')) {
         return false;
      }
      if(isNull(w.servings, '조리분량을 입력하세요')) {
         return false;
      }
      if(isNull(w.time, '조리시간을 입력하세요')) {
         return false;
      }
       if(isNull(w.cost, '금액을 입력하세요')) {
         return false;
      }
      return true;
   }

</script>
<!-- summernote -->
<script type="text/javascript">
//     $(document).ready(function() {
//       $('#summernote').summernote({
//         height: 300,
//         minHeight: null,
//         maxHeight: null,
//         lang: 'ko-KR',
//         placeholder: '조리과정을 입력하세요',
//         callbacks: {
//           onImageUpload: function(files, editor, welEditable) {
//             for (var i = files.length - 1; i >= 0; i--) {
// //                alert('test1');
//               sendFile(files[i], this);
//             }
//           }
//         }
//       });
//     });
    
    function sendFile(file, el) {
      var form_data = new FormData();
      form_data.append('recipeImg', file);
      $.ajax({
        data: form_data,
        type: "POST",
        url: '${pageContext.request.contextPath}/recipe/insertImg',
        cache: false,
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        success: function(url) {
//            alert('test2:'+url);
          $(el).summernote('editor.insertImage', '${pageContext.request.contextPath}/'+url);
//           alert('test3:'+url);
          $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
        },
        error:function(){
           alert('ajax error');
        }
      });
    }
</script>
</html>



