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

public class Inscription extends HttpServlet {

    protected Inscription(HttpServletRequest request, HttpServletResponse response, ClientManager clientManager){
        response.setContentType("text/html;charset=UTF-8");
        
        Client client = new Client(request.getParameter("id"),request.getParameter("mdp"),request.getParameter("mail"),request.getParameter("nom"),request.getParameter("prenom"),request.getParameter("adresse"),request.getParameter("date_de_naissance"),request.getParameter("sexe"));
        clientManager.addClient(client);
    }

}
