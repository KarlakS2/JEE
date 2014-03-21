<%-- 
    Document   : index
    Created on : 20 mars 2014, 09:23:21
    Author     : Valdanial
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<!DOCTYPE html>
<html>
    <%
        if(session.getAttribute("first_coming")==null)
        {
            //response.sendRedirect("/first_coming");
        }
    %>
    <link rel="stylesheet" href="css/logo.css" />
    <link rel="stylesheet" href="css/menu.css" />
    <link rel="stylesheet" href="css/articles.css" />
    <link rel="stylesheet" href="css/categories.css" />
    <link rel="stylesheet" href="css/contenu.css" />
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Game Store</title>
    </head>
    <body>
        <header>
            <img src="image/logo.png" class="Logo" id="Logo"></img>
        <div class="Menu" >Menu
        <div class="Connexion" >
            <% 
                if(session.getAttribute("nom_utilisateur")!=null)
               {
                    String sortie = "<p>Connecte en tant que ";
                    sortie+=session.getAttribute("nom_utilisateur");
                    sortie+="</p></br>";
                    sortie+="<a href=./deconnexion>Se deconnecter</a>";
                    out.println(sortie);
                }
                else
                {
                    out.println("<a href=\"./connexion\">Se connecter</a>");
                }   
             %>
        </div>
        </div>
        </header>
             
        <jsp:include page="categories/categories.jsp"/>
            <div class="Contenu">
                <c:choose>
                    <c:when test="${param.type_page=='accueil'}">
                        <jsp:include page="contenu/accueil.jsp"/>
                    </c:when>
                    <c:when test="${param.type_page=='inscription'}">
                        <jsp:include page="session/inscription.jsp"/>
                    </c:when>
                    <c:when test="${param.type_page=='connexion'}">
                        <jsp:include page="session/connexion.jsp"/>
                    </c:when>
                    <c:when test="${param.type_page=='panier'}">
                        <jsp:include page="session/panier.jsp"/>
                    </c:when>
                    <c:when test="${param.type_page=='accueil'}">
                        <jsp:include page="contenu/accueil.jsp"/>
                    </c:when>
                    <c:when test="${param.type_page=='acces_restreint'}">
                        <jsp:include page="session/acces_restreint.jsp"/>
                    </c:when>
                    <c:when test="${param.type_page=='articles'}">
                        <jsp:include page="contenu/articles.jsp"/>
                    </c:when>
                    <c:otherwise>
                        <jsp:include page="page_not_found.jsp"/>
                    </c:otherwise>
                </c:choose>
            </div>       
            <footer>
        
        <form action="ServletTest" method="post">
            <input type="submit" value="ServletTest">
        </form>
            </footer>
    </body>
    
</html>