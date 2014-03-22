<%-- 
    Document   : inscription.jsp
    Created on : 20 mars 2014, 15:54:57
    Author     : Valdanial
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="Formulaire">
    <form action="/GameStore/controleur/valider_inscription">
        <label>Nom d'utilisateur:</label> <input class="element_formulaire" type='text' name='user' placeholder="Nom d'utilisateur" required></br>
        <label>Mot de passe:</label> <input class="element_formulaire" type='password' name='password' placeholder="Mot de passe" required></br>
        <label>Email:</label> <input class="element_formulaire" type='email' name='email' placeholder="Adresse email" required></br>
        <label>Nom:</label> <input class="element_formulaire" type='text' name='nom' placeholder="Nom"></br>
        <label>Prénom:</label> <input class="element_formulaire" type='text' name='prenom' placeholder="Prénom"></br>
        <label>Date de naissance:</label>
        
        <label for="jour_naissance">Jour</label>
        <select name='jour_naissance' id="jour_naissance">
        
            <c:forEach var="i" begin="1" end="31" step="1">
                
                <option value=<c:out value="${i}"/>><c:out value="${i}"/></option>}
            </c:forEach>
            
        </select>
        
        <label for="mois_naissance">Mois</label>
        <select name='mois_naissance' id="mois_naissance">
        
                <option value="1">Janvier</option>}
                <option value="2">Février</option>}
                <option value="3">Mars</option>}
                <option value="4">Avril</option>}
                <option value="5">Mai</option>}
                <option value="6">Juin</option>}
                <option value="7">Juillet</option>}
                <option value="8">Août</option>}
                <option value="9">Septembre</option>}
                <option value="10">Octobre</option>}
                <option value="11">Novembre</option>}
                <option value="12">Décembre</option>}
                
            
        </select>
        
        <label for="annee_naissance">Année</label>
        <select name='annee_naissance' id="annee_naissance">
        
            <c:forEach var="i" begin="1900" end="2014" step="1">
                
                <option value=<c:out value="${i}"/>><c:out value="${i}"/></option>}
            </c:forEach>
            
        </select>
        </br>
        
        <label>Adresse</label> <input class="element_formulaire" type='text' name='adresse' placeholder="Adresse"></br>
        <label>Sexe:</label><input class="element_formulaire" type='radio' name='sexe' value="H" checked id="sexe_homme"> <label for="sexe_homme">Homme</label></br>
        <input class="element_formulaire" type='radio' name='sexe' id="sexe_femme"> <label for="sexe_femme">Femme</label>
        <input type ="submit" class="element_formulaire" value="Terminer l'inscription">
    </form>
</div>