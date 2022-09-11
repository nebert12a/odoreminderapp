import 'package:flutter/material.dart';
import 'package:odoapplications/model/compan_owner.dart';

class CompanyProvider extends ChangeNotifier {
  CompanyOwner _owner = CompanyOwner(
    companyName: '',
    creationDate: '',
    mailAddress: '',
    chooseCountry: '',
    phoneNumber: "",
    password: '',
    ownerName: '',
  );
  CompanyOwner get owner=>_owner;
  void setOwner(Map owner)
  {
    _owner=CompanyOwner(
      companyName: owner['companyName'],
      mailAddress: owner['mailAddress'],
    );
    notifyListeners();
  }

}
