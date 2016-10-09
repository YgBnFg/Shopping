package webtier;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.CodeCreator;
import util.DBConnector;

import com.sun.org.apache.bcel.internal.generic.NEW;

import dao.GoodsDAO;
import domain.Goods;
import domain.Shoppingcart;
import domain.Userinfo;

public class AccountController extends HttpServlet{
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
			getAccount(request, response);
			break;
		case 1:
			changeGoods(request,response);
			break;
		}
	}
	public void getAccount(HttpServletRequest request, HttpServletResponse response) {
		try{
			Userinfo u=(Userinfo) request.getSession().getAttribute("userinfo");
			request.setAttribute("accountCode", new CodeCreator().createAccountcode(u.getId()));
			request.getRequestDispatcher("account.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void changeGoods(HttpServletRequest request, HttpServletResponse response) {
		try{
			List<Shoppingcart> lsc = (List<Shoppingcart>) request.getSession().getAttribute("Shoppingcart");
			String sql2 = "update goods set number=?,salesvolume=? where id=?";
			Connection c=DBConnector.getConnection();
			PreparedStatement pst = c.prepareStatement(sql2);
			for(int i=0;i<lsc.size();i++) {
				Integer id=lsc.get(i).getId();
				GoodsDAO gd=new GoodsDAO();
				Goods g=gd.findById(id);
				Integer num=lsc.get(i).getNumber();
				pst.setInt(1,g.getNumber()-num);
				pst.setInt(2,g.getSalesvolume()+num);
				pst.setInt(3,id);
	            pst.executeUpdate();
			}
			request.getRequestDispatcher("paySuccess.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
