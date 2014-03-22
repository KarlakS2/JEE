/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package fr.controleur;

import fr.entite.Administrateur;
import fr.entite.Client;
import fr.manager.AdministrateurManager;
import fr.manager.ClientManager;
import java.io.IOException;
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
public class Connexion {
    private String champ_mdp = "mdp";
    private String champ_id = "identifiant";
    
   public Connexion(){
   }
   
   public boolean verifConnexion(HttpServletRequest request, HttpServletResponse response, ClientManager clientManager){
       boolean connecte = false;
       
       
        Client client = clientManager.getClient(request.getParameter(champ_id));
        HttpSession session = request.getSession(true);
        if(client != null){
            if(client.getMdp().equals(request.getParameter(champ_mdp))){
                connecte = true;
                session.setAttribute("user_compte",client);  
                session.setAttribute("nom_utilisateur",client.getIdentifiant());
            }
                       
        }else{
            session.setAttribute("user_compte",null);
            session.setAttribute("nom_utilisateur",null);
            connecte = false;
        }        
        return connecte;
    }
   
   public boolean verifConnexionAdmin(HttpServletRequest request, HttpServletResponse response, AdministrateurManager administrateurManageur){
       boolean connecte = false;
       
        Administrateur admin = administrateurManageur.getAdmin(request.getParameter(champ_id));
        HttpSession session = request.getSession(true);
        if(admin != null){
            if(admin.getMdp().equals(request.getParameter(champ_mdp))){
                connecte = true;
                session.setAttribute("user_compte",admin);  
                session.setAttribute("nom_utilisateur",admin.getIdentifiant());
                boolean adminb = true;
                session.setAttribute("administrateur", adminb);
            }
                       
        }else{
            session.setAttribute("user_compte",null);
            session.setAttribute("nom_utilisateur",null);
            connecte = false;
        }        
        return connecte;
    }
}
