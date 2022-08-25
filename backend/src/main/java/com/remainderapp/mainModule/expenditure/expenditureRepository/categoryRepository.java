package com.remainderapp.mainModule.expenditure.expenditureRepository;

import com.remainderapp.mainModule.expenditure.expenditureEntirty.category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface categoryRepository extends JpaRepository<category, Long> {
}
