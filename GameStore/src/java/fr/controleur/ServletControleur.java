/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package fr.controleur;

import fr.entite.Client;
import fr.entite.Categorie;
import fr.entite.Article;
import fr.manager.ClientManager;
import fr.manager.CategorieManager;
import fr.manager.ArticleManager;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Haynner
 */
@WebServlet(name = "ServletControleur", urlPatterns = {"/ServletControleur", "/controleur/categorie/*", "/controleur/deconnexion", "/controleur/connexion","/controleur/"})
public class ServletControleur extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private ClientManager clientManager;
    private CategorieManager categorieManager;
    private ArticleManager articleManager;
    
   @Override
    public void init(ServletConfig config) throws ServletException{
        categorieManager = new CategorieManager("jdbc:derby://localhost:1527/GameStore","game","store");
        clientManager = new ClientManager("jdbc:derby://localhost:1527/GameStore","game","store");
        articleManager = new ArticleManager("jdbc:derby://localhost:1527/GameStore","game","store");
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        }
        catch( ClassNotFoundException e){
            System.out.println("ERREUR Driver => "+e.getMessage());  
        }
        super.init(config); 

    }
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
       
        /*categorieManager = new CategorieManager("jdbc:derby://localhost:1527/GameStore","game","store");
        clientManager = new ClientManager("jdbc:derby://localhost:1527/GameStore","game","store");
        articleManager = new ArticleManager("jdbc:derby://localhost:1527/GameStore","game","store");
        
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        }
        catch( ClassNotFoundException e){
            System.out.println("ERREUR Driver => "+e.getMessage());  
        }*/
        
        String page = request.getServletPath();
        HttpSession session = request.getSession(true);
        //session.setAttribute("first_coming", 0);
      System.out.println(page);
        if(page.equals("/controleur/")){
            ArrayList<Categorie> categories = categorieManager.getAllCategorie();
           session.setAttribute("categories", categories);
            session.setAttribute("type_page","accueil");
            System.out.println("WAZA");
            
            response.sendRedirect("/GameStore/index.jsp");
            
        }else if(page.equals("/controleur/connexion")){ //vérification présence dans bdd + affichage page perso
            if(clientManager.presenceClient(request.getParameter("identifiant"))){
                Connexion connexion = new Connexion();
                
                if(connexion.verifConnexion(request, response, clientManager)){
                    session.setAttribute("type_page","accueil");
                }else{
                    session.setAttribute("type_page","inscription");
                }
               response.sendRedirect("/GameStore/index.jsp");
                
            }else{
                session.setAttribute("type_page","inscription");
                response.sendRedirect("/GameStore/index.jsp");
            }
        }else if(page.equals("/controleur/categorie")){
            
                String nom_categorie = request.getParameter("nom_categorie");
                System.out.println("COUCOU!!!"); System.out.println(nom_categorie);
                ArrayList<Article> articles = articleManager.getAllArticleByCategorie(nom_categorie);
                
                
                session.setAttribute("type_page","articles");
                session.setAttribute("liste_articles",articles);

                //request.getRequestDispatcher("/index.jsp").forward(request, response);
                response.sendRedirect("/GameStore/index.jsp");
            
            
        }else if(page.equals("/controleur/inscription")){ //ajout d'un client à la bdd
            
            session.setAttribute("type_page","accueil");
            Inscription inscription = new Inscription();
            
            if(inscription.inscrireClient(request, response, clientManager)){
                session.setAttribute("type_page","accueil");
                Connexion connexion = new Connexion();
                connexion.verifConnexion(request, response, clientManager);
                
                response.sendRedirect("/GameStore/index.jsp");
            }else{
                session.setAttribute("type_page","inscription");
                response.sendRedirect("/GameStore/index.jsp");
            }
            
            
        }else if(page.equals("/controleur/recherche")){ //affichage de la page associé à la requete
            session.setAttribute("recherche", request.getParameter("recherche"));
            response.sendRedirect("/GameStore/index.jsp");
            
        }else if(page.equals("/controleur/panier")){
            session.setAttribute("","");
            response.sendRedirect("/GameStore/index.jsp");
            
        }else if(page.equals("/ajout_article")){
           
            
            session.setAttribute("","");
            response.sendRedirect("/GameStore/index.jsp");
            
        }else{            
            
            response.sendRedirect("/GameStore/page_not_found.jsp");
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
