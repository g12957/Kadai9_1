<%@ page 
import="com.google.appengine.api.users.*" 
pageEncoding="utf-8"
contentType="text/html;charset=utf-8"
language="java"
%>
<%
User user = (User)session.getAttribute("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>PizzaShop</title>
    <script type="text/javascript" src="lib.js"></script>
    <script type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style media="screen and (min-device-width:481px)" >
#site-box{
background-color: #F5D0A9;
 border: 1px solid #000000;
 margin : 5px auto;
 width:752px;
 border: 1px solid #000000;
 margin : 5px auto;
 
 }
#left-box{
 float: left;
 width: 200px;
          background-color: #F5D0A9;
}
#right-box{
 float: right;
 width: 550px;
  background-color: #FFFFFF;
}

#footer-box{
 clear: both;
 width: 732px;
 clear : both ;
}
.ca {
          display:block;
 padding: 10px;
 margin: 10px;
         text-align: center;
         font-style: italic;
         font-weight: bold;
 background-color: #FFFFFF;
}
.paa{
 margin : 0pt 0pt 10pt 10pt;
}
</style>
  </head>
          <meta http-equiv="Content-Type"
            content="text/html; charset=utf-8">
  <body onload="getData(null);" bgcolor="#ffffff" text="#000000" link="#61380B" vlink="#61380B" alink="#61380B">
<div id="site-box"><div id="header-box">
<br>
<br>
<h1>Pizza Shop</h1>
</div><div id="left-box"><center>
<span class="ca"><a href="index.html">top</a></span>
<span class="ca"><a href="menu.html">menu</a></span>
<span class="ca"><a href="order.jsp">order</a></span>
<span class="ca"><a href="history.html">history</a></span>
<span class="ca"><a href="private.jsp">login</a></span>
<span class="ca"><a href="/logout">logout</a></span>

</center></div>
<div id="right-box" style="background-image: url('flower5.jpg')">
<div class="pa">
      <h2>login</h2><br>
      <center>
        <div>ログインされました</div>
        <div style="font-weight: bold;">ユーザー：<%=user.getNickname() %></div>
        <br>
</div></div><div id="footer-box">
</div></div>    
</center>  
  </body>
</html>