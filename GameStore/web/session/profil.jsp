<%-- 
    Document   : profil
    Created on : 22 mars 2014, 16:40:22
    Author     : Karlak
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profil</title>
    </head>
    <body>
        
        <c:choose>
            <c:when test="${sessionScope.user_compte!=null}">
                <p>Indentifiant : <c:out value="${sessionScope.user_compte.getIdentifiant()}"></c:out></p>
                <p>E-mail : <c:out value="${sessionScope.user_compte.getMail()}"></c:out></p>
                <br/>
                <p>Nom : <c:out value="${sessionScope.user_compte.getNom()}"></c:out></p>
                <p>Prenom : <c:out value="${sessionScope.user_compte.getPrenom()}"></c:out></p>
                <p>Adresse : <c:out value="${sessionScope.user_compte.getAdresse()}"></c:out></p>
                <p>Date de Naissance : <c:out value="${sessionScope.user_compte.getNaissance()}"></c:out></p>
                <p>Sexe : <c:out value="${sessionScope.user_compte.getSexe()}"></c:out></p>

                <a href="/GameStore/controleur/Desinscription"><button type="submit">Se désinscrire</button></a>
            </c:when> 
            <c:otherwise>
                
                <jsp:include page="../page_not_found.jsp"/>
            </c:otherwise>
        </c:choose>
        
    </body>
</html>
