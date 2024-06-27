<%@page import="kampus.Peserta" %>
<%
    String kode = request.getParameter("kode");
    String nim = request.getParameter("nim");
    
    Peserta p = new Peserta();
    p.kelasKode = kode;
    p.nim = nim;
    p.tambah();

    response.sendRedirect("form_kelas.jsp?mode=baca&kode="+kode);
%>