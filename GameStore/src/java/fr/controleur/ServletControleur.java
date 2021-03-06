/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package fr.controleur;

import fr.manager.Panier;
import fr.entite.Administrateur;
import fr.entite.Article;
import fr.entite.Categorie;
import fr.entite.Client;
import fr.entite.Commande;
import fr.manager.AdministrateurManager;
import fr.manager.ArticleManager;
import fr.manager.CategorieManager;
import fr.manager.ClientManager;
import fr.manager.CommandeManager;
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
@WebServlet(name = "ServletControleur", urlPatterns = {"/ServletControleur","/controleur/ajouter_panier", "/controleur/categorie/*", "/controleur/deconnexion", "/controleur/connexion","/controleur/accueil","/controleur/", "/controleur/valider_connexion","/controleur/valider_inscription","/controleur/ajouter_panier","/controleur/article","/controleur/inscription","/controleur/deconnexion","/controleur/profil","/controleur/panier","/controleur/commandes","/controleur/enlever_commande","/controleur/ajouter_article","/controleur/diminuer_article","/controleur/enlever_article","/controleur/ajouter_categorie","/controleur/ajouter_article","/controleur/ajouter_administrateur","/controleur/admin","/connexion_admin","/ajouter_article","/ajouter_categorie","/ajouter_administrateur","/supprimer_categorie","/controleur/valider_commande","/controleur/desinscription"})
public class ServletControleur extends HttpServlet {
    ArrayList<Categorie> categories =null;
    ArrayList<Article> articles = null;
    ArrayList<Commande> commandes = null;
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
    private AdministrateurManager administrateurManager;
    private CommandeManager commandeManager;
    private Panier panier;
    
   @Override
    public void init(ServletConfig config) throws ServletException{
        categorieManager = new CategorieManager("jdbc:derby://localhost:1527/GameStore","game","store");
        clientManager = new ClientManager("jdbc:derby://localhost:1527/GameStore","game","store");
        articleManager = new ArticleManager("jdbc:derby://localhost:1527/GameStore","game","store");
        administrateurManager = new AdministrateurManager("jdbc:derby://localhost:1527/GameStore","game","store");
        commandeManager = new CommandeManager("jdbc:derby://localhost:1527/GameStore","game","store");
        panier = new Panier();
        
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
        categories = categorieManager.getAllCategorie();
            
        session.setAttribute("panier", panier);
            
        session.setAttribute("categories", categories);
        if(session.getAttribute("nom_utilisateur") != null){
                commandes = commandeManager.getAllCommandeByClient((String)session.getAttribute("nom_utilisateur"));
                session.setAttribute("commandes",commandes);
        }
        
      System.out.println(page);
        if(page.equals("/controleur/")){
            session.setAttribute("administrateur", false);
            
            session.setAttribute("type_page","accueil");
            
            redirigerVersJSP(response);
            
        }else if(page.equals("/controleur/connexion")){
            session.setAttribute("type_page","connexion");
            redirigerVersJSP(response);
            
        }else if(page.equals("/controleur/profil")){
            
            session.setAttribute("type_page","profil");
            redirigerVersJSP(response);
            
        }else if(page.equals("/controleur/commandes")){
            
            
            
            session.setAttribute("type_page","commande");
            redirigerVersJSP(response);
            
        }else if(page.equals("/controleur/valider_commande")){
            
            Client client = (Client)session.getAttribute("user_compte");
            if(client != null){
                //ajout commande à la bdd
                for(Article article : panier.getListeArticle()){
                    for(int i=0;i<panier.getNombreArticle(article);i++){
                        Commande nCommande = new Commande(0,client,article);
                        commandeManager.addCommande(nCommande);
                    }
                }
                panier = new Panier();
                commandes = commandeManager.getAllCommandeByClient((String)session.getAttribute("nom_utilisateur"));
                session.setAttribute("commandes",commandes);
                session.setAttribute("type_page","commande"); // commande effectuée
                redirigerVersJSP(response);
            }else{
                session.setAttribute("type_page","connexion");
                redirigerVersJSP(response);
            }
            
            
        }else if(page.equals("/controleur/enlever_commande")){
 
            commandeManager.deleteCommande(Integer.parseInt(request.getParameter("id_commande")));
            if(session.getAttribute("nom_utilisateur") != null){
                commandes = commandeManager.getAllCommandeByClient((String)session.getAttribute("nom_utilisateur"));
                session.setAttribute("commandes",commandes);
            }
            session.setAttribute("type_page","commande");
            redirigerVersJSP(response);
        }else if(page.equals("/controleur/deconnexion")){
            DeconnexionControleur deco = new DeconnexionControleur();
            deco.deconnecte(session);
            session.setAttribute("administrateur", false);
            session.setAttribute("type_page","accueil");
            redirigerVersJSP(response);
            
        }else if(page.equals("/controleur/valider_connexion")){ //vérification présence dans bdd + affichage page perso
            if(clientManager.presenceClient(request.getParameter("identifiant"))){
                Connexion connexion = new Connexion();
                
                if(connexion.verifConnexion(request, response, clientManager)){
                    session.setAttribute("type_page","accueil");
                }else{
                    session.setAttribute("type_page","inscription");
                }
               redirigerVersJSP(response);
                
            }else if(administrateurManager.presenceAdministrateur(request.getParameter("identifiant"))){
                Connexion connexion = new Connexion();
                if(connexion.verifConnexionAdmin(request, response, administrateurManager)){
                    session.setAttribute("type_page","accueil");
                    redirigerVersJSP(response);
                }else{
                    session.setAttribute("type_page","inscription");
                    redirigerVersJSP(response);
                }
                
            }else{
                session.setAttribute("type_page","inscription");
                redirigerVersJSP(response);
            }
        }else if(page.equals("/controleur/categorie")){
            
                String nom_categorie = request.getParameter("nom_categorie");
                articles = articleManager.getAllArticleByCategorie(nom_categorie);
                
                session.setAttribute("type_page","articles");
                session.setAttribute("liste_articles",articles);
                session.setAttribute("categorie",nom_categorie);
                redirigerVersJSP(response);
            
            
        }else if(page.equals("/controleur/inscription")){
            session.setAttribute("type_page","inscription");
            redirigerVersJSP(response);
            
        }else if(page.equals("/controleur/valider_inscription")){ //ajout d'un client à la bdd
            
            
            Inscription inscription = new Inscription();
            
            if(inscription.inscrireClient(request, response, clientManager, administrateurManager)){
                
                Connexion connexion = new Connexion();
                
                connexion.verifConnexion(request, response, clientManager);
                session.setAttribute("type_page","accueil");
                redirigerVersJSP(response);
            }else{
                
                session.setAttribute("type_page","inscription");
                redirigerVersJSP(response);
            }
            
            
        }else if(page.equals("/controleur/desinscription")){
                
            Client client = (Client)session.getAttribute("user_compte");
            commandeManager.deleteCommandeByClient(client.getIdentifiant());
            clientManager.deleteClient(client.getIdentifiant());  
            
            DeconnexionControleur deco= new DeconnexionControleur();
            deco.deconnecte(session);
            session.setAttribute("type_page","accueil");
            redirigerVersJSP(response);
            
        }else if(page.equals("/controleur/panier")){
                
            session.setAttribute("type_page","panier");
            redirigerVersJSP(response);
            
        }else if(page.equals("/controleur/ajouter_article")){
            Article article = articleManager.getArticle(Integer.parseInt(request.getParameter("id_article")));
            panier.addArticle(article);
            
            session.setAttribute("type_page","panier");
            redirigerVersJSP(response);
            
        }else if(page.equals("/controleur/diminuer_article")){
            Article article = articleManager.getArticle(Integer.parseInt(request.getParameter("id_article")));
            panier.reduceArticle(article);      
            
            session.setAttribute("type_page","panier");
            redirigerVersJSP(response);
            
        }else if(page.equals("/controleur/enlever_article")){
            Article article = articleManager.getArticle(Integer.parseInt(request.getParameter("id_article")));
            panier.deleteArticle(article);
            
            session.setAttribute("type_page","panier");
            redirigerVersJSP(response);
            
        }else if(page.equals("/controleur/accueil"))
        {
            session.setAttribute("type_page","accueil");
            redirigerVersJSP(response);
        }
        else if(page.equals("/controleur/article"))
        {
            Article article = articleManager.getArticle(Integer.parseInt(request.getParameter("id_article")));
            session.setAttribute("article", article);
            session.setAttribute("type_page","article");
            redirigerVersJSP(response);
            
        }else if(page.equals("/controleur/ajouter_panier")){
            
            Article article = new Article();
            article = articleManager.getArticle(Integer.parseInt(request.getParameter("id_article")));
            panier.addArticle(article);
            session.setAttribute("type_page","panier");
            
            redirigerVersJSP(response);
            
        }else if(page.equals("/controleur/admin")){
          
            response.sendRedirect("/GameStore/admin/index.jsp");
            
        }else if(page.equals("/connexion_admin")){ 
            if(administrateurManager.presenceAdministrateur(request.getParameter("identifiant"))){
                Connexion connexion = new Connexion();
                if(connexion.verifConnexionAdmin(request, response, administrateurManager)){
                    response.sendRedirect("/GameStore/admin/index.jsp");
                }else{
                    response.sendRedirect("/GameStore/admin/index.jsp");
                }
                
            }else{
                response.sendRedirect("/GameStore/admin/index.jsp");
            }
            
            
        }else if(page.equals("/ajouter_categorie")){
            
            Categorie categorie = categorieManager.getCategorie(request.getParameter("nomCategorie"));
            if(categorie == null){
                Categorie nouvelleCategorie = new Categorie(request.getParameter("nomCategorie"));
                categorieManager.addCategorie(nouvelleCategorie);
            }else{
                
            }
            response.sendRedirect("/GameStore/admin/index.jsp");
            
        }else if(page.equals("/ajouter_article")){
            try{
                String nom = request.getParameter("nomArticle");
                int prix = Integer.parseInt(request.getParameter("prixArticle"));
                String description = request.getParameter("descriptionArticle");
                String url = request.getParameter("imageArticle");
                Categorie NomCategorie = categorieManager.getCategorie(request.getParameter("nomCategorie"));

                Article nouvelArticle = new Article(0,nom,prix,description,url,NomCategorie);
                articleManager.addArticle(nouvelArticle);
            }catch(Exception e){
                response.sendRedirect("/GameStore/admin/index.jsp");
            }
            response.sendRedirect("/GameStore/admin/index.jsp");
        }else if(page.equals("/ajouter_administrateur")){
            String id = request.getParameter("identifiantAdmin");
            String mdp = request.getParameter("mdpAdmin");
            String mail = request.getParameter("mailAdmin");
            if(!clientManager.presenceClient(id) && !administrateurManager.presenceAdministrateur(id)){
                Administrateur admin = new Administrateur(id,mdp,mail);
                administrateurManager.addAdministrateur(admin);
            }else{
                //message : id déjà utilisé
            }
            
            response.sendRedirect("/GameStore/admin/index.jsp");
        }else if(page.equals("/supprimer_categorie")){
            String nom = request.getParameter("nomCategorie");
            categorieManager.deleteCategorie(nom);
            
            response.sendRedirect("/GameStore/admin/index.jsp");
        }else{            
            
            response.sendRedirect("/GameStore/page_not_found.jsp");
        }
 
    }
    
    private void redirigerVersJSP(HttpServletResponse resp)
    {
        try{
            resp.sendRedirect("/GameStore/index.jsp");
        }
        catch(Exception e)
        {
            e.printStackTrace();
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
