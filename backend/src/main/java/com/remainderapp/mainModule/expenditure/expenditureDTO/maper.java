package com.remainderapp.mainModule.expenditure.expenditureDTO;

import com.remainderapp.mainModule.expenditure.expenditureDTO.ResponseDTO.itemResponseDTO;
import com.remainderapp.mainModule.expenditure.expenditureEntirty.item;

public class maper {
    public static itemResponseDTO itemAddResponse(item item){
        itemResponseDTO responseDTO= new itemResponseDTO();
        responseDTO.setMsg(item.getName());
        return responseDTO;
    }
}
