<%-- 
    Document   : espace_perso
    Created on : 21 mars 2014, 15:22:57
    Author     : Valdanial
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<div class="Menu">
    <c:choose>
        <c:when test="${requestScope.nom_utilisateur!=null}">
            <p>Connecté en tant que <c:out value="${requestScope.nom_utilisateur}"/> </p>
            </br>
            <a href=./controleur/profil>Profil</a>
            <a href=./controleur/panier>Mon Panier</a>
            <a href=./controleur/commandes>Mes Commandes</a>
            <a href=./controleur/deconnexion>Se deconnecter</a>
        </c:when>
        <c:otherwise>
            <a href=./controleur/panier>Mon Panier</a>
            <a href="./controleur/inscription">Inscription</a>
            <a href="./controleur/connexion">Se connecter</a>
            
        </c:otherwise>
    </c:choose>
</div>