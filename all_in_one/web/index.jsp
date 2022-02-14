<%--
  Created by IntelliJ IDEA.
  User: buzz
  Date: 2022/2/10
  Time: 11:34
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>都是书</title>
    <style>
      a{
        /*删除超链接文本下面的线*/
        text-decoration: none;
        /*设置超链接的字体颜色*/
        color: black;
        /*字体大小*/
        font-size: 20px;
      }
      div{
        width: 100px;
        height: 40px;
        /*居中*/
        margin: 100px auto;
        /*文字居中显示*/
        text-align: center;
        /*背景颜色*/
        background-color: darkgrey;
        line-height: 40px;
        /*圆角边框*/
        border-radius: 5px;
      }
    </style>
  </head>
  <body>
  <div>
    <a href="${pageContext.request.contextPath}/book/all-book">所有的书</a>
  </div>

  </body>
</html>
