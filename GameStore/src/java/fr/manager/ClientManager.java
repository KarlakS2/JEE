package fr.manager;

import fr.entite.Client;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;

/**
 *
 * @author Karlak
 */
public class ClientManager {

    private String bdd;
    private String user;
    private String mdp;
    
    
    public ClientManager() {
    }

    public ClientManager(String bdd, String user, String mdp) {
        this.bdd = bdd;
        this.user = user;
        this.mdp = mdp;
    }
    
    public Client getClient(String id)
    {
       try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           Statement s = connection.createStatement();
           
           String sql = "SELECT * FROM CLIENT WHERE IDENTIFIANT='"+id+"'";
           ResultSet rs = s.executeQuery(sql);
           if(rs.next())
           {
               
               Client client = new Client(  rs.getString("IDENTIFIANT"),
                                            rs.getString("MDP"),
                                            rs.getString("MAIL"),
                                            rs.getString("NOM"),
                                            rs.getString("PRENOM"),
                                            rs.getString("ADRESSE"),
                                            rs.getString("NAISSANCE"),
                                            rs.getString("SEXE")
                                         );
             rs.close();
             connection.close();
             return client;
           }
           
           rs.close();
           connection.close();
           
           return new Client();
           
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur getClient "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        
        return new Client();
    }
    
    public boolean addClient(Client client)
    {
       try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           Statement s = connection.createStatement();
           
           String sql = "INSERT INTO CLIENT(IDENTIFIANT,MDP,MAIL,NOM,PRENOM,ADRESSE,NAISSANCE,SEXE)"
                        + " VALUES "
                        + client.toStringSQL();
           
           s.executeUpdate(sql);
           s.close();
           connection.close();
           return true;
                      
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur addClient "+e.getLocalizedMessage()+":"+e.getMessage());
       }
       
       return false;
    }
    
    public boolean deleteClient(String id)
    {
        try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           Statement s = connection.createStatement();
           
           String sql = "DELETE FROM CLIENT WHERE IDENTIFIANT='"+id+"'";
           
           s.executeUpdate(sql);
           s.close();
           connection.close();
           return true;
                      
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur deleteClient "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        
       return false;
    }
    
    public boolean presenceClient(String id)
    {
        try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           Statement s = connection.createStatement();
           
           String sql = "SELECT * FROM CLIENT WHERE IDENTIFIANT='"+id+"'";
           ResultSet rs = s.executeQuery(sql);
           if(rs.next())
           {
             rs.close();
             connection.close();
             return true;
           }
           
           rs.close();
           connection.close();
           
           return false;
           
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur presenceClient "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        return false;
    }
    
}
