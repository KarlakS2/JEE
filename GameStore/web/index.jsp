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
    <link rel="stylesheet" href="css/categories.css" />
    <link rel="stylesheet" href="css/articles.css" />
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Game Store</title>
    </head>
    <body>
        <header>
        <img src="image/logo.png" class="Logo"></img>
        
        <nav class="Menu" >Menu
        
        <div class="Connexion" >
            <p>Se connecter</p>
            <form action="ServletControleur" method="post">
                <label for="identifiant"></label>
                <input type="text" name="identifiant" id="identifiant" placeholder="identifiant"/>
                <label for="mdp"></label>
                <input type="password" name="mdp" id="mdp" placeholder="mot de passe"/>
                <input type="submit" value="Valider">
            </form>
        </div>
        </nav>
        
        
        </header>
        
        
        
        <nav class="Categories" >
             <div class="element_menu">
		<h3>Catégories</h3>
		<ul>
		<li><a href="index.jsp">Accueil</a></li>
		</div></nav>
        
        <section><div  class="Articles">Articles</div></section>
        
        
    </body>
</html>
