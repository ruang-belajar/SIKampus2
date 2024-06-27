/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package kampus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author En Tay
 */
public class Peserta {

    public String kelasKode;
    public String nim;
    public Double kehadiran;
    public Double tugas;
    public Double ujian;
    private String mahasiswaNama;
    protected String errMsg = "";

    public Peserta() {
        kelasKode = "";
        nim = "";
        kehadiran = 0.0;
        tugas = 0.0;
        ujian = 0.0;
    }

    public boolean baca(String kelasKode, String nim) {
        Connection connection = null;
        ResultSet rs = null;

        try {
            connection = DatabaseTest.connect();

            if (!connection.isClosed()) {
                // 1. sesuaikan string SQL
                String sql = "SELECT kelasKode, nim, nama, kehadiran, tugas, ujian"
                        + " FROM peserta "
                        + " inner join mahasiswa on peserta.nim=mahasiswa.nim"
                        + " where kelasKode=? and nim=?";
                PreparedStatement st = connection.prepareStatement(sql);

                // 2. sesuaikan parameter
                st.setString(1, kelasKode);
                st.setString(2, nim);
                rs = st.executeQuery();

                if (rs.next()) {
                    //3. isi property dengan data yang dibaca dari database
                    this.kelasKode = rs.getString("kelasKode");
                    this.nim = rs.getString("nim");
                    this.mahasiswaNama = rs.getString("nama");
                    this.kehadiran = Double.valueOf(rs.getString("kehadiran"));
                    this.tugas = Double.valueOf(rs.getString("tugas"));
                    this.ujian = Double.valueOf(rs.getString("ujian"));

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
                String sql = "INSERT INTO peserta (kelasKode,nim,kehadiran,tugas,ujian) values (?,?,?,?,?)";
                PreparedStatement st = connection.prepareStatement(sql);

                // 2. sesuaikan parameter
                st.setString(1, this.kelasKode);
                st.setString(2, this.nim);
                st.setDouble(3, this.kehadiran);
                st.setDouble(4, this.tugas);
                st.setDouble(5, this.ujian);

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
                String sql = "UPDATE peserta SET kehadiran=?, tugas=?, ujian=? WHERE kelasKode=? and nim=?";
                PreparedStatement st = connection.prepareStatement(sql);

                // 2. sesuaikan parameter
                st.setDouble(1, this.kehadiran);
                st.setDouble(2, this.tugas);
                st.setDouble(3, this.ujian);
                st.setString(4, this.kelasKode);
                st.setString(5, this.nim);

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
    
    public String getMahasiswaNama() {
        return this.mahasiswaNama;
    }

    public static List<Peserta> getList(String kelasKode) {
        List<Peserta> result = new ArrayList<>();

        Connection connection = null;
        ResultSet rs = null;

        try {
            connection = DatabaseTest.connect();

            if (!connection.isClosed()) {
                // prepare select statement
                String sql = "SELECT * FROM peserta where kelasKode=?";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, kelasKode);
                rs = st.executeQuery();

                while (rs.next()) {
                    Peserta obj = new Peserta();
                    obj.kelasKode = rs.getString("kelasKode");
                    obj.nim = rs.getString("nim");
                    obj.kehadiran = rs.getDouble("kehadiran");
                    obj.tugas = rs.getDouble("tugas");
                    obj.ujian = rs.getDouble("ujian");
                    result.add(obj);
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