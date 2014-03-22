
package fr.manager;

import fr.entite.Administrateur;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Karlak
 */
public class AdministrateurManager {
    private String bdd;
    private String user;
    private String mdp;

    public AdministrateurManager(String bdd, String user, String mdp) {
        this.bdd = bdd;
        this.user = user;
        this.mdp = mdp;
    }
   
    public boolean addAdministrateur(Administrateur admin)
    {
        
        try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           String sql = "INSERT INTO ADMINISTRATEUR(IDENTIFIANT,MDP,MAIL)"
                        + " VALUES "
                        + "(?,?,?)";
           PreparedStatement s = connection.prepareStatement(sql);
           
           s.setString(1, admin.getIdentifiant());
           s.setString(2, admin.getMdp());
           s.setString(3, admin.getMail());
           
           s.executeUpdate();
           s.close();
           connection.close();
           return true;         
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur addAdministrateur "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        return false;
    }
    
    public Administrateur getAdmin(String id)
    {
        Administrateur admin=null;
        try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           PreparedStatement s = connection.prepareStatement("SELECT * FROM ADMIN WHERE IDENTIFIANT=?");
           s.setString(1, id);
           
           ResultSet rs = s.executeQuery();
           if(rs.next())
           {
               
               admin = new Administrateur(  rs.getString("IDENTIFIANT"),
                                            rs.getString("MDP"),
                                            rs.getString("MAIL")
                                         );
           }
           
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur getAdministrateur "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        
        return admin;
    }
    
    public boolean deleteAdministrateur(String id)
    {
        try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           String sql = "DELETE FROM ADMINISTRATEUR WHERE IDENTIFIANT=?";
           PreparedStatement s = connection.prepareStatement(sql);
           s.setString(1,id);
           
           s.executeUpdate();
           s.close();
           connection.close();
           return true;
                      
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur deleteAdministrateur "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        
       return false;
    }
    
    public boolean presenceAdministrateur(String id)
    {
        try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           PreparedStatement s = connection.prepareStatement("SELECT * FROM ADMIN WHERE IDENTIFIANT=?");
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
           System.out.println("Erreur presenceAdmibistrateur "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        return false;
    }
}
