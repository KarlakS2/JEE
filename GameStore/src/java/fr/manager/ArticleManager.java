
package fr.manager;

import fr.entite.Article;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ArticleManager {
    private String bdd;
    private String user;
    private String mdp;

    public ArticleManager() {
    }

    public ArticleManager(String bdd, String user, String mdp) {
        this.bdd = bdd;
        this.user = user;
        this.mdp = mdp;
    }
    
    public Article getArticle(int id)
    {
        Article article=null;
       try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           PreparedStatement s = connection.prepareStatement("SELECT * FROM ARTICLE WHERE ID=?");
           s.setInt(1, id);
           ResultSet rs = s.executeQuery();
           if(rs.next())
           {
               
               article = new Article(  Integer.parseInt(rs.getString("ID")),
                                             rs.getString("NOM"),
                                             rs.getString("PRIX"),
                                             rs.getString("DESCRIPTION"),
                                             rs.getString("URLIMAGE")
                                             );
           
           }
           
           rs.close();
           connection.close();
           
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur getArticle "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        
        return article;
    }
    
    public boolean addArticle(Article article)
    {
       try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           String sql = "INSERT INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE)"
                        + " VALUES "
                        + "(?,?,?,?)";
           PreparedStatement s = connection.prepareStatement(sql);
           
           s.setString(1, article.getNom());
           s.setString(2, article.getPrix());
           s.setString(3, article.getDescription());
           s.setString(4, article.getUrlImage());
           
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
    
    public boolean deleteArticle(int id)
    {
        try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           
           String sql = "DELETE FROM ARTICLE WHERE ID=?";
           PreparedStatement s = connection.prepareStatement(sql);
           s.setInt(1, id);
           
           
           s.executeUpdate();
           s.close();
           connection.close();
           return true;
                      
       } 
       catch(SQLException e)
       {
           System.out.println("Erreur deleteArticle "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        
       return false;
    }
    
    public boolean presenceArticle(int id)
    {
        try{
           Connection connection = DriverManager.getConnection(bdd, user, mdp);
           PreparedStatement s = connection.prepareStatement("SELECT * FROM ARTICLE WHERE ID=?");
           s.setInt(1, id);
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
           System.out.println("Erreur presenceArticle "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        return false;
    }
}
