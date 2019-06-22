package DaoImpl;

import Dao.DaoHelper;
import Dao.DiscountDao;
import Entity.Discount;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class DiscountDaoImpl implements DiscountDao {
    private static DaoHelper daoHelper = DaoHelperImpl.getBaseDaoInstance();
    private boolean success=true,fail=true;
    @Override
    public ArrayList<Discount> GetRestaurantDiscount(String Chaptcha) throws Exception {
        Connection con=null;
        PreparedStatement stmt=null;
        PreparedStatement stmt1=null;
        ResultSet result=null;
        ResultSet result1=null;
        ArrayList<Discount> discounts= new ArrayList<Discount>();
        ArrayList<Discount> Discounts= new ArrayList<Discount>();
        String Result;
        int FullPrice,MinusPrice;
        int y,m,d;
        String date;
        Calendar cal= Calendar.getInstance();
        y=cal.get(Calendar.YEAR);
        m=cal.get(Calendar.MONTH)+1;
        d=cal.get(Calendar.DATE);
        date=""+y+"-"+m+"-"+d;
        try {
            con = daoHelper.getConnection();
            stmt=con.prepareStatement("Select * From Discount Where ResChaptcha = '"+Chaptcha+"'and Result='success';");
            result=stmt.executeQuery();
            while(result.next()){
                Discount discount=new Discount();
                int id = result.getInt("DiscountID");
                FullPrice = result.getInt("FullPrice");
                MinusPrice = result.getInt("MinusPrice");
                Result = result.getString("Result");
                discount.setFull(FullPrice);
                discount.setMinus(MinusPrice);
                discount.setResult(Result+"-"+String.valueOf(id));
                Discounts.add(discount);
                Discounts.add(discount);
                //比较时间
                /*stmt1=con.prepareStatement("Select * From DiscountTime Where DiscountID = '"+result.getInt("DiscountID")+"';");
                result1=stmt1.executeQuery();
                while(result1.next()) {

                    java.util.Date starttime = new java.util.Date(result1.getTimestamp("StartTime").getTime());
                    java.util.Date endtime = new java.util.Date(result1.getTimestamp("EndTime").getTime());
                    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                    java.util.Calendar c = java.util.Calendar.getInstance();
                    java.text.SimpleDateFormat f = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                    System.out.println(f.format(c.getTime()));
                    try {
                        Date current = df.parse(date);
                        System.out.println(current);
                        System.out.println(current.getTime());
                        System.out.println(starttime.getTime());
                        System.out.println(current.getTime() <= endtime.getTime());
                        if (current.getTime() <= endtime.getTime() && current.getTime() >= starttime.getTime()) {

                            //System.out.println("FullPrice:"+result.getInt("FullPrice"));
                            //System.out.println("MinusPrice:"+result.getInt("MinusPrice"));
                            //System.out.println("Result:"+result.getString("Result"));*/

                            /*java.util.Date StartTime=new java.util.Date(result1.getTimestamp("StartTime").getTime());
                            java.util.Date EndTime=new java.util.Date(result1.getTimestamp("EndTime").getTime());*/

                            /*discount.setStartTime(result1.getString("StartTime"));
                            discount.setEndTime(result1.getString("EndTime"));
                        }
                    } catch (Exception exception) {
                        exception.printStackTrace();
                    }
                }*/
            }
            /*if(Discounts.size()>1) {
                for (int i = 0; i < Discounts.size(); i++) {
                    for (int j = 0; j < Discounts.size()-1;j++){
                        if(Discounts.get(j).getFull()>Discounts.get(j+1).getFull()){
                            int full=Discounts.get(j).getFull();
                            int minus=Discounts.get(j).getMinus();
                            Discounts.get(j).setFull(Discounts.get(j+1).getFull());
                            Discounts.get(j).setMinus(Discounts.get(j+1).getMinus());
                            Discounts.get(j+1).setFull(full);
                            Discounts.get(j+1).setMinus(minus);
                        }
                    }
                }
                /*
                for (int i = 0; i < Discounts.size(); i++) {
                    System.out.println(Discounts.get(i).getFull());
                    System.out.println(Discounts.get(i).getMinus());
                }

            }*/
            daoHelper.closeConnection(con);
            daoHelper.closePreparedStatement(stmt);
            daoHelper.closeResult(result);

        } catch (SQLException e) {
            daoHelper.closeConnection(con);
            daoHelper.closePreparedStatement(stmt);
            daoHelper.closeResult(result);
            e.printStackTrace();
        }
        /*
        System.out.println(discounts.get(0).getFull());
        System.out.println(discounts.get(0).getMinus());
        System.out.println(discounts.get(0).getResult());
        System.out.println(discounts.get(1).getFull());
        System.out.println(discounts.get(1).getMinus());
        System.out.println(discounts.get(1).getResult());
        */
        return Discounts;
    }

    @Override
    public ArrayList<String> AddRestaurantDiscount(String FullPrice, String MinusPrice,String chaptcha,String StartTime,String EndTime) throws Exception, SQLException {
        //检查是否有重复的
        //没有重复的插入，返回
        int y,m,d;
        String date;
        Calendar cal= Calendar.getInstance();
        y=cal.get(Calendar.YEAR);
        m=cal.get(Calendar.MONTH)+1;
        d=cal.get(Calendar.DATE);
        date=""+y+"-"+m+"-"+d;
        System.out.println("StartTime:"+StartTime);
        System.out.println("EndTime:"+EndTime);
        Connection con = null;
        PreparedStatement stmt = null;
        PreparedStatement stmt1 = null;
        con = daoHelper.getConnection();
        ResultSet result=null;
        ResultSet result1=null;
        boolean exist=false;
        int add=0;
        boolean add1=false;
        int DiscountID=0,TimeID=0;
       ArrayList<String> Result=new ArrayList<>();
        try {
            con=daoHelper.getConnection();
            stmt=con.prepareStatement("select * from Discount where ResChaptcha = '"+chaptcha+"'");
            result=stmt.executeQuery();
            while(result.next()){
                String full=result.getInt("FullPrice")+"";
                System.out.println(full);
                String minus=result.getInt("MinusPrice")+"";
                if(FullPrice.equals(full)) {
                    Result.add(FullPrice);
                    //判断已存在的优惠是否在有效期内
                    stmt1 = con.prepareStatement("select * from DiscountTime where DiscountID = '" + result.getInt("DiscountID") + "'");
                    result1 = stmt1.executeQuery();
                    while (result1.next()) {
                        java.util.Date starttime = new java.util.Date(result1.getTimestamp("StartTime").getTime());
                        java.util.Date endtime = new java.util.Date(result1.getTimestamp("EndTime").getTime());
                        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                        java.util.Calendar c = java.util.Calendar.getInstance();
                        java.text.SimpleDateFormat f = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                        System.out.println(f.format(c.getTime()));
                        Date current = df.parse(date);
                        System.out.println(current);
                        System.out.println(current.getTime());
                        System.out.println(starttime.getTime());
                        System.out.println(current.getTime() <= endtime.getTime());
                        if (current.getTime() <= endtime.getTime() && current.getTime() >= starttime.getTime()) {
                            exist=true;
                            break;
                        }
                    }
                }else{
                }
            }
            if(!exist){
                //插入数据
                stmt=con.prepareStatement("select Max(DiscountID) from Discount");
                result=stmt.executeQuery();
                while(result.next()){
                    DiscountID=result.getInt("Max(DiscountID)");
                    DiscountID=DiscountID+1;
                }
                //stmt=con.prepareStatement("select Max(ID) from DiscountTime");
                //result=stmt.executeQuery();
                /*while(result.next()){
                    TimeID=result.getInt("Max(ID)");
                    TimeID=TimeID+1;
                    System.out.println("TimeID:"+TimeID);
                }*/
                stmt=con.prepareStatement("insert into Discount(DiscountID,ResChaptcha,FullPrice,MinusPrice,Result) VALUES ("+DiscountID+",'"+chaptcha+"',"+Integer.parseInt(FullPrice)+","+Integer.parseInt(MinusPrice)+",'success')");
                add=stmt.executeUpdate();
                //stmt1=con.prepareStatement("insert into DiscountTime(ID,DiscountID,StartTime,EndTime) VALUES ("+TimeID+",'"+DiscountID+"','"+StartTime+"','"+EndTime+"')");
                //add1=stmt1.execute();
                if(add == 0){
                    Result.add("fail");
                }else{
                    Result.add("success"+"-"+String.valueOf(DiscountID));
                }
            }
            daoHelper.closeConnection(con);
            daoHelper.closePreparedStatement(stmt);
        } catch (SQLException e) {
            daoHelper.closeConnection(con);
            daoHelper.closePreparedStatement(stmt);
            e.printStackTrace();
        }
        return Result;
    }

    @Override
    public ArrayList<Discount> CheckDiscount() throws Exception {
        Connection con=null;
        PreparedStatement stmt=null;
        ResultSet result=null;
        Discount discount=new Discount();
        ArrayList<Discount> discounts=new ArrayList<>();
        String chaptcha,ID;
        int full,minus;
        try {
            con = daoHelper.getConnection();
            stmt=con.prepareStatement("Select * From Discount Where Result = 'doing'");
            result=stmt.executeQuery();
            while(result.next()) {
                ID=result.getString("DiscountID");
                chaptcha=result.getString("ResChaptcha");
                full=result.getInt("FullPrice");
                minus=result.getInt("MinusPrice");
                discount.setMinus(minus);
                discount.setFull(full);
                discount.setChaptcha(chaptcha);
                discounts.add(discount);
            }
            daoHelper.closeConnection(con);
            daoHelper.closePreparedStatement(stmt);
            daoHelper.closeResult(result);

        } catch (SQLException e) {
            daoHelper.closeConnection(con);
            daoHelper.closePreparedStatement(stmt);
            daoHelper.closeResult(result);
            e.printStackTrace();
        }

                return discounts;
    }

    @Override
    public boolean SuccessDiscount(int fullprice, int minusprice, String chaptcha,int ID) throws Exception {
        Connection con = null;
        PreparedStatement stmt = null;
        try {
            con = daoHelper.getConnection();
            stmt = con.prepareStatement("update Discount SET Result ='success' WHERE DiscountID = " + ID + ";");
            success = stmt.execute();
            daoHelper.closeConnection(con);
            daoHelper.closePreparedStatement(stmt);
        } catch (SQLException e) {
            daoHelper.closeConnection(con);
            daoHelper.closePreparedStatement(stmt);
            e.printStackTrace();
        }
        return success;
    }

    @Override
    public boolean FailDiscount(int fullprice, int minusprice, String chaptcha,int ID) throws Exception {
        Connection con = null;
        PreparedStatement stmt = null;
        try {
            con = daoHelper.getConnection();
            stmt = con.prepareStatement("update Discount SET Result ='fail' WHERE DiscountID = " + ID + ";");
            fail = stmt.execute();
            daoHelper.closeConnection(con);
            daoHelper.closePreparedStatement(stmt);
        } catch (SQLException e) {
            daoHelper.closeConnection(con);
            daoHelper.closePreparedStatement(stmt);
            e.printStackTrace();
        }
        return fail;
    }

    @Override
    public boolean DeleteDiscount(String chaptcha,int full,int minus)throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        boolean delete=true;
        System.out.println(chaptcha);
        System.out.println(full);
        System.out.println(minus);
        while(chaptcha.length()<7){
            chaptcha="0"+chaptcha;
        }
        try {
            con = daoHelper.getConnection();
            stmt = con.prepareStatement("delete from Discount WHERE ResChaptcha = '" + chaptcha + "' and FullPrice = "+full+" and MinusPrice = "+minus+";");
            delete = stmt.execute();
            daoHelper.closeConnection(con);
            daoHelper.closePreparedStatement(stmt);
        } catch (SQLException e) {
            daoHelper.closeConnection(con);
            daoHelper.closePreparedStatement(stmt);
            e.printStackTrace();
    }
        return delete;
    }

    @Override
    public ArrayList<Discount> GetFailRestaurantDiscount(String Chaptcha) throws Exception{
        Connection con=null;
        PreparedStatement stmt=null;
        ResultSet result=null;

        ArrayList<Discount> discounts=new ArrayList<>();

        try {
            con = daoHelper.getConnection();
            stmt=con.prepareStatement("Select * From Discount Where ResChaptcha = '"+Chaptcha+"' and Result = 'fail'");
            result=stmt.executeQuery();
            while(result.next()) {
                Discount discount=new Discount();
                String ID=result.getString("DiscountID");
                System.out.println(ID);
                String chaptcha=result.getString("ResChaptcha");
                int full=result.getInt("FullPrice");
                int minus=result.getInt("MinusPrice");
                discount.setMinus(minus);
                discount.setFull(full);
                discount.setChaptcha(chaptcha);
                discount.setResult("fail"+"-"+ID);
                discounts.add(discount);
            }

        } catch (SQLException e) {
            daoHelper.closeConnection(con);
            daoHelper.closePreparedStatement(stmt);
            daoHelper.closeResult(result);
            e.printStackTrace();
        }

        return discounts;
    }

    @Override
    public String putOnSale(int id) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        int res = 0;
        try {
            con = daoHelper.getConnection();
            stmt = con.prepareStatement("update Discount SET Result ='success' WHERE DiscountID = " + id + ";");
            res = stmt.executeUpdate();
            daoHelper.closeConnection(con);
            daoHelper.closePreparedStatement(stmt);
        } catch (SQLException e) {
            daoHelper.closeConnection(con);
            daoHelper.closePreparedStatement(stmt);
            e.printStackTrace();
        }
        if(res == 0){
            return "fail";
        }
        else{
            return "success";
        }
    }

    @Override
    public String putOffSale(int id) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        int res = 0;
        try {
            con = daoHelper.getConnection();
            stmt = con.prepareStatement("update Discount SET Result ='fail' WHERE DiscountID = " + id + ";");
            res = stmt.executeUpdate();
            daoHelper.closeConnection(con);
            daoHelper.closePreparedStatement(stmt);
        } catch (SQLException e) {
            daoHelper.closeConnection(con);
            daoHelper.closePreparedStatement(stmt);
            e.printStackTrace();
        }
        if(res == 0){
            return "fail";
        }
        else{
            return "success";
        }
    }
}
