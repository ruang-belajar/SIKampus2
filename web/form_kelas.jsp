<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kampus.Kelas" %>
<%@page import="kampus.Peserta" %>

<%
    String hasil = "";
    Kelas kelas = new Kelas();
    List<Peserta> daftarPeserta = new ArrayList<Peserta>();

    String mode = request.getParameter("mode");
    if (mode == null) {
        mode = "insert";
    } else if (mode.equals("insert")) { // operasi INSERT
        kelas.kode = request.getParameter("kode");
        kelas.dosenNid = request.getParameter("dosenNid");
        kelas.status = request.getParameter("status");
        mode = "update";
        hasil = "Berhasil ditambahkan";
    } else if (mode.equals("update")) {
        kelas.baca(request.getParameter("kode"));
        kelas.kode = request.getParameter("kode");
        kelas.dosenNid = request.getParameter("dosenNid");
        kelas.status = request.getParameter("status");
        kelas.update();
        mode = "update";
        hasil = "Berhasil disimpan";
    } else if (mode.equals("baca")) {
        mode = "update";
        kelas.baca(request.getParameter("kode"));
    }

    // kalau kode tidak kosong, maka tampilk
    if (!kelas.kode.equals("")) {
        daftarPeserta = Peserta.getList(kelas.kode);
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form Kelas</title>
    </head>
    <body>
        <h1>Form Kelas</h1>
        <form action="form_kelas.jsp" method="post" >
            <input value="<%=mode%>" name="mode">
            Kode: <input name="kode" value="<%=kelas.kode%>">
            Dosen : <input name="dosenNid" value="<%=kelas.dosenNid%>"><br>
            Status: <input name="status" value="<%=kelas.status%>"><br>

            <button type="submit">Simpan</button>
        </form>
        <a href="index.jsp" class="btn btn-warning">Kembali ke halaman depan</a>

        <%=hasil%>
        <%=kelas.getErrMsg()%>

        <hr>
        
        <form action="dotambah_peserta.jsp" method="post">
            Tambah Peserta Kelas:
            <input name="kode">
            <input name="nim">
            <button type="submit">Tambah Peserta</button
        </form>

        <hr>
        
        <% if (daftarPeserta!=null) { %>
            <h3>Daftar Peserta</h3>

            <table>
                <tr>
                    <th>NIM</th>
                    <th>Nama</th>
                    <th>Kehadiran</th>
                    <th>Tugas</th>
                    <th>Ujian</th>
                    <th></th>
                </tr>
            <% for (Peserta baris : daftarPeserta) {%>
                <%-- setiap baris/peserta dibuat form --%>
                <form action="doupdate_peserta.jsp?kelasKode=<%=kelas.kode%>" method="post">
                    <tr>
                        <td><input name="nim" value="<%=baris.nim%>" readonly></td> <%-- readonly, karena form ini tidak akan update nim --%>
                        <td><%=baris.getMahasiswaNama()%></td> <%-- nama hanya untuk keterangan --%>
                        <td><input name="kehadiran" value="<%=baris.kehadiran%>"></td>
                        <td><input name="tugas" value="<%=baris.tugas%>"></td>
                        <td><input name="ujian" value="<%=baris.ujian%>"></td>
                        <td><button type="submit">update</button></th>
                    </tr>
                </form>
            <% } %>
            </table>
        <% }%>
    </body>
</html>
