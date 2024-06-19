package kampus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Kelas {
    public String kode;
    public String dosenNid;
    public String status;
    private String errMsg = "";

    public Kelas() {
        this.kode = "";
        this.dosenNid = "";
        this.status = "AKTIF";
    }

    public boolean baca(String nid) {
        Connection connection = null;
        ResultSet rs = null;

        try {
            connection = DatabaseTest.connect();

            if (!connection.isClosed()) {
                // 1. sesuaikan string SQL
                String sql = "SELECT * FROM kelas where kode=?";
                PreparedStatement st = connection.prepareStatement(sql);

                // 2. sesuaikan parameter
                st.setString(1, nid);
                rs = st.executeQuery();

                if (rs.next()) {
                    //3. isi property dengan data yang dibaca dari database
                    this.kode = rs.getString("kode");
                    this.dosenNid = rs.getString("dosenNid");
                    this.status = rs.getString("status");
                    connection.close();
                    return true; // menandakan data ditemukan
                }
            }
            return false; // menandakan koneksi error/data tidak ditemukan
        } catch (Exception ex) {
            this.errMsg = ex.toString();
            return false; // menandakan data tidak ditemukan/error
        }
    }

    public boolean tambah() {
        Connection connection = null;

        try {
            connection = DatabaseTest.connect();

            if (!connection.isClosed()) {
                // 1. sesuaikan string SQL
                String sql = "INSERT INTO kelas (kode,dosenNid,status) values (?,?,?)";
                PreparedStatement st = connection.prepareStatement(sql);

                // 2. sesuaikan parameter
                st.setString(1, this.kode);
                st.setString(2, this.dosenNid);
                st.setString(3, this.status);
                st.executeUpdate();
                connection.close();
                return true; // menandakan kalau operasi INSERT berhasil
            } else {
                return false; // menandakan kalau operasi GAGAL
            }
        } catch (Exception ex) {
            //System.out.println(ex.toString());
            this.errMsg = ex.toString();

            return false; // menandakan kalau operasi GAGAL
        }
    }

    public boolean update() {
        Connection connection = null;
        try {
            connection = DatabaseTest.connect();

            if (!connection.isClosed()) {
                // 1. sesuaikan string SQL
                String sql = "UPDATE kelas SET dosenNid=?, status=? WHERE kode=?";
                PreparedStatement st = connection.prepareStatement(sql);

                // 2. sesuaikan parameter
                st.setString(1, this.dosenNid);
                st.setString(2, this.status);
                st.setString(3, this.kode);

                st.executeUpdate();
                connection.close();
                return true; // menandakan kalau operasi UPDATE BERHASIL
            } else {
                return false; // menandakan kalau operasi GAGAL
            }
        } catch (Exception ex) {
            //System.out.println(ex.toString());
            this.errMsg = ex.toString();
            return false; // menandakan kalau operasi GAGAL
        }
    }
    
    public static List<Kelas> getList() {
        List<Kelas> result = new ArrayList<>();
        
        Connection connection = null;
        ResultSet rs = null;

        try {
            connection = DatabaseTest.connect();

            if (!connection.isClosed()) {
                // prepare select statement
                String sql = "SELECT * FROM kelas";
                PreparedStatement st = connection.prepareStatement(sql);
                rs = st.executeQuery();

                while (rs.next()) {
                    Kelas k = new Kelas();
                    k.kode = rs.getString("kode");
                    k.dosenNid = rs.getString("dosenNid");
                    k.status  = rs.getString("status");
                    result.add(k);
                }
                
            }
            return result;
        } catch (Exception ex) {
            return null;
        }
    }

    public String getErrMsg() {
        return this.errMsg;
    }
}