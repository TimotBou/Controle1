import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.*;
import java.util.*;

public class Controle {

    public static void main(String[] args) throws SQLException {
        Connection conn = null;
        Scanner scan = new Scanner(System.in);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Erreur lors du chargement " + e.getMessage());
        }
        String url = "jdbc:mysql://localhost:3306/dbfret";
        Statement stmt = null;
        ResultSet resultat = null;

        try {
            conn = (Connection) DriverManager.getConnection(url, "root", "");
            stmt = (Statement) conn.createStatement();
            resultat = stmt.executeQuery("SELECT id, poidsMax FROM bateaufret");

            while (resultat.next()) {
                //Affichage des id et masse maximale des bateaux
                System.out.println(resultat.getString("id") + " : " + resultat.getDouble("poidsMax"));
            }
        } catch (SQLException e) {
            //Traitement des exceptions
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        try {
            int nAf;
            conn = (Connection) DriverManager.getConnection(url, "root", "");
            stmt = (Statement) conn.createStatement();
            resultat = stmt.executeQuery("SELECT idAf, idlot, idtran, poids FROM lot");

            while (resultat.next()) {
                //Saisie d'un affretement
                System.out.println("Saisir le numero d'affretement :");
                //Chiffre d'affaire d'un affretement
                int nAF = scan.nextInt();
                System.out.println( resultat.getString( "idtran"));
                String req = "SELECT tarifunit FROM tranche WHERE idTran = "+nAF;
                resultat = stmt.executeQuery(req);
                System.out.println( resultat.getString( "tarifunit"));

            }
        }catch (SQLException e){
            //Traitement des exceptions
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
}
