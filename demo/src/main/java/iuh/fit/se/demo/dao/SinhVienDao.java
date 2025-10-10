package iuh.fit.se.demo.dao;

import iuh.fit.se.demo.model.Lopp;
import iuh.fit.se.demo.model.SinhVien;
import iuh.fit.se.demo.until.DBUntil;
import org.glassfish.jersey.client.HttpUrlConnectorProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SinhVienDao {
    public List<SinhVien> findAll(){
        List<SinhVien> list = new ArrayList<SinhVien>();
        String sql = "select sv.mssv, sv.hoten, sv.ngaysinh, sv.diem, l.malop, l.tenlop FROM sinhvien sv JOIN lop l ON sv.lopp = l.malop";
        try (
                Connection conn = DBUntil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()
                ) {
            while (rs.next()) {
                Lopp lop = new Lopp(rs.getString("malop"), rs.getString("tenlop"));
                list.add(new SinhVien(
                        rs.getString("mssv"),
                        rs.getString("hoten"),
                        rs.getString("ngaysinh"),
                        rs.getDouble("diem"),
                        lop
                ));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return  list;
    }
}
