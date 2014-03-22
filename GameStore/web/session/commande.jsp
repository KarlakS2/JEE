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
        <style type="text/css">
            .commande{
                background-color: #CCFFFF;
            }
            
            .icone_delete{
                display: inline-block;
                height: 40px;
                width:40px;
                background-image: url("/GameStore/image/delete.png");
            }
            
        </style>
        <title>Mes commandes</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.user_compte!=null}">
                <table class="commande">
                    
                    <TR> 
                        <TH> Numero Commande </TH> 
                        <TH> Article </TH> 
                        <TH> Prix </TH> 
                        <TH> Annuler </TH> 
                    </TR>
                    
                    <c:forEach var="commande" items="${sessionScope.commandes}">  
                        <TR> 
                            <TD> <c:out value="${commande.getId()}"/> </TD> 
                            <TD> <c:out value="${commande.getArticle().getNom()}"/> </TD> 
                            <TD> <c:out value="${commande.getClient.getNom()}"/> </TD> 
                            <TD> 
                            <a href="/GameStore/controleur/enlever_commande?id_commande=${requestScope.commande.getId()}">
                            <div class="icone_delete"></div></a> 
                            </TD> 
                         </TR>
                     </c:forEach> 
                     
                </table>
            </c:when> 
            <c:otherwise>
                
                <jsp:include page="../page_not_found.jsp"/>
            </c:otherwise>
        </c:choose>
    </body>
</html>
