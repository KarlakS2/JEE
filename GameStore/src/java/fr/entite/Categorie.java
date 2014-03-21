package fr.entite;

/**
 *
 * @author Karlak
 */
public class Categorie {
    private String nom;

    public Categorie() {
        this.nom = "non defini";
    }

    public Categorie(String nom) {
        this.nom = nom;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    @Override
    public String toString() {
        return "Categorie{, nom=" + nom + '}';
    }
    
    
}
