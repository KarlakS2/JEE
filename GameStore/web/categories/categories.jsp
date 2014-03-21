<%-- 
    Document   : categories
    Created on : 20 mars 2014, 16:00:32
    Author     : Valdanial
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Game Store</title>
    </head>
    <nav class="Categories" >
        <div class="element_menu">
           <h3>Catégories</h3>
           
           <%
               List<String> liste_categories = (List<String>) request.getAttribute("categories");
               if(liste_categories!=null)
               {
                    for(String s: liste_categories)
                    {
                        out.println("<li><a href=\"/categorie="+s+"\">Index</a></li>");
                    }
               }
           %>
        </div>
    </nav>
</html>
