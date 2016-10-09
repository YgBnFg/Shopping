package webtier;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import util.Chinese;
import util.DBConnector;
import domain.Shoppingcart;
import domain.Userinfo;

public class UserinfoController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  
		this.doPost(request, response);

	} 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		switch (Integer.parseInt(request.getParameter("flag"))) {
		case 0:
			regist(request, response);
			break;
		case 1:
			login(request, response);
			break;
		case 2:
			logout(request,response);
			break;
		}
	}
	public void login(HttpServletRequest request,HttpServletResponse response) {
		try {
			Userinfo u=new Userinfo();
			u.setName(request.getParameter("name"));
			u.setPassword(request.getParameter("password"));
			//System.out.println(u.getName()+u.getPassword());
			String path="/index.jsp";
			Connection conn=DBConnector.getConnection();
			String adminsql="select * from admin where name=? and password=?";
			PreparedStatement psmt =conn.prepareStatement(adminsql);
			psmt.setString(1, u.getName());
			psmt.setString(2, u.getPassword());
			ResultSet rst=psmt.executeQuery();
			if(rst.next()) {
				rst.close();
				request.getSession().setAttribute("userinfo", u);
				path="loginSucces.jsp";
			} else {
				String sql="select * from userinfo where name=? and password=?";
				Connection c=DBConnector.getConnection();
				PreparedStatement ps =c.prepareStatement(sql);
				ps.setString(1, u.getName());
				ps.setString(2, u.getPassword());
				ResultSet rs=ps.executeQuery();
				if(rs.next()) {
					//conn.commit();
					u.setId(rs.getInt("id"));
					u.setRealname(rs.getString("realname"));
					u.setSex(rs.getString("sex"));
					u.setTel(rs.getString("tel"));
					rs.close();
					request.getSession().setAttribute("userinfo", u);
					List<Shoppingcart> lsc = new ArrayList<Shoppingcart>();
					request.getSession().setAttribute("Shoppingcart", lsc);
					path="loginSucces.jsp";
				} else {
					request.setAttribute("errors", "username or password error");
					path="errors.jsp";
				}
			}
			request.getRequestDispatcher(path).forward(request, response);  
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	public void logout(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.getSession().removeAttribute("userinfo");
			request.getSession().removeAttribute("Shoppingcart");
			response.sendRedirect("index.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void regist(HttpServletRequest request,HttpServletResponse response) {
		try{
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String sex = Chinese.toChinese((request.getParameter("sex")));
			String realname = Chinese.toChinese((request.getParameter("realname")));
			String tel = request.getParameter("tel");
			Userinfo u = new Userinfo();
			u.setName(name);
			u.setPassword(password);
			u.setSex(sex);
			u.setRealname(realname);
			u.setTel(tel);
			String findByNameSql = "select * from userinfo where name=?";
			Connection conn=DBConnector.getConnection();
			PreparedStatement ps = conn.prepareStatement(findByNameSql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			int n=0;
			while (rs.next()) {
				n++;
			}
			if (n== 0) {
				if (save(u)) {
					request.getRequestDispatcher("registSuccess.jsp").forward(request, response);
				} else {
					request.setAttribute("errors", "User registration failure£¡");
					RequestDispatcher rd = request
							.getRequestDispatcher("errors.jsp");
					rd.forward(request, response);
				}
			} else {
				request.setAttribute("errors", "username already exists£¡");
				RequestDispatcher rd = request
						.getRequestDispatcher("errors.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public boolean save(Userinfo u) throws Exception {

		String saveSql = "insert into userinfo (name,password,realname,sex,tel) values(?,?,?,?,?)";
		PreparedStatement ps;
		try {
			Connection conn=DBConnector.getConnection();
			ps = conn.prepareStatement(saveSql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getRealname());
			ps.setString(4, u.getSex());
			ps.setString(5, u.getTel());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
