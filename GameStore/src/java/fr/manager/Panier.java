package fr.manager;

import fr.entite.Article;
import java.util.HashMap;
import java.util.HashSet;

/**
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
    
    public HashSet<Article> getListeArticle()
    {
        return listeArticle;
    }

    public void addArticle(Article a)
    {
        if(listeArticle.contains(a))
        {
            int i = nombreParArticle.get(a);
            nombreParArticle.put(a,new Integer(i+1));
        }
        else
        {
            listeArticle.add(a);
            nombreParArticle.put(a,new Integer(1));
        }
        
    }
    
    public void reduceArticle(Article a)
    {
        if(listeArticle.contains(a))
        {
            int i = nombreParArticle.get(a);
            if(i-1<=0){
                listeArticle.remove(a);
                nombreParArticle.remove(a);
            }
            else
            nombreParArticle.put(a,new Integer(i-1));
        }
        else
        {
            
        }
        
    }
    
     public void deleteArticle(Article a)
    {
        if(listeArticle.contains(a))
        {
                listeArticle.remove(a);
                nombreParArticle.remove(a);
        }
        else
        {
            
        }
        
    }
    
    public int getPrixParArticle(Article a)
    {
        if(listeArticle.contains(a))
        {
            int i = nombreParArticle.get(a);
            return a.getPrix()*i;
        }
        else
        {
            return 0;
        }
    }
    
    public int getPrixTotal()
    {
        int prix = 0;
        for(Article a : listeArticle)
        {
            prix = prix + getPrixParArticle(a);
        }
        return prix;
    }
    
    public int getNombreArticle(Article a)
    {
        if(listeArticle.contains(a))
        {
            return nombreParArticle.get(a);
        }
        else
        {
            return 0;
        }
    }
    
    public void viderPanier()
    {
        listeArticle.clear();
        nombreParArticle.clear();
    }
}
