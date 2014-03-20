
package fr.entite;

/**
 *
 * @author Karlak
 */
public class Client {
    private String identifiant;
    private String mdp;
    private String mail;
    private String nom;
    private String prenom;
    private String adresse;
    private String naissance;
    private String sexe; // 0 = homme , 1= femme
    
    public Client()
    {
        identifiant = "non defini";
        mdp ="";
        mail = "non defini";
        nom = "non defini";
        prenom = "non defini";
        adresse = "non defini";
        naissance = "non defini";
        sexe = "non defini";
    }
    
    public Client(   String pid,
                     String pmdp,
                     String pmail,
                     String pnom,
                     String pprenom,
                     String padresse,
                     String pnaissance,
                     String psexe)
    {
        identifiant = pid;
        mdp =pmdp;
        mail = pmail;
        nom = pnom;
        prenom = pprenom;
        adresse = padresse;
        naissance = pnaissance;
        sexe = psexe;
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

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getNaissance() {
        return naissance;
    }

    public void setNaissance(String naissance) {
        this.naissance = naissance;
    }

    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    @Override
    public String toString() {
        return "Client{" + "identifiant=" + identifiant + ", mail=" + mail + ", nom=" + nom + ", prenom=" + prenom + ", adresse=" + adresse + ", naissance=" + naissance + ", sexe=" + sexe + '}';
    }
    
    public String toStringSQL() {
        return "('"+ identifiant + "','" + mdp +"','" + mail + "','" + nom + "','" + prenom + "','" + adresse + "','" + naissance + "','" + sexe + "')";
    }
    
    
    
    
}
