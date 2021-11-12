import 'package:flutter/material.dart';
import 'package:flutter_app_mvm_sample/model.dart';
import 'package:flutter_app_mvm_sample/main.dart';

import 'package:mvp/mvp.dart';

class MainPresenter extends MvpPresenter<MainModel, MainScreenState> {

  @override
  void initializeViewModel() {
    viewModel = MainModel();
  }

  void incrementButtonClick() {
    viewModel.counter++;
    callback(viewModel);
  }
  void decrementButtonClick() {
    viewModel.counter--;
    callback(viewModel);
  }

}