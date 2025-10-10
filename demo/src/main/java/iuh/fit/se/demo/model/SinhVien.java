package iuh.fit.se.demo.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SinhVien {
    private String mssv;
    private String hoten;
    private String ngaysinh;
    private double diem;
    private Lopp lopp;
}