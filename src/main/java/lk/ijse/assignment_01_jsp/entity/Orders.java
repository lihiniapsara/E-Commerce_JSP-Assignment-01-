package lk.ijse.assignment_01_jsp.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@NoArgsConstructor
@Getter
@Setter
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    private double total;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false) // Specify the foreign key column
    private User user;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<OrderDetail> orderDetail;

    public Orders(long id, double total, User user) {
        this.id = id;
        this.total = total;
        this.user = user;
    }
}
