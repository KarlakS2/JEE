<%-- 
    Document   : index
    Created on : 21 mars 2014, 12:52:14
    Author     : Valdanial
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/logo.css" />
        <link rel="stylesheet" href="admin.css" />
        <title>Game Store - Admin Page</title>
    </head>
    <header>
            <a href=".././controleur/accueil">
                <div id="Logo"></div>
                <div id="reste_du_header">
                </div>
            </a>
    </header>
    <body>
        
        
                <c:choose>
                    <c:when test="${sessionScope.administrateur==true}">
        <h1>Bienvenue sur la page d'administration!</h1>
        
        
        <form action="/ajouter_categorie" method="post">
            <fieldset>
                <legend>Ajouter Categorie</legend>
                       <label for="nomCategorie" > Nom de la Catégorie </label> <input type="text" name="nomCategorie"/><br/>
                       <input type="submit" value="OK"/>
            </fieldset> 
        </form>
        
        <form action="/ajouter_article" method="post">
            <fieldset>
                <legend>Ajouter Article</legend>
                       <label for="nomArticle" > Nom de l'article </label> <input type="text" name="nomArticle"/><br/>
                       <label for="prixArticle" > Prix de l'article (€) </label> <input type="text" name="prixArticle"/><br/>
                       <label for="descriptionArticle" > Description de l'article </label> <textarea type="text" name="descriptionArticle"></textarea><br/>
                       <label for="imageArticle" > Image de l'article </label> <input type="text" name="imageArticle"/><br/>
                       <label for="categorieArticle" > Categorie de l'article </label> <input type="text" name="categorieArticle"/><br/>
                       <input type="submit" value="OK"/>
            </fieldset> 
        </form>
        
        <form action="/ajouter_administrateur" method="post">
            <fieldset>
                <legend>Ajouter Administrateur</legend>
                       <label for="identifiantAdmin" > Identifiant </label> <input type="text" name="identifiantAdmin"/><br/>
                       <label for="mdpAdmin" > Mot de passe </label> <input type="text" name="mdpAdmin"/><br/>
                       <label for="mailAdmin" > Mail </label> <input type="text" name="mailAdmin"/><br/>
                       <input type="submit" value="OK"/>
            </fieldset> 
        </form>
        
        <form action="/supprimer_categorie" method="post">
            <fieldset>
                <legend>Supprimer Categorie</legend>
                       <label for="nomCategorie" > Nom de la Catégorie </label> 
                       <select name='nomCategorie' >
                            <c:forEach var="categorie" items="${sessionScope.categories}">
                                <option value=<c:out value="${categorie.getNom()}"/>><c:out value="${categorie.getNom()}"/></option>}
                            </c:forEach>
                        </select>
                       <input type="submit" value="OK"/>
            </fieldset> 
        </form>
        </c:when>
           
                    <c:otherwise>
        <form action="/connexion_admin" method="post">
            <fieldset>
                <legend>Connexion Admin</legend>
                <input type="text" name="identifiant" placeholder="Identifiant"/><br/>
                <input type="text" name="mdp" placeholder="Mot de passe"/><br/>
                <input type="submit" value="OK"/>
            </fieldset> 
        </form>
                    </c:otherwise>
   </c:choose>
        
    </body>
</html>
