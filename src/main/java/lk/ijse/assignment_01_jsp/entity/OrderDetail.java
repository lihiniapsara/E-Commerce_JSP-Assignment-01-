package lk.ijse.assignment_01_jsp.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "order_id", nullable = false) // Specify the foreign key column
    private Orders order;

    @ManyToOne
    @JoinColumn(name = "product_id", nullable = false) // Specify the foreign key column
    private Product product;

    private int quantity;

    private double price;
}
