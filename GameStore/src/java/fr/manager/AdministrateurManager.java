
package fr.manager;

import fr.entite.Administrateur;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
   
    public boolean addAdmin(Administrateur admin)
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
           System.out.println("Erreur addArticle "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        return false;
    }
}
