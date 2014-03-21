<%-- 
    Document   : index
    Created on : 20 mars 2014, 09:23:21
    Author     : Valdanial
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%
        if(request.getParameter("first_coming")!=null)
        {
            response.sendRedirect("/first_coming");
        }
    %>
    <link rel="stylesheet" href="css/logo.css" />
    <link rel="stylesheet" href="css/menu.css" />
    <link rel="stylesheet" href="css/articles.css" />
    <link rel="stylesheet" href="css/categories.css" />
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
        
            <jsp:include page="categories/categories.jsp" flush="true"/>
        
            <%    
                String type_page = request.getParameter("type_page");
                if(type_page==null)
                {
                    out.println("C'est null");
                }
                else if(type_page.equals("accueil"))
                {
                    out.println("<jsp:include page=\"contenu/accueil.jsp\" flush=\"true\"/>");
                }
                else if(type_page.equals("connexion"))
                {
                    out.println("<jsp:include page=\"session/connexion.jsp\" flush=\"true\"/>");
                }
                else if(type_page.equals("inscription"))
                {
                    out.println("<jsp:include page=\"session/inscription.jsp\" flush=\"true\"/>");
                }
                else if(type_page.equals("panier"))
                {
                    out.println("<jsp:include page=\"session/panier.jsp\" flush=\"true\"/>");
                }
                else if(type_page.equals("acces_restreint"))
                {
                    out.println("<jsp:include page=\"session/acces_restreint.jsp\" flush=\"true\"/>");
                }
                else if(type_page.equals("articles"))
                {
                    out.println("<jsp:include page=\"session/articles.jsp\" flush=\"true\"/>");
                }
                else
                {
                    response.sendRedirect("/page_not_found.jsp");
                }
            %>
            
            
            <footer>
        
        <form action="ServletTest" method="post">
            <input type="submit" value="ServletTest">
        </form>
            </footer>
    </body>
    
</html>