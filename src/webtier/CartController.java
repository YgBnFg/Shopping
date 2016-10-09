package webtier;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javafx.collections.ListChangeListener.Change;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.net.httpserver.HttpServer;

import dao.GoodsDAO;
import domain.*;

public class CartController extends HttpServlet{
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
			showCart(request, response);
			break;
		case 1:
			add(request,response);
			break;
		case 2:
			clear(request,response);
			break;
		case 3:
			change(request,response);
			break;
		case 4:
			delete(request,response);
		}
	}
	public void showCart(HttpServletRequest request,HttpServletResponse response) {	
		try {
			request.getRequestDispatcher("mycart.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void add(HttpServletRequest request,HttpServletResponse response) {
		Integer id=Integer.parseInt(request.getParameter("id"));
		try {
			Integer exitNum=0;
			List<Shoppingcart> lsc=(List<Shoppingcart>) request.getSession().getAttribute("Shoppingcart");
			for(int i=0;i<lsc.size();i++) {
				if(lsc.get(i).getId()==id) {
					exitNum=lsc.get(i).getNumber();
					lsc.remove(lsc.get(i));
				}
			}
			Shoppingcart sc=new Shoppingcart();
			GoodsDAO gd=new GoodsDAO();
			Goods g=gd.findById(id);
			sc.setGoodsName(g.getGoodsname());
			sc.setNumber(exitNum+1);
			sc.setPrice(g.getPrice());
			sc.setId(g.getId());
			lsc.add(sc);
			request.getSession().setAttribute("Shoppingcart", lsc);
			RequestDispatcher rd=request.getRequestDispatcher("addSuccess.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void clear(HttpServletRequest request,HttpServletResponse response) {	
		try {
			request.getSession().setAttribute("Shoppingcart",new ArrayList<Shoppingcart>());
			request.getRequestDispatcher("mycart.jsp").forward(request, response); 
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	public void change(HttpServletRequest request,HttpServletResponse response) {	
			List<Shoppingcart> lsc = (List<Shoppingcart>) request.getSession().getAttribute("Shoppingcart");
			try {
				String[] number = request.getParameterValues("num");
				List<Shoppingcart> listSc = new ArrayList<Shoppingcart>();
				for (int i = 0; i < lsc.size(); i++) {
					if(Integer.parseInt(number[i])==0){ 
						lsc.remove(lsc.get(i));
					}else {
						Integer id=lsc.get(i).getId();
						GoodsDAO gd=new GoodsDAO();
						Goods g=gd.findById(id);
						if(Integer.parseInt(number[i])>g.getNumber()) {		//与现有数据比较
							request.setAttribute("errors", "goods："+g.getGoodsname()+"insufficient quantiyt");
							request.getRequestDispatcher("errors.jsp").forward(request, response);
						}
						lsc.get(i).setNumber(Integer.parseInt(number[i]));
						listSc.add(lsc.get(i));
					}
				}
				request.getSession().setAttribute("Shoppingcart", listSc);
				request.getRequestDispatcher("mycart.jsp").forward(request, response);
				} catch(Exception e){
					e.printStackTrace();
				}
		}
		public void delete(HttpServletRequest request,HttpServletResponse response) {	
			Integer id=Integer.parseInt(request.getParameter("id"));
			try {
				List<Shoppingcart> lsc=(List<Shoppingcart>) request.getSession().getAttribute("Shoppingcart");
				for(int i=0;i<lsc.size();i++) {
					if(lsc.get(i).getId()==id) {
						lsc.remove(lsc.get(i));
					}
				}
				request.getSession().setAttribute("Shoppingcart", lsc);
				RequestDispatcher rd=request.getRequestDispatcher("mycart.jsp");
				rd.forward(request, response);
			} catch(Exception e){
				e.printStackTrace();
			}
		}
	}
