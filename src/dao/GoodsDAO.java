package dao;

import java.sql.*;
import java.util.*;

import util.DBConnector;
import domain.Goods;

public class GoodsDAO {
	public List<Goods> allGoods() throws  Exception {
		List<Goods> lg = new ArrayList<Goods>();
		String Sql = "select * from goods ";
		Connection c=DBConnector.getConnection();
		PreparedStatement ps = c.prepareStatement(Sql);
		ResultSet rs = ps.executeQuery(Sql);
		while (rs.next()) {
			Goods g = new Goods();
			g.setId(rs.getInt("id"));
			g.setGoodsname(rs.getString("goodsname"));
			g.setPrice(rs.getFloat("price"));
			g.setNumber(rs.getInt("number"));
			g.setSalesvolume(rs.getInt("salesvolume"));
			lg.add(g);
		}
		return lg;
	}
	public Goods findById(Integer id) throws Exception{
		Goods g=new Goods();
		String sql="select * from goods where id=?";
		Connection c=DBConnector.getConnection();
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(1,id);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			g.setId(rs.getInt("id"));
			g.setGoodsname(rs.getString("goodsname"));
			g.setPrice(rs.getFloat("price"));
			g.setNumber(rs.getInt("number"));
			g.setSalesvolume(rs.getInt("salesvolume"));
		}
		return g;
		
	}
}
