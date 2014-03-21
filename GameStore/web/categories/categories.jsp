<%-- 
    Document   : categories
    Created on : 20 mars 2014, 16:00:32
    Author     : Valdanial
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="fr.entite.Categorie"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <nav class="Categories" >
        <div class="element_menu">
           <h3>Catégories</h3>
           
           <ul>
           <c:forEach var="categorie" items="${sessionScope.categories}">
                
                    <a href="/GameStore/controleur/categorie/?nom_categorie=${categorie.getNom()}">
                        <div class='inner'>${categorie.getNom()}</div>
                    </a>   
            </c:forEach>  
               </ul>         
        
        </nav>
    </div>
