/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package fr.controleur;

import javax.servlet.http.HttpSession;

/**
 *
 * @author Haynner
 */
public class DeconnexionControleur {
    public DeconnexionControleur(){
        
    }
    
    public void deconnecte(HttpSession session){
        session.setAttribute("user_compte",null);  
        session.setAttribute("nom_utilisateur",null);
    }
}
