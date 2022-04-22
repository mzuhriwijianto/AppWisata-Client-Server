import 'package:flutter/material.dart';

import '../model/tourism_place.dart';

class DoneTourismProvider extends ChangeNotifier {
  final List<ListData> _doneTourismPlaceList = [];

  List<ListData> get doneTourismPlaceList => _doneTourismPlaceList;

  void complete(ListData place, bool isDone) {
    isDone
        ? _doneTourismPlaceList.add(place)
        : _doneTourismPlaceList.remove(place);
    notifyListeners();
  }
}