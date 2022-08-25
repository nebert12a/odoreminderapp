package com.remainderapp.mainModule.expenditure.expenditureEntirty;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
@Entity
@Table(name="info_table")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class info {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "info_id")
    @SequenceGenerator(name = "info_id", sequenceName = "info_id", allocationSize = 1)
    @Column(name = "id", nullable = false)
    private Long id;
    @Column(name="date_added")
    @NotBlank
    @NonNull
    @NotEmpty
    Long itemInfo;
    @Column(name = "dealer_name")
    private String dealerName;

}
