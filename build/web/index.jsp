<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.User" %>
<%
    String nama = "Budi";
    User user = new User();
    if(session.getAttribute("id")!=null) {
        String id=(String)session.getAttribute("id");  
        user.baca(id, "DOSEN");        
    } else {
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
        Halo, <%=user.getNama()%> <a href="logout.jsp">logout</a>
        <ul>
            <li><a href="data_mahasiswa.jsp" class="btn btn-primary">Mahasiswa</a></li>
            <li><a href="data_dosen.jsp" class="btn btn-info">Dosen</a></li>
            <li><a href="data_user.jsp" class="btn btn-warning">User</a></li>

        </ul>
    </body>
</html>
