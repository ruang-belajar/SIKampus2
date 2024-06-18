<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.User" %>
<%@page import="java.time.LocalDateTime" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%
    String nama = "Budi";
    LocalDateTime sekarang = LocalDateTime.now();
    DateTimeFormatter cetakTanggal = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    User user = new User();

    // check session var "id", kalau tidak kosong berarti baca sebagai id user
    if (session.getAttribute("id") != null) {
        String id = (String) session.getAttribute("id");
        user.baca(id, "DOSEN");  // semenntara, semua logi diaggap sebagai login dosen
        
        
        
    } else { // kalau sessio var "id" kosong, redirect ke halama login
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Beranda: SI Kampus</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>

    <body>
        <div class="p-2 mb-2 text-center" style="background-color: lightgray">
            Halo, <%=user.getNama()%> <a href="logout.jsp">logout</a> - <%= cetakTanggal.format(sekarang) %>
        </div>
        <div class="text-center">
            <a href="data_mahasiswa.jsp" class="btn btn-primary">Mahasiswa</a>
            <a href="data_kelas.jsp" class="btn btn-primary">Kelas</a>
            <a href="data_matakuliah.jsp" class="btn btn-info">Mata Kuliah</a>
            <a href="data_dosen.jsp" class="btn btn-info">Dosen</a>
            <a href="data_user.jsp" class="btn btn-warning">User</a>
        </div>
        <div class="text-center">
            <img src="image/logo.png" style="width:300px">
        </div>
    </body>
</html>
