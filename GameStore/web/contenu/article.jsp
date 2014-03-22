<%-- 
    Document   : article
    Created on : 22 mars 2014, 12:41:23
    Author     : Valdanial
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div id="bloc_article">
    <table id="table_article">
        <tr>
            <td>               
                <h1>${sessionScope.article.getNom()}</h1>
                <a href="${sessionScope.article.getUrlImage()}">
                    <img src="${sessionScope.article.getUrlImage()}"/>
                </a>                
            </td>
            <td>               
                    <p>${sessionScope.article.getDescription()}</p>
            </td>
        </tr>
    
    </table>
</div>