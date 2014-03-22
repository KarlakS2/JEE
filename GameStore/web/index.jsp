<%-- 
    Document   : index
    Created on : 20 mars 2014, 09:23:21
    Author     : Valdanial
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<!DOCTYPE html>
<html>

    <link rel="stylesheet" href="css/logo.css" />
    <link rel="stylesheet" href="css/menu.css" />
    <link rel="stylesheet" href="css/articles.css" />
    <link rel="stylesheet" href="css/categories.css" />
    <link rel="stylesheet" href="css/contenu.css" />
    <link rel="stylesheet" href="css/inscription.css" />
    <link rel="stylesheet" href="css/panier.css" />
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Game Store</title>
    </head>
    <body>
        <header>
            <a href="./controleur/accueil"><img src="image/logo.png" class="Logo" id="Logo"></img></a>
        
             <jsp:include page="session/espace_perso.jsp"/>
        </header>
             
        <jsp:include page="categories/categories.jsp"/>
        <div class="Contenu">
            <c:if test="${not empty sessionScope.type_page}">
                <c:choose>
                    <c:when test="${sessionScope.type_page=='accueil'}">
                        <jsp:include page="contenu/accueil.jsp"/>
                    </c:when>
                    <c:when test="${sessionScope.type_page=='inscription'}">
                        <jsp:include page="session/inscription.jsp"/>
                    </c:when>
                    <c:when test="${sessionScope.type_page=='connexion'}">
                        <jsp:include page="session/connexion.jsp"/>
                    </c:when>
                    <c:when test="${sessionScope.type_page=='panier'}">
                        <jsp:include page="session/panier.jsp"/>
                    </c:when>
                    <c:when test="${sessionScope.type_page=='accueil'}">
                        <jsp:include page="contenu/accueil.jsp"/>
                    </c:when>
                    <c:when test="${sessionScope.type_page=='acces_restreint'}">
                        <jsp:include page="session/acces_restreint.jsp"/>
                    </c:when>
                    <c:when test="${sessionScope.type_page=='articles'}">
                        <jsp:include page="contenu/articles.jsp"/>
                    </c:when>
                    <c:otherwise>
                        <jsp:include page="page_not_found.jsp"/>
                    </c:otherwise>
                </c:choose>
            </c:if>
            </div>       
            <footer>
        
        <form action="ServletTest" method="post">
            <input type="submit" value="ServletTest">
        </form>
            </footer>
    </body>
    
</html>