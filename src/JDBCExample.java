import java.sql.*;

public class JDBCExample {
    public static void main(String[] args) {
        String userid = "servicesp24";
        String password = "password";
        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost/jdbctest",
                userid,
                password);) {
            conn.setAutoCommit(false);
            Statement stmt = conn.createStatement();
            PreparedStatement ps =
                    conn.prepareStatement("select personid, name, age from person");

            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int age = rs.getInt(3);
                if(rs.wasNull()) {
                    System.out.println(id + " " + name + ", no age listed");
                } else {
                    System.out.println(id + " " + name + " " + age);
                }

            }


            conn.commit();
        } catch (SQLException e) {
            System.out.println("SQLException : " + e);
        }
    }
}