/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Minhm
 */
public class Tracking extends DBContext {

    public DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    public LocalDate now = LocalDate.now();

    public void updateToday(List<hold> a) {
        String sql = "UPDATE [dbo].[tracking]\n"
                + "   SET [num] = ?\n"
                + "      ,[lastUpdate] = ?\n"
                + " WHERE no_day = ?";
        try {
            for (hold f : a) {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, f.num);
                ps.setString(2, f.date);
                ps.setInt(3, f.day_no);
                ps.execute();
            }
        } catch (Exception ex) {

        }
    }

    public void setTodayTracking(int num) {
        String sql = "UPDATE [dbo].[tracking]\n"
                + "   SET [num] = ?\n"
                + "      ,[lastUpdate] = ?\n"
                + " WHERE no_day = 1";



        List<hold> Hold = isOK();


     

        if (now.isAfter(LocalDate.parse(Hold.get(0).date, dtf))) {
            for (int i = Hold.size() - 1; i >= 1; i--) {
                Hold.set(i, Hold.get(i - 1));
            }
            Hold.set(0, new hold(1, num, now.format(dtf)));
            for (int i = 1; i <= 7; i++) {
                Hold.get(i-1).day_no = i;
            }
            updateToday(Hold);
            return;
        } else {
            if (Hold.get(0).num < num) {
                try {
                    PreparedStatement ps = connection.prepareStatement(sql);
                    ps.setInt(1, num);
                    ps.setString(2, now.format(dtf));
                    ps.execute();
                } catch (Exception ex) {
                    System.out.println(ex.getLocalizedMessage());
                }
            }
        }

//        switch (hold) {
//            case 1: {
//                try {
//                    PreparedStatement ps = connection.prepareStatement(sql);
//                    ps.setInt(1, num);
//                    ps.setString(2, now.format(dtf));
//                    ps.execute();
//                } catch (Exception ex) {
//
//                }
//                break;
//            }
//            case 2: {
//                try {
//                    PreparedStatement ps = connection.prepareStatement(sql);
//                    ps.setInt(1, num);
//                    ps.setString(2, now.format(dtf));
//                    ps.execute();
//                } catch (Exception ex) {
//
//                }
//                break;
//            }
//            case 3: {
//                return;
//            }
//        }
    }

    class hold {

        int day_no;
        int num;
        String date;

        public hold(int day_no, int num, String date) {
            this.day_no = day_no;
            this.num = num;
            this.date = date;
        }

    }

    public List<hold> isOK() {
        List<hold> a = new ArrayList<>();
        String sql = "select * from tracking";
        String olddate = "";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a.add(new hold(rs.getInt("no_day"), rs.getInt("num"), rs.getString("lastUpdate")));
            }
        } catch (Exception ex) {

        }
        return a;
    }

    public int isITOK(int num) {
        String sql = "select * from tracking\n"
                + "where no_day = ?";
        String olddate = "";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                olddate += rs.getString("lastUpdate");
                System.out.println(olddate);
                if (now.isAfter(LocalDate.parse(olddate, dtf))) {
                    System.out.println(olddate);
                    System.out.println(now.format(dtf));
                    return 1;
                } else {
                    if (rs.getInt("num") < num) {
                        return 2;
                    }
                }
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return 3;
    }

    public List<Integer> getALL() {
        List<Integer> a = new ArrayList<>();
        String sql = "select * from tracking";
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            int i = 0;
            while (rs.next()) {
                a.add(rs.getInt("num"));
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return a;
    }

    public static void main(String[] args) {
        Tracking a = new Tracking();
        List<hold> v = a.isOK();
        for (hold t : v) {
            System.out.println(t.date + "   ");
        }
    }
}
