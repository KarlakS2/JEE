<%-- 
    Document   : espace_perso
    Created on : 21 mars 2014, 15:22:57
    Author     : Valdanial
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    /*if(session.getAttribute("nom_utilisateur")!=null)
    {
        String sortie = "<p>Connecte en tant que ";
        sortie+=session.getAttribute("nom_utilisateur");
        sortie+="</p></br>";
        sortie+="<a href=./controleur/deconnexion>Se deconnecter</a>";
        out.println(sortie);
    }
    else
    {
        out.println("<a href=\"./controleur/connexion\">Se connecter</a>");
    }   */
%>

<div class="Menu">
    <c:choose>
        <c:when test="${not empty requestScope.nom_utilisateur}">
            <p>Connecté en tant que <c:out value="${requestScope.nom_utilisateur}"/> </p>
            </br>
            <a href=./controleur/profil>Profil</a>
            <a href=./controleur/panier>Mon Panier</a>
            <a href=./controleur/commandes>Mes Commandes</a>
            <a href=./controleur/deconnexion>Se deconnecter</a>
        </c:when>
        <c:otherwise>
            <a href="controleur/connexion">Se connecter</a>
            
        </c:otherwise>
    </c:choose>
</div>