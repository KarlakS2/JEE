/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package fr.controleur;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.manager.ClientManager;
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
    private ClientManager client;
            
    
    public void init(ServletConfig config) throws ServletException{
        
        client = new ClientManager();
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        }
        catch( ClassNotFoundException e){
            System.out.println("ERREUR Driver => "+e.getMessage());  
        }
    }
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String page = request.getServletPath();
        
        if(page.equals("")){   //redirection vers mainpage
            //String nom_page = "index";
            //request.setAttribute("nom_page", nom_page);
            getServletContext().getRequestDispatcher("/mainpage.jsp").forward(request, response);       
            
        }else if(page.equals("/connexion")){ //vérification présence dans bdd + affichage page perso
            if(client.presenceClient(request.getParameter("identifiant"))){
                getServletContext().getRequestDispatcher("/Connexion").forward(request, response);
                
            }else{
                //String resultat = "incorrect";
                //request.setAttribute("resultat", resultat);
                getServletContext().getRequestDispatcher("/inscription.jsp").forward(request, response);
            }
        }else if(page.equals("/profil")){
            getServletContext().getRequestDispatcher("/inscription.jsp").forward(request, response);
            
        }else if(page.equals("/inscription")){ //ajout d'un client à la bdd
            getServletContext().getRequestDispatcher("/Inscription").forward(request, response);
            
        }else if(page.equals("/recherche")){ //affichage de la page associé à la requete
            request.setAttribute("recherche", request.getParameter("recherche"));
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            
        }else if(page.equals("/panier")){
            
            
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
