package fr.entite;

/**
 *
 * @author Karlak
 */
public class Administrateur {
    private String identifiant;
    private String mdp;
    private String mail;

    public Administrateur() {
        this.identifiant = "non defini";
        this.mdp = "non defini";
        this.mail = "non defini";
    }

    public Administrateur(String identifiant, String mdp, String mail) {
        this.identifiant = identifiant;
        this.mdp = mdp;
        this.mail = mail;
    }

    public String getIdentifiant() {
        return identifiant;
    }

    public void setIdentifiant(String identifiant) {
        this.identifiant = identifiant;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }
    
    
}
