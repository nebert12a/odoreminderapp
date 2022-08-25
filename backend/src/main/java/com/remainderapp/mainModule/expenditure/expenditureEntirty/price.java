package com.remainderapp.mainModule.expenditure.expenditureEntirty;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
@Entity
@Table(name="price_Table")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class price {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "priceId")
    @SequenceGenerator(name = "priceId", sequenceName = "priceId", allocationSize = 1)
    @Column(name = "id", nullable = false)
    private Long id;
    @Column(name="initial_price")
    @NotBlank
    @NonNull
    @NotEmpty
    Double initialPrice;

}
