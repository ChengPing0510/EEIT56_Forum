package sixteam.t6_10.securitymodel;

import java.sql.Blob;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "USERNAME")
    private String userName;

    private String password;
    private boolean active;
    private String roles;
    private Blob img;
    private String email;

    public User() {
        super();
    }

    public User(String userName, String password, boolean active, String roles) {
        super();
        this.userName = userName;
        this.password = password;
        this.active = active;
        this.roles = roles;
    }

    public User(String userName, String password, boolean active, String roles, Blob img, String email) {
        super();
        this.userName = userName;
        this.password = password;
        this.active = active;
        this.roles = roles;
        this.img = img;
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Blob getImg() {
        return img;
    }

    public void setImg(Blob img) {
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }
}
