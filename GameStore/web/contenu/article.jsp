<%-- 
    Document   : article
    Created on : 22 mars 2014, 12:41:23
    Author     : Valdanial
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div id="bloc_article">
    <table id="table_article" class="table_pres">
        <tr>
            <th colspan="2"> <h1>${sessionScope.article.getNom()}</h1></th>
        </tr>
        <tr>
            <td>               
               
                <a href="${sessionScope.article.getUrlImage()}">
                    <img src="${sessionScope.article.getUrlImage()}"/>
                </a>                
                </br>
                Catégorie: ${sessionScope.article.getCategorie().getNom()} </br>
                Prix: ${sessionScope.article.getPrix()}€
            </td>
            <td>               
                    <p>${sessionScope.article.getDescription()}</p>
            </td>
        </tr>
    </table>
            <table>
                
                    <tr><th><div class="conteneur_icone">
                        <a href="/GameStore/controleur/ajouter_panier?id_article=${article.getId()}">
                        <div class="icone_panier"/></div>
                        </a>
                    </div></th>
                    <th><div class="conteneur_icone">
                       <a href="/GameStore/controleur/categorie?nom_categorie=${article.getCategorie().getNom()}">
                        <div class="bouton_retour"/></div>
                        </a>
                    </div></th></tr>
            </table>

</div>