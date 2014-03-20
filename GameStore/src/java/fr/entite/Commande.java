
package fr.entite;

/**
 *
 * @author Karlak
 */
public class Commande {
    private int id;
    private Client client;
    private Article article;

    public Commande(int id, Client client, Article article) {
        this.id = id;
        this.client = client;
        this.article = article;
    }

    public Commande() {
        this.id = id;
        this.client = new Client();
        this.article = new Article();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    @Override
    public String toString() {
        return "Commande{" + "id=" + id + ", client=" + client + ", article=" + article + '}';
    }
    
    
}
