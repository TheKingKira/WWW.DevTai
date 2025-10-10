<%@ page import="iuh.fit.se.testgk.model.Album" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: phant
  Date: 10/3/2025
  Time: 5:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>phantai</title>
</head>
<body>
<table>
    <thead>
    <tr>
        <th>Id</th><th>Ma</th><th>Ten</th><th>NPH</th><th>TenTL</th><th>Tt</th>
    </tr>
    </thead>
    <tbody>
    <%
        // LẤY DỮ LIỆU TỪ ATTRIBUTE
        List<Album> ds = (List<Album>) request.getAttribute("albums");
        if (ds != null) {
            for (Album ab : ds) {
    %>
    <tr>
        <td><%= ab.getId() %></td>
        <td><%= ab.getMa() %></td>
        <td><%= ab.getTen() %></td>
        <td><%= ab.getNph() %></td>
        <td><%= ab.getTentl()%></td>
        <td><%= "1".equals(ab.getTt()) ? "đã phát hành" : "chưa phát hành" %></td>

    </tr>
    <%
            } // end for
        } // end if
    %>
    </tbody>
</table>
</body>
</html>
