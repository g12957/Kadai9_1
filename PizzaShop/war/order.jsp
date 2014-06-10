<%@ page 
import="com.google.appengine.api.users.*" 
pageEncoding="utf-8"
contentType="text/html;charset=utf-8"
language="java"
%>
<%
UserService us = UserServiceFactory.getUserService();
User user = us.getCurrentUser();

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
  <body onload="getData(null);" bgcolor="#ffffff" text="#000000" link="#61380B" vlink="#61380B" alink="#61380B">
<div id="site-box"><div id="header-box">
<br>
<br>
<h1>Pizza Shop</h1>
</div><div id="left-box"><center>
<span class="ca"><a href="index.html">top</a></span>
<span class="ca"><a href="menu.html">menu</a></span>
<span class="ca"><a href="order.html">order</a></span>
<span class="ca"><a href="history.html">history</a></span>
<span class="ca"><a href="private.jsp">login</a></span>
<span class="ca"><a href="/logout">logout</a></span>

</center></div>
<div id="right-box" style="background-image: url('flower5.jpg')">
<div class="pa">
      <h2>order</h2><br>
      <center>
        <table>
        <form method="post" action="/add">
        <% if(user == null){ %>
        	ログインしてください。
<%        }
          else { %>  <tr><th>氏名:</th><td><input type="text" name="title"></td></tr>
            <tr><th>住所:</th><td><input type="text" name="address"></td></tr>
            <tr><th>電話番号:</th><td><input type="text" name="phone"></td></tr>
            <tr><th>メールアドレス:</th><td><%=user.getEmail() %></td></tr>
            <tr><th>注文:</th><td><textarea name="comment"></textarea></td></tr>
            <tr><th></th><td><input type="submit" value="注文 & 確認メールを送る"></td></tr>
       <%} %> </form>
        </table>
        </center>
        <p>注文の欄にあなたの注文したいピザの名前、枚数を書き込んでください</p>
</div></div><div id="footer-box">
</div></div>    
  </body>
</html>