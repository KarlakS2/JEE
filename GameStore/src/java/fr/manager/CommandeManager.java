/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package fr.manager;

import fr.entite.Categorie;
import fr.entite.Commande;
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
public class CommandeManager {
    private String bdd;
    private String user;
    private String mdp;

    public CommandeManager(String bdd, String user, String mdp) {
        this.bdd = bdd;
        this.user = user;
        this.mdp = mdp;
    }
    
    public Boolean addCommande(Commande commande)
    {
        try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           String sql = "INSERT INTO COMMANDE(ID_CLIENT,ID_ARTICLE)"
                        + " VALUES "
                        + "(?,?)";
           PreparedStatement s = connection.prepareStatement(sql);
           
           s.setString(1, commande.getClient().getIdentifiant());
           s.setInt(2,commande.getArticle().getId());
           
           s.executeUpdate();
           s.close();
           connection.close();
           return true;
                      
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur addCommande "+e.getLocalizedMessage()+":"+e.getMessage());
       }
       
       return false;
    }
    
    public Commande getCommande(int id)
    {
        Commande commande=null;
        try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           PreparedStatement s = connection.prepareStatement("SELECT * FROM COMMANDE WHERE ID=?");
           s.setInt(1, id);
           ResultSet rs = s.executeQuery();
           if(rs.next())
           {
               ArticleManager am = new ArticleManager(bdd, user, mdp);
               ClientManager cm = new ClientManager(bdd, user, mdp);
               commande = new Commande(  Integer.parseInt(rs.getString("ID")),
                                             cm.getClient(rs.getString("ID_CLIENT")),
                                             am.getArticle(rs.getInt("ID_ARTICLE"))
                                        );
           }
           
           rs.close();
           connection.close();
           
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur getCommande "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        return commande;
    }
    
    public ArrayList<Commande> getAllCommandeByClient(String id)
    {
        ArrayList<Commande> resultat = new ArrayList<Commande>();
        try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           PreparedStatement s = connection.prepareStatement("SELECT * FROM COMMANDE WHERE ID_CLIENT=?");
           s.setString(1, id);
           ResultSet rs = s.executeQuery();
            
            while(rs.next())
           {
              ArticleManager am = new ArticleManager(bdd, user, mdp);
              ClientManager cm = new ClientManager(bdd, user, mdp);
              Commande commande = new Commande(  Integer.parseInt(rs.getString("ID")),
                                             cm.getClient(rs.getString("ID_CLIENT")),
                                             am.getArticle(rs.getInt("ID_ARTICLE"))
                                        );
              resultat.add(commande);
           }
            
            rs.close();
            connection.close();     
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur getAllCommandeByClient "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        
        return resultat;
    }
    
    public Boolean deleteCommande(int id)
    {
        
        try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           
           String sql = "DELETE FROM COMMANDE WHERE ID=?";
           PreparedStatement s = connection.prepareStatement(sql);
           s.setInt(1, id);
           
           
           s.executeUpdate();
           s.close();
           connection.close();
           return true;
                      
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur deleteCommande "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        return false;
    }
    
    public Boolean deleteCommandeByClient(String id)
    {
        
        try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           
           String sql = "DELETE FROM COMMANDE WHERE ID_CLIENT=?";
           PreparedStatement s = connection.prepareStatement(sql);
           s.setString(1, id);
           
           
           s.executeUpdate();
           s.close();
           connection.close();
           return true;
                      
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur deleteCommande "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        return false;
    }
}
