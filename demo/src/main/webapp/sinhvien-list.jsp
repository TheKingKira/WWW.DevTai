<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.List,iuh.fit.se.demo.model.SinhVien" %>
<!DOCTYPE html>
<html>
<head><title>Danh sách sinh viên</title></head>
<body>
<table>
    <thead>
    <tr>
        <th>MSSV</th><th>Họ tên</th><th>Ngày sinh</th><th>Điểm</th><th>Lớp</th>
    </tr>
    </thead>
    <tbody>
    <%
        // LẤY DỮ LIỆU TỪ ATTRIBUTE
        List<SinhVien> ds = (List<SinhVien>) request.getAttribute("sinhviens");
        if (ds != null) {
            for (SinhVien sv : ds) {
    %>
    <tr>
        <td><%= sv.getMssv() %></td>
        <td><%= sv.getHoten() %></td>
        <td><%= sv.getNgaysinh() %></td>
        <td><%= sv.getDiem() %></td>
        <td><%= sv.getLopp() != null ? sv.getLopp().getTenlop() : "" %></td>
    </tr>
    <%
            } // end for
        } // end if
    %>
    </tbody>
</table>
</body>
</html>
