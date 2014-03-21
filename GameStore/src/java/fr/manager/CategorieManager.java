package fr.manager;

import fr.entite.Article;
import fr.entite.Categorie;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Karlak
 */
public class CategorieManager {
    private String bdd;
    private String user;
    private String mdp;

    public CategorieManager(String bdd, String user, String mdp) {
        this.bdd = bdd;
        this.user = user;
        this.mdp = mdp;
    }
    
    public Boolean addCategorie(Categorie categorie)
    {
        try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           String sql = "INSERT INTO CATEGORIE(NOM)"
                        + " VALUES "
                        + "(?)";
           PreparedStatement s = connection.prepareStatement(sql);
           
           s.setString(1, categorie.getNom());
           
           s.executeUpdate();
           s.close();
           connection.close();
           return true;
                      
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur addCategorie "+e.getLocalizedMessage()+":"+e.getMessage());
       }
       
       return false;
    }
    
    public Categorie getCategorie(int id)
    {
        Categorie categorie=null;
        try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           PreparedStatement s = connection.prepareStatement("SELECT * FROM CATEGORIE WHERE ID=?");
           s.setInt(1, id);
           ResultSet rs = s.executeQuery();
           if(rs.next())
           {
               categorie = new Categorie(  Integer.parseInt(rs.getString("ID")),
                                             rs.getString("NOM")
                                        );
           }
           
           rs.close();
           connection.close();
           
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur getCategorie "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        return categorie;
    }
    
    public Categorie getCategorie(String nom)
    {
        Categorie categorie=null;
        try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           PreparedStatement s = connection.prepareStatement("SELECT * FROM CATEGORIE WHERE NOM=?");
           s.setString(1, nom);
           ResultSet rs = s.executeQuery();
           if(rs.next())
           {
               categorie = new Categorie(  Integer.parseInt(rs.getString("ID")),
                                             rs.getString("NOM")
                                        );
           }
           
           rs.close();
           connection.close();
           
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur getCategorie "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        return categorie;
    }
    
    public ArrayList<Categorie> getAllCategorie()
    {
        ArrayList<Categorie> resultat = new ArrayList<Categorie>();
        try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           Statement s = connection.createStatement();
           ResultSet rs = s.executeQuery("SELECT * FROM CATEGORIE");
            
            while(rs.next())
           {
              Categorie categorie = new Categorie(  Integer.parseInt(rs.getString("ID")),
                                             rs.getString("NOM")
                                        );
              resultat.add(categorie);
           }
            
            rs.close();
            connection.close();     
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur getAllCategorie "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        
        return resultat;
    }
    
    public Boolean deleteCategorie(int id)
    {
        
        try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           
           String sql = "DELETE FROM CATEGORIE WHERE ID=?";
           PreparedStatement s = connection.prepareStatement(sql);
           s.setInt(1, id);
           
           
           s.executeUpdate();
           s.close();
           connection.close();
           return true;
                      
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur deleteCategorie "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        return false;
    }
    
}
