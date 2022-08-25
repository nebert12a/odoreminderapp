package com.remainderapp.mainModule.expenditure.expenditureService;

import com.remainderapp.mainModule.expenditure.expenditureDTO.RequestDTO.itemRequestDTO;
import com.remainderapp.mainModule.expenditure.expenditureDTO.ResponseDTO.itemResponseDTO;
import com.remainderapp.mainModule.expenditure.expenditureDTO.maper;
import com.remainderapp.mainModule.expenditure.expenditureEntirty.category;
import com.remainderapp.mainModule.expenditure.expenditureEntirty.item;
import com.remainderapp.mainModule.expenditure.expenditureRepository.categoryRepository;
import com.remainderapp.mainModule.expenditure.expenditureRepository.expenditureRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class expenditureServiceImplementor implements expenditureServices{
    @Autowired
    expenditureRepository repository;
    @Autowired
    categoryRepository cat_repository;
    @Override
    public itemResponseDTO saveItem(itemRequestDTO requestDTO) {
        item item= new item();
        List<category> cats= new ArrayList<>();
         category category;
        for (String cat:requestDTO.getCategoryName()) {
            category= new category();
            category.setName(cat);
            cats.add(cat_repository.save(category));

        }
        for (category cat:cats
             ) {
            System.out.println(cat.toString());
        }
        item.setName(requestDTO.getName());
        item.setCategories(cats);
        item.getCategories().addAll(cats);

        return maper.itemAddResponse(repository.save(item));
    }
}
