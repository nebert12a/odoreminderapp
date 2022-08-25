package com.remainderapp.mainModule.expenditure.expenditureEntirty;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name="category_Table")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class category {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "categoryId")
    @SequenceGenerator(name = "categoryId", sequenceName = "categoryId", allocationSize = 1)
    @Column(name = "id", nullable = false)
    private Long id;

    public category(@NonNull String name) {
        this.name = name;
    }

    @Column(name="category_name")
    @NotBlank
    @NonNull
    @NotEmpty
    String name;
    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(
            name = "CATEGORY_ITEM",
            joinColumns = @JoinColumn(name = "CATEGORY_ID"),
            inverseJoinColumns = @JoinColumn(name = "id")
    )
    protected List<item> items = new ArrayList<>();

}
