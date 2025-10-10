package iuh.fit.se.testgk.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Album {
    private String id;
    private String ma;
    private String ten;
    private double gia;
    private Date nph;
    private String tt;
    private String mota;
    private TheLoai tentl;
}
