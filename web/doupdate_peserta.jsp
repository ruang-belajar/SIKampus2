<%@page import="kampus.Peserta" %>
<%
    // baca informasi yang dikirimkan dari form
    String kelasKode = request.getParameter("kelasKode");
    String nim = request.getParameter("nim");
    Double kehadiran = Double.valueOf(request.getParameter("kehadiran"));
    Double tugas = Double.valueOf(request.getParameter("tugas"));
    Double ujian = Double.valueOf(request.getParameter("ujian"));

    // update data lewat class Peserta
    Peserta peserta = new Peserta();
    peserta.baca(kelasKode, nim);
    peserta.kehadiran = kehadiran;
    peserta.tugas = tugas;
    peserta.ujian = ujian;
    peserta.update();

    // kembali ke form_kelas.jsp
    response.sendRedirect("form_kelas.jsp?mode=baca&kode=" + kelasKode);
%>