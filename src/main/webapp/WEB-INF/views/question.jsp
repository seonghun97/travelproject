

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resource/css/title.css">
<link rel="stylesheet" href="/resource/css/content.css">
 
  


<title>후기 / 문의 게시판</title>
</head>
<body>
    <center>
      <%@ include file="include/header.jsp" %>

       <div>
         <table boader ="0" cellspacing ="10" width="70%" >
   	<tr>
   	 <td class="contentbox">
   	   <table border="0" cellspacing="20">
   	   	<form action="questionOk" method="post">
   	   	   <tr>
   	   	      <td class="content_text" >질문내용 :</td>
   	   	       <td><textarea class="textareabox" rows="100" cols="100" name="boardcontent"></textarea></td>
   	           </tr>
   	           <tr>
		  	       <td colspan="2" align="right">
		          <input class = "content_btn01" type="submit" value="수정">&nbsp;&nbsp;
		  		  <input class = "content_btn01" type="button" value="삭제" onclick="script:window.location.href='index'"> 
		  		  
		  		  
		  		
		       </td>
		      </tr>
   	        </form>
   	      </table>
         </tr>
   	   </table>
     </div>
   </center>
  <%@ include file="include/footer.jsp" %>


  </body>
</html>