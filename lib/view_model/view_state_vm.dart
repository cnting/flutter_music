import 'package:flutter/material.dart';
import 'package:flutter_music/model/view_state.dart';

class ViewStateVM with ChangeNotifier {
  ViewState _viewState;

  set state(ViewState state) {
    this._viewState = state;
    notifyListeners();
  }

  get state => _viewState;

  setLoading() {
    state = ViewState.STATE_LOADING;
  }

  setSuccess() {
    state = ViewState.STATE_SUCCESS;
  }

  setError() {
    state = ViewState.STATE_ERROR;
  }

  bool isLoading() {
    return state == ViewState.STATE_LOADING;
  }

  bool isSuccess() {
    return state == ViewState.STATE_SUCCESS;
  }

  bool isError(){
    return state ==ViewState.STATE_ERROR;
  }
}
