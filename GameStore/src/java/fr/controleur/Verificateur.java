/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package fr.controleur;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Verificateur {

    public Verificateur() {
    }
    
    public Boolean checkMail (String mail)
    {
        if(mail.equals("")) return false;
        Pattern p = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$");
        Matcher m = p.matcher(mail.toUpperCase());
        return m.matches();
    }
    
    public Boolean checkMdp (String mdp)
    {
        if(mdp.equals("")) return false;
        Pattern p = Pattern.compile("^[A-Z0-9._%+-!:;]$");
        Matcher m = p.matcher(mdp.toUpperCase());
        return m.matches();
    }
    
    public Boolean checkNom (String nom)
    {
        if(nom.equals("")) return false;
        Pattern p = Pattern.compile("[A-Z ]");
        Matcher m = p.matcher(nom.toUpperCase());
        return m.matches();
    }
    
    public Boolean checkPseudo (String pseudo)
    {
        if(pseudo.equals("")) return false;
        Pattern p = Pattern.compile("[A-Z0-9]");
        Matcher m = p.matcher(pseudo.toUpperCase());
        return m.matches();
    }
    
    public Boolean checkDate (String date)
    {
        if(date.equals("")) return false;
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(true);
        Date d = new Date();
        try{
            d=sdf.parse(date);
            String t = sdf.format(d);
            if(t.compareTo(date)!=0)
            {
                    throw new Exception("DATE ERREUR");
            }
        }
        catch (Exception e)
        {
            return false;
        }
        
        return true;
    }
}
