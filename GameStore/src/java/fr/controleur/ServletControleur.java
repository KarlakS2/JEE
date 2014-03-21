/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package fr.controleur;

import fr.entite.Client;
import fr.entite.Categorie;
import fr.manager.ClientManager;
import fr.manager.CategorieManager;
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
@WebServlet(name = "ServletControleur", urlPatterns = {"/ServletControleur"})
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
    public CategorieManager categorieManager;
    
    @Override
    public void init(ServletConfig config) throws ServletException{
        categorieManager = new CategorieManager("jdbc:derby://localhost:1527/GameStore","game","store");
        clientManager = new ClientManager("jdbc:derby://localhost:1527/GameStore","game","store");
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
        
        String page = request.getServletPath();
        HttpSession session = request.getSession(true);
        session.setAttribute("first_coming", 0);
        
        if(page.equals("/first_coming")){
            request.setAttribute("type_page","accueil");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);       
            
        }else if(page.equals("/connexion")){ //vérification présence dans bdd + affichage page perso
            if(clientManager.presenceClient(request.getParameter("identifiant"))){
                Connexion connexion = new Connexion();
                
                if(connexion.verifConnexion(request, response, clientManager)){
                    request.setAttribute("type_page","accueil");
                }else{
                    request.setAttribute("type_page","inscription");
                }
                getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
                
            }else{
                request.setAttribute("type_page","inscription");
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            }
        }else if(page.equals("/categories")){
            
            ArrayList<Categorie> categories = categorieManager.getAllCategorie();
            request.setAttribute("categories",categories);
            request.setAttribute("type_page",categories);
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            
        }else if(page.equals("/inscription")){ //ajout d'un client à la bdd
            
            request.setAttribute("type_page","accueil");
            Inscription inscription = new Inscription(request,response,clientManager);
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            
        }else if(page.equals("/recherche")){ //affichage de la page associé à la requete
            request.setAttribute("recherche", request.getParameter("recherche"));
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            
        }else if(page.equals("/panier")){
            request.setAttribute("","");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            
        }else{
            getServletContext().getRequestDispatcher("/page_not_found.jsp").forward(request, response);
        }
        // envoyer une liste de noms de catégories à Vue => Mathieu, I need a function which returns a list of things of the table "categorie"
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
