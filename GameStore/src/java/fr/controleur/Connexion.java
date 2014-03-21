/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package fr.controleur;

import fr.entite.Client;
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
    private boolean connecte = false;
    private String champ_mdp = "mdp";
    
   public Connexion(HttpServletRequest request, HttpServletResponse response, ClientManager clientManager)
            throws ServletException, IOException {
       
        Client client = null;
        client = clientManager.getClient(request.getParameter("id"));
        String nomUtilisateur = client.getNom();
        HttpSession session = request.getSession(true);
        
        if(client != null){
            if(client.getMdp().equals(request.getParameter(champ_mdp))){
                connecte = true;
                session.setAttribute("sessionClient",client);
                session.setAttribute("nom_utilisateur",nomUtilisateur);    
            }
                       
        }else{
            session.setAttribute("sessionClient",null);
            session.setAttribute("nom_utilisateur",null);
        }

        request.setAttribute("client", client);
        request.setAttribute("nom_utilisateur", nomUtilisateur);
        
        
    }
   
   public boolean getConnecte(){
       return this.connecte;
   }
}
