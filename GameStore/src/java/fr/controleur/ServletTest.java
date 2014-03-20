package fr.controleur;

import fr.entite.Article;
import fr.entite.Categorie;
import fr.entite.Client;
import fr.entite.Commande;
import fr.manager.ClientManager;
import java.io.IOException;
import java.io.PrintWriter;
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
            
        String page = request.getParameter("page");
        
        if(page.equals("demarrage"))
        {
            Client client = new Client();
            client.setIdentifiant("Toto");
            client.setMail("toto@blague.com");
            client.setSexe("Homme");
            Article article = new Article();
            article.setDescription("Ceci est la description de l'article");
            article.setPrix("100€");
            Categorie categorie = new Categorie();
            categorie.setId(500);
            categorie.setNom("MaCategorie");
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
