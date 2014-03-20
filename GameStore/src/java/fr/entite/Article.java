package fr.entite;

/**
 *
 * @author Karlak
 */
public class Article {
    private int id;
    private String nom;
    private String prix;
    private String description;
    private String urlImage;

    public Article(int id, String nom, String prix, String description, String urlImage) {
        this.id = id;
        this.nom = nom;
        this.prix = prix;
        this.description = description;
        this.urlImage = urlImage;
    }
    public Article() {
        this.id = 0;
        this.nom = "non defini";
        this.prix = "non defini";
        this.description = "non defini";
        this.urlImage = "non defini";
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

    public String getPrix() {
        return prix;
    }

    public void setPrix(String prix) {
        this.prix = prix;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    @Override
    public String toString() {
        return "Article{" + "id=" + id + ", nom=" + nom + ", prix=" + prix + ", description=" + description + ", urlImage=" + urlImage + '}';
    }
    
    public String toStringSQL() {
        return "('" + nom + "','" + prix + "','" + description + "','" + urlImage + "')";
    }
    
    
    
}
