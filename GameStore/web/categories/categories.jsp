<%-- 
    Document   : categories
    Created on : 20 mars 2014, 16:00:32
    Author     : Valdanial
--%>

<%@page import="fr.entite.Categorie"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <nav class="Categories" >
        <div class="element_menu">
           <h3>Catégories</h3>
           
           <%
               List<Categorie> liste_categories = (List<Categorie>) session.getAttribute("categories");
               if(liste_categories!=null)
               {
                   out.println("<ul>");
                    for(Categorie c: liste_categories)
                    {
                        out.println("<a href=\"/GameStore/controleur/categorie/?nom_categorie="+c.getNom()+"\"><div class='inner'>"+c.getNom()+"</div></a>");
                    }
                    out.println("</ul>");
               }
           %>
        </div>
    </nav>

