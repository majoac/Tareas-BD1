package com.example.appkardexbd;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class KardexViewer {

    // 1. Constantes definidas una vez
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/university";
    private static final String USER = "developer";
    private static final String PASS = "puna1905";
    private static final String QUERY = "SELECT s.ID, s.name, c.title, t.grade FROM student s JOIN takes t ON s.ID = t.ID JOIN course c ON t.course_id = c.course_id ORDER BY s.name, c.title";

    public static void main(String[] args) {
        System.out.println("--- Consulta de Kardex ---");

        // 2. Uso de Constantes en el try-with-resources
        try (
                Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(QUERY);
        ) {
            System.out.printf("| %-10s | %-25s | %-35s | %-6s |\n", "ID", "ESTUDIANTE", "MATERIA", "CALIF");
            System.out.println("----------------------------------------------------------------------------------");

            while(rs.next()) {
                System.out.printf("| %-10s | %-25s | %-35s | %-6s |\n", rs.getString("ID"), rs.getString("name"), rs.getString("title"), rs.getString("grade"));
            }

            System.out.println("----------------------------------------------------------------------------------");
        } catch (SQLException e) {
            System.err.println("Error de Base de Datos. Revisa credenciales o si PostgreSQL está activo.");
            System.err.println("Detalles: " + e.getMessage());
        }
    }
}