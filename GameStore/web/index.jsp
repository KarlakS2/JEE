<%-- 
    Document   : index
    Created on : 20 mars 2014, 09:23:21
    Author     : Valdanial
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="css/logo.css" />
    <link rel="stylesheet" href="css/menu.css" />
    <link rel="stylesheet" href="css/articles.css" />
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Game Store</title>
    </head>
    <body>
        <header>
            <img src="image/logo.png" class="Logo"></img>
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
                }   
             %>
        </div>
        </div>
        
        
        </header>
        
        
        
             <jsp:include page="categories/categories.jsp" flush="true"/>
        
        <section><div  class="Articles">Articles</div></section>
        
        
    </body>
</html>