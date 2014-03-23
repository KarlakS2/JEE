<%-- 
    Document   : connexion.jsp
    Created on : 20 mars 2014, 15:51:37
    Author     : Valdanial
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="css/connexion.css" />
<html>
       
       <form action="/GameStore/controleur/valider_connexion" method="post">
           <label for="identifiant"></label>
           <input type="text" name="identifiant" id="identifiant" placeholder="Identifiant" required/>
           <label for="mdp"></label></br>
           <input type="password" name="mdp" id="mdp" placeholder="Mot de passe" required/>
           <input type="submit" value="Valider">
       </form>       

</html>
