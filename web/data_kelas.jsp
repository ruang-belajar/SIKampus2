<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.Kelas" %>
<%
    List<Kelas> daftar = Kelas.getList();
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
        <ul>
            <% for (Kelas baris : daftar) {%>
            <li><a href="form_kelas.jsp?kode=<%=baris.kode%>&mode=baca"><%=baris.kode%></a></li>
            <% } %>
        </ul>
        
        <a href="form_kelas.jsp">Tambah Kelas</a>

    </body>
</html>
