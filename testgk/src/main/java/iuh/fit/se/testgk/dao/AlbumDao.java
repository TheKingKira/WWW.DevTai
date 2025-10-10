package iuh.fit.se.testgk.dao;

import iuh.fit.se.testgk.model.Album;
import iuh.fit.se.testgk.model.TheLoai;
import iuh.fit.se.testgk.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AlbumDao {
    public List<Album> findAll(){
        List<Album> list = new ArrayList<Album>();
        String sql = "select al.id, al.ma, al.tenal, al.gia, al.nph,  al.tt, al.mota, tl.ten, tl.matheloai from album al join theloai tl on al.tentl = tl.ten";
        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                ){
            while(rs.next()){
                TheLoai tl = new TheLoai(rs.getString("ten"), rs.getString("matheloai"));
                list.add(new Album(
                        rs.getString("id"),
                        rs.getString("ma"),
                        rs.getString("tenal"),
                        rs.getDouble("gia"),
                        rs.getDate("nph"),
                        rs.getString("tt"),
                        rs.getString("mota"),
                        tl
                ));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    };
}
