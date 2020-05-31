package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import beans.BasicEgg;

public class EggBasket {

	public BasicEgg[] getAllEggs(Connection conn) {
		return null;
	}

	public boolean add(Connection conn, BasicEgg newEgg) throws SQLException {
		String sql = "INSERT into eggs (quality, color) values (?, ?)";
		PreparedStatement stmt = null;

		stmt = conn.prepareStatement(sql);

		stmt.setString(1, Integer.toString(newEgg.getQuality()));
		stmt.setString(2, newEgg.getColor());

		int numRows = stmt.executeUpdate();
		
		stmt.close();
		
		return numRows > 0;
	}
	
	public boolean clean(Connection conn) throws SQLException {
		String sql = "DELETE from eggs";
		PreparedStatement stmt = null;

		stmt = conn.prepareStatement(sql);
		boolean cleanSuccess = stmt.execute();
		System.out.println("clean success " + cleanSuccess);
		
		return !cleanSuccess;
	}

}
