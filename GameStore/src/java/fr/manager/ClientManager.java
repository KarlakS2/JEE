package fr.manager;

import fr.entite.Client;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
        Client client=null;
       try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           PreparedStatement s = connection.prepareStatement("SELECT * FROM CLIENT WHERE IDENTIFIANT=?");
           s.setString(1, id);
           
           ResultSet rs = s.executeQuery();
           if(rs.next())
           {
               
               client = new Client(  rs.getString("IDENTIFIANT"),
                                            rs.getString("MDP"),
                                            rs.getString("MAIL"),
                                            rs.getString("NOM"),
                                            rs.getString("PRENOM"),
                                            rs.getString("ADRESSE"),
                                            rs.getString("NAISSANCE"),
                                            rs.getString("SEXE")
                                         );
           }
           
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur getClient "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        
        return client;
    }
    
    public boolean addClient(Client client)
    {
       try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           String sql = "INSERT INTO CLIENT(IDENTIFIANT,MDP,MAIL,NOM,PRENOM,ADRESSE,NAISSANCE,SEXE)"
                        + " VALUES "
                        + "(?,?,?,?,?,?,?,?)";
           PreparedStatement s = connection.prepareStatement(sql);
           
           s.setString(1, client.getIdentifiant());
           s.setString(2, client.getMdp());
           s.setString(3, client.getMail());
           s.setString(4, client.getNom());
           s.setString(5, client.getPrenom());
           s.setString(6, client.getAdresse());
           s.setString(7, client.getNaissance());
           s.setString(8, client.getSexe());
           
           s.executeUpdate();
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
           String sql = "DELETE FROM CLIENT WHERE IDENTIFIANT=?";
           PreparedStatement s = connection.prepareStatement(sql);
           s.setString(1,id);
           
           s.executeUpdate();
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
           PreparedStatement s = connection.prepareStatement("SELECT * FROM CLIENT WHERE IDENTIFIANT=?");
           s.setString(1, id);
           ResultSet rs = s.executeQuery();
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
