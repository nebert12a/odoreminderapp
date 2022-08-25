package com.remainderapp.mainModule.expenditure.expenditureRepository;

import com.remainderapp.mainModule.expenditure.expenditureEntirty.item;
import org.springframework.data.jpa.repository.JpaRepository;

public interface expenditureRepository extends JpaRepository<item, Long> {
}
