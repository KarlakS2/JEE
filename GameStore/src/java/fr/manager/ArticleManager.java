
package fr.manager;

import fr.entite.Article;
import fr.entite.Client;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
           Statement s = connection.createStatement();
           
           String sql = "SELECT * FROM ARTICLE WHERE ID="+id+"";
           ResultSet rs = s.executeQuery(sql);
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
           Statement s = connection.createStatement();
           
           String sql = "INSERT INTO ARTICLE(NOM,PRIX,DESCRIPTION,URLIMAGE)"
                        + " VALUES "
                        + article.toStringSQL();
           
           s.executeUpdate(sql);
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
           Statement s = connection.createStatement();
           
           String sql = "DELETE FROM ARTICLE WHERE ID="+id+"";
           
           s.executeUpdate(sql);
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
           Statement s = connection.createStatement();
           
           String sql = "SELECT * FROM ARTICLE WHERE ID="+id+"";
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
           System.out.println("Erreur presenceArticle "+e.getLocalizedMessage()+":"+e.getMessage());
       }
        return false;
    }
}
