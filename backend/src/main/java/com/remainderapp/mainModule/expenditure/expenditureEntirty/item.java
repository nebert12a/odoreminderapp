
package com.remainderapp.mainModule.expenditure.expenditureEntirty;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.time.LocalDate;
import java.util.*;

@Entity
@Table(name="item_Table")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class item {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "itemId")
    @SequenceGenerator(name = "itemId", sequenceName = "itemId", allocationSize = 1)
    @Column(name = "id", nullable = false)
    private Long id;
    @Column(name="item_name")
    @NotBlank
    @NonNull
    @NotEmpty
    String name;
    @Column(name="date_added")
    LocalDate addedDate= LocalDate.now();
    @ManyToMany(mappedBy = "items")
    protected List<category> categories = new ArrayList<>();

}
