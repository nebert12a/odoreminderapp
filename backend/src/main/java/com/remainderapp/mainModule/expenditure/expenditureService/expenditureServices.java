package com.remainderapp.mainModule.expenditure.expenditureService;

import com.remainderapp.mainModule.expenditure.expenditureDTO.RequestDTO.itemRequestDTO;
import com.remainderapp.mainModule.expenditure.expenditureDTO.ResponseDTO.itemResponseDTO;
import org.springframework.stereotype.Service;

@Service
public interface expenditureServices {
   itemResponseDTO saveItem(itemRequestDTO requestDTO);
}
