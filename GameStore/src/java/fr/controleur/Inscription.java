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
import fr.manager.ClientManager;

/**
 *
 * @author Haynner
 */

public class Inscription{

    public Inscription(){
        
    }
        
    public boolean inscrireClient(HttpServletRequest request, HttpServletResponse response, ClientManager clientManager){
    
       String date_naissance = request.getParameter("jour_naissance")+" "+request.getParameter("mois_naissance")+" "+request.getParameter("annee_naissance");

        Client client = new Client(request.getParameter("identifiant"),request.getParameter("mdp"),request.getParameter("mail"),request.getParameter("nom"),request.getParameter("prenom"),request.getParameter("adresse"),date_naissance,request.getParameter("sexe"));
        clientManager.addClient(client);
        return true;
    }

}
