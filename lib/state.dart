import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  List<Investment> investments = [];

  void addInvestment(Investment myInvestment) {
    investments.add(myInvestment);
    notifyListeners();
  }

  int activeInvestment = 0;

  void setActiveInvestment(int index) {
    activeInvestment = index;
    notifyListeners();
  }

  void deleteInvestment(int index) {
    investments.removeAt(index);
    notifyListeners();
  }

  void editInvestment(
      int index, String title, double total, double chunk, double royalty) {
    investments[index].title = title;
    investments[index].total = total;
    investments[index].chunk = chunk;
    investments[index].royalty = royalty;
    notifyListeners();
  }
}

class Investment {
  String title;
  double total;
  double chunk;
  double royalty;
  int id;

  void editInvestment(
      String myTitle, double myTotal, double myChunk, double myRoyalty) {
    title = myTitle;
    total = myTotal;
    chunk = myChunk;
    royalty = myRoyalty;
  }

  late TextEditingController titleController =
      TextEditingController(text: title);
  late TextEditingController totalController =
      TextEditingController(text: total.toString());
  late TextEditingController chunkController =
      TextEditingController(text: chunk.toString());
  late TextEditingController royaltyController =
      TextEditingController(text: royalty.toString());

  Investment(this.title, this.total, this.chunk, this.royalty, this.id);
}
