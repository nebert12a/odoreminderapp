package com.remainderapp.mainModule.expenditure.expenditureDTO.RequestDTO;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class itemRequestDTO implements Serializable {
    String name;
    List<String> categoryName;
    Double price;

}
