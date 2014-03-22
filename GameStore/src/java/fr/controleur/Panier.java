package fr.controleur;

import fr.entite.Article;
import java.util.HashMap;
import java.util.HashSet;

/**
 *
 * @author Karlak
 */
public class Panier {
    private HashSet<Article> listeArticle;
    private HashMap<Article,Integer> nombreParArticle;
    
    public Panier()
    {
        listeArticle = new HashSet<>();
        nombreParArticle = new HashMap<>();
    }

    public void addArticle(Article a)
    {
        
        
    }
    
}
