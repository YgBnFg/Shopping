package webtier;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.NEW;

import util.Chinese;
import util.DBConnector;
import dao.GoodsDAO;
import domain.Goods;
import domain.Userinfo;


public class GoodsController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  
		this.doPost(request, response);

	} 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		switch (Integer.parseInt(request.getParameter("flag"))) {
		case 0:
			getAll(request, response);
			break;
		case 1:
			changeGoods(request,response);
			break;
		case 2:
			addGoods(request,response);
			break;
		case 3:
			saveGoods(request,response);
			break;
		}
	}
	public void getAll(HttpServletRequest request,HttpServletResponse response) {
		try {
			GoodsDAO gd =new GoodsDAO();
			ArrayList<Goods> al=(ArrayList<Goods>) gd.allGoods();
			request.setAttribute("allGoods",al);
			request.getRequestDispatcher("home.jsp").forward(request, response);  
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void changeGoods(HttpServletRequest request,HttpServletResponse response) {
		try {
			Integer id=Integer.parseInt(request.getParameter("id"));
			GoodsDAO gd=new GoodsDAO();
			Goods g=gd.findById(id);
			request.setAttribute("good", g);
			request.getRequestDispatcher("changeGoods.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void addGoods(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setAttribute("good", new Goods());
			request.getRequestDispatcher("changeGoods.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void saveGoods(HttpServletRequest request,HttpServletResponse response) {
		try{
			String goodsname =  Chinese.toChinese(request.getParameter("goodsname"));
			Integer number =Integer.parseInt(request.getParameter("number"));
			Float price= Float.parseFloat(request.getParameter("price"));
			Goods g=new Goods();
			g.setGoodsname(goodsname);
			g.setNumber(number);
			g.setPrice(price);
			String findByNameSql = "select * from goods where goodsname=?";
			Connection conn=DBConnector.getConnection();
			PreparedStatement ps = conn.prepareStatement(findByNameSql);
			ps.setString(1, goodsname);
			ResultSet rs = ps.executeQuery();
			int n=0;
			while (rs.next()) {
				n++;
			}
			if (n== 0) {
				if (save(g)) {
					GoodsDAO gd =new GoodsDAO();
					ArrayList<Goods> al=(ArrayList<Goods>) gd.allGoods();
					request.setAttribute("allGoods",al);
					request.getRequestDispatcher("home.jsp").forward(request, response);  
				} else {
					request.setAttribute("errors", "ÃÌº” ß∞‹£°");
					request.getRequestDispatcher("errors.jsp").forward(request, response);
				}
			} else {
				if (change(g)) {
					GoodsDAO gd =new GoodsDAO();
					ArrayList<Goods> al=(ArrayList<Goods>) gd.allGoods();
					request.setAttribute("allGoods",al);
					request.getRequestDispatcher("home.jsp").forward(request, response);  
				} else {
					request.setAttribute("errors", "ÃÌº” ß∞‹£°");
					request.getRequestDispatcher("errors.jsp").forward(request, response);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public boolean save(Goods g) throws Exception {

		String saveSql = "insert into goods (goodsname,price,number,salesvolume) values(?,?,?,?)";
		PreparedStatement ps;
		try {
			Connection conn=DBConnector.getConnection();
			ps = conn.prepareStatement(saveSql);
			ps.setString(1, g.getGoodsname());
			ps.setFloat(2, g.getPrice());
			ps.setInt(3, g.getNumber());
			ps.setInt(4, 0);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean change(Goods g) {
		try {
			String sql2 = "update goods set number=?,price=? where goodsname=?";
			Connection c=DBConnector.getConnection();
			PreparedStatement pst = c.prepareStatement(sql2);
			pst.setInt(1,g.getNumber());
			pst.setFloat(2,g.getPrice());
			pst.setString(3,g.getGoodsname());
			pst.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
