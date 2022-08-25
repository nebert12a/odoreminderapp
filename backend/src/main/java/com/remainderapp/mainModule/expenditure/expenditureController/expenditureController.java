package com.remainderapp.mainModule.expenditure.expenditureController;

import com.remainderapp.mainModule.expenditure.expenditureDTO.RequestDTO.itemRequestDTO;
import com.remainderapp.mainModule.expenditure.expenditureService.expenditureServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/")
public class expenditureController {
    @Autowired
    expenditureServices services;
    @GetMapping("/")
    public String welcomeToOdoRemainderBackend(){
        return "default end point accessed";
    }
    @PostMapping("addItem")
    public String addItem(@RequestBody itemRequestDTO requestDTO){
        System.out.println(requestDTO.toString());
        services.saveItem(requestDTO);
        return "add item";
    }

}

