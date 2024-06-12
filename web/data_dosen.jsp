<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.Dosen" %>
<%
    List<Dosen> daftar = Dosen.getList();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Dosen</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body>
        <table class="table">
            <thead>
                <tr>
                    <th>NID</th>
                    <th>Nama</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <% for (Dosen row : daftar) {%>
                <tr>
                    <td><%=row.nid%></td>
                    <td><%=row.nama%></td>
                    <td><a href="form_dosen.jsp?mode=baca&nid=<%=row.nid%>">edit</a></td>
                </tr>
                <% }%>
            </tbody>
        </table>
        <a href="form_dosen.jsp" class="btn btn-primary">Tambah</a> - 
        <a href="index.jsp" class="btn btn-info">Kembali ke halaman depan</a>
    </body>
</html>
