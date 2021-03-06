<%-- 
    Document   : commande
    Created on : 22 mars 2014, 17:21:25
    Author     : Karlak
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                   
        <title>Mes commandes</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.user_compte!=null}">
                <div id="bloc_panier">   
                <h1 id="titre_panier">Mes Commandes</h1>
                
                <table class="table_pres">
                    <tr>
                       <th>Numéro commande</th>
                       <th>Article</th>
                       <th>Prix</th>
                       <th>Annuler</th>
                    </tr>
                    
                    <c:forEach var="commande" items="${sessionScope.commandes}">  
                        
                        
                        <TR> 
                            <TD> <c:out value="${commande.getId()}"/> </TD> 
                            <TD> <c:out value="${commande.getArticle().getNom()}"/> </TD> 
                            <TD> <c:out value="${commande.getArticle().getPrix()}"/>€ </TD> 
                            <TD> 
                            <a href="/GameStore/controleur/enlever_commande?id_commande=<c:out value="${commande.getId()}"/>">
                            <div class="icone_delete"></div></a> 
                            </TD> 
                         </TR>
                     </c:forEach> 
                     
                </table>
                </div>
            </c:when> 
            <c:otherwise>
                
                <jsp:include page="../page_not_found.jsp"/>
            </c:otherwise>
        </c:choose>
    </body>
</html>
