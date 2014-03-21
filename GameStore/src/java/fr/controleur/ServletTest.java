package fr.controleur;

import fr.entite.Article;
import fr.entite.Categorie;
import fr.entite.Client;
import fr.entite.Commande;
import fr.manager.ArticleManager;
import fr.manager.CategorieManager;
import fr.manager.ClientManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Karlak
 */
public class ServletTest extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
        
        
        if(request.getServletPath().equals("/ServletTest"))
        {
            Client client = new Client();
            client.setIdentifiant("Toto");
            client.setMail("toto@blague.com");
            client.setSexe("Homme");
            Article article = new Article();
            article.setDescription("Ceci est la description de larticle");
            article.setPrix("100€");
            Categorie categorie = new Categorie();
            categorie.setId(500);
            categorie.setNom("MaCategorie");
            article.setCategorie(categorie);
            Commande commande = new Commande (5,client,article);
            
            out.println("Test du client :");
            out.println(client);
            out.println("<br/><br/>");
            out.println("Test de l'article :");
            out.println(article);
            out.println("<br/><br/>");
            out.println("Test de la commande :");
            out.println(commande);
            out.println("<br/><br/>");
            out.println("Test de la commande :");
            out.println(categorie);
            out.println("<br/><br/>");
            
             out.println("--------------TEST CLIENTMANAGER--------------<br/>");
            
            out.println("J'ajoute un client à la BDD");
            ClientManager clientManager = new ClientManager("jdbc:derby://localhost:1527/GameStore","game","store");
            clientManager.addClient(client);
            
            out.println("<br/><br/>");
            out.println("Toto est il present dans la BDD ? reponse : "+clientManager.presenceClient("Toto"));
            
            out.println("<br/><br/>");
            out.println("Je recupere le client Toto");
            Client c = clientManager.getClient("Toto");
            out.println(c);
            
            out.println("<br/><br/>");
            out.println("Je supprime le client Toto");
            clientManager.deleteClient("Toto");
            
            out.println("<br/><br/>");
            out.println("--------------TEST CATEGORIEMANAGER--------------<br/>");
            
            
            out.println("J'ajoute une categorie à la BDD");
            CategorieManager categorieManager = new CategorieManager("jdbc:derby://localhost:1527/GameStore","game","store");
            categorieManager.addCategorie(categorie);
            
            //out.println("<br/><br/>");
            //out.println("L'article n°1 est il present dans la BDD ? reponse : "+categorieManager.presenceArticle(3));
            
            out.println("<br/><br/>");
            out.println("Je recupere l'article n°3");
            Categorie cat = categorieManager.getCategorie(1);
            out.println(cat);
            
          //  out.println("<br/><br/>");
          //  out.println("Je supprime l'article n°4");
          //  articleManager.deleteArticle(4);
            out.println("<br/><br/>");
            out.println("--------------TEST ARTICLEMANAGER--------------<br/>");
            
            
            out.println("J'ajoute un article à la BDD");
            ArticleManager articleManager = new ArticleManager("jdbc:derby://localhost:1527/GameStore","game","store");
            article.setCategorie(cat);
            articleManager.addArticle(article);
            
            out.println("<br/><br/>");
            out.println("L'article n°1 est il present dans la BDD ? reponse : "+articleManager.presenceArticle(3));
            
            out.println("<br/><br/>");
            out.println("Je recupere l'article n°3");
            Article a = articleManager.getArticle(3);
            out.println(a);
            
            out.println("<br/><br/>");
            out.println("Je recupere tous les articles de la categorie n°1<br/>");
            ArrayList<Article> listeArticle = articleManager.getAllArticleByCategorie(1);
            out.println("Il y a "+listeArticle.size()+" article(s)");
            
            out.println("<br/><br/>");
            out.println("Je supprime l'article n°4");
            articleManager.deleteArticle(4);
            
            out.println("<br/><br/>");
            
        }
            
            
            

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
