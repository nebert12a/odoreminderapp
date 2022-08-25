package com.remainderapp.mainModule.expenditure.expenditureEntirty;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;

@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "address")
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "addressSequence")
    @SequenceGenerator(name = "addressSequence", sequenceName = "addressSequence", allocationSize = 1)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "shop_name")
    private String shopName;

    @Column(name = "street_name")
    private String streetName;

    @Column(name = "shop_phone_number")
    private String phoneNumber;

    @Column(name = "owner_name")
    private String ownerName;


}