package fr.entite;

/**
 *
 * @author Karlak
 */
public class Categorie {
    private int id;
    private String nom;

    public Categorie() {
        this.id = 0;
        this.nom = "non defini";
    }

    public Categorie(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
    
    
}
