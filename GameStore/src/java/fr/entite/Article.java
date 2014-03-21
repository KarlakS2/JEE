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
    private Categorie categorie;

    public Article(int id, String nom, String prix, String description, String urlImage, Categorie categorie) {
        this.id = id;
        this.nom = nom;
        this.prix = prix;
        this.description = description;
        this.urlImage = urlImage;
        this.categorie = categorie;
    }

    public Article() {
        this.id = 0;
        this.nom = "non defnini";
        this.prix = "non defnini";
        this.description = "non defnini";
        this.urlImage = "non defnini";
        this.categorie = new Categorie();
    }

    
    
    
    public Categorie getCategorie() {
        return categorie;
    }

    public void setCategorie(Categorie categorie) {
        this.categorie = categorie;
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
        return "Article{" + "id=" + id + ", nom=" + nom + ", prix=" + prix + ", description=" + description + ", urlImage=" + urlImage + ", categorie=" + categorie + '}';
    }

    
    
    public String toStringSQL() {
        return "('" + nom + "','" + prix + "','" + description + "','" + urlImage + "')";
    }
    
    
    
}
