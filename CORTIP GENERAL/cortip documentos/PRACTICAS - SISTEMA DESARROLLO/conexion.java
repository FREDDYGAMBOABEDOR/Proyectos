import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexion {
   public static void main(String args[]) {
      Connection c = null;
      try {
         Class.forName("org.postgresql.Driver");
         c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Bd_bitacoras",
            "postgres", "1234");
      } catch (Exception e) {
         e.printStackTrace();
         System.err.println(e.getClass().getName()+": "+e.getMessage());
         System.exit(0);
      }
    System.out.println("Opened database successfully");
 
 
   }
}
