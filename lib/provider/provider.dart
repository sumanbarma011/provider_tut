import 'package:favoriteapp/data_model.dart';
import 'package:flutter/material.dart';

class FavProvider extends ChangeNotifier {
  final List<DataModel> _newList = [];

  List<DataModel> get newList {
    return _newList;
  }

  void setnewlist(DataModel data) {
    bool isContains = _newList.contains(data);
    print(isContains);
    if (isContains) {
      print('false print vako chah');
      data.fav = false;
      _newList.remove(data);
      notifyListeners();
    } else {
      // newList=[...newList,]
      print('true print vako chah');

      data.fav = true;
      _newList.add(data);
      notifyListeners();
    }
  }
}
