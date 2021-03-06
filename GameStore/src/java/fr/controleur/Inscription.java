/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package fr.controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import fr.entite.Client;
import fr.manager.AdministrateurManager;
import fr.manager.ClientManager;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Haynner
 */

public class Inscription{

    
    
    
    public Inscription(){
        
    }
        
    public boolean inscrireClient(HttpServletRequest request, HttpServletResponse response, ClientManager clientManager, AdministrateurManager administrateurManager){
    
        String identifiant = request.getParameter("identifiant");
        String mdp = request.getParameter("mdp");
        String email = request.getParameter("email");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String adresse = request.getParameter("adresse");
        String sexe = request.getParameter("sexe");
        String date_naissance = request.getParameter("jour_naissance")+"/"+request.getParameter("mois_naissance")+"/"+request.getParameter("annee_naissance");
        HttpSession session = request.getSession();

        Client client = new Client(identifiant,mdp,email,nom,prenom,adresse,date_naissance,sexe);

        if(!clientManager.presenceClient(identifiant) && !administrateurManager.presenceAdministrateur(identifiant)){
            if(!clientManager.presenceClientByMail(email)){
                if(clientManager.addClient(client)){
                    session.setAttribute("inscription","");
                    return true;
                }else{
                    session.setAttribute("inscription","un champ ne convient pas");
                    return false;
                }
            }else{
                session.setAttribute("inscription","email déjà associé à un compte");
                return false;
            }
        }else{
            session.setAttribute("inscription","identifiant déjà utilisé");
            return false;
        }       
    }

}
