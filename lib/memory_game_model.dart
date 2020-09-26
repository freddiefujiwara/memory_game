import 'package:flutter/material.dart';
import 'dart:math';

List _shuffle(List items) {
  var random = new Random();

  // Go through all elements.
  for (var i = items.length - 1; i > 0; i--) {
    // Pick a pseudorandom number according to the list length
    var n = random.nextInt(i + 1);

    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}

class MemoryGameModel extends ChangeNotifier {
  Icon _currentOpenedIcon;
  int _currentOpenedIndex;
  List<Icon> _icons;
  List<bool> _answers;
  MemoryGameModel() {
    this._initialize();
  }
  void _initialize() {
    this._currentOpenedIcon = null;
    this._currentOpenedIndex = -1;
    this._icons = _shuffle(<Icon>[
      Icon(Icons.beach_access),
      Icon(Icons.beach_access),
      Icon(Icons.favorite),
      Icon(Icons.favorite),
      Icon(Icons.bug_report),
      Icon(Icons.fastfood),
      Icon(Icons.fastfood),
      Icon(Icons.child_care),
      Icon(Icons.child_care)
    ]);
    this._answers = <bool>[
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    print("INIT");
  }

  get currentOpenedIndex => this._currentOpenedIndex;
  void open(int index) {
    if (this._icons[index].icon.codePoint ==
        Icon(Icons.bug_report).icon.codePoint) {
      this._initialize();
      notifyListeners();
      return;
    }
    if (this._answers[index]) {
      notifyListeners();
      return;
    }
    if (this._currentOpenedIcon == null) {
      this._currentOpenedIcon = this._icons[index];
      this._currentOpenedIndex = index;
      print('OPEN:$index');
      notifyListeners();
      return;
    }
    if (this._currentOpenedIndex == index) {
      print('SAME:${index}');
      notifyListeners();
      return;
    }
    if (this._currentOpenedIcon.icon.codePoint ==
        this._icons[index].icon.codePoint) {
      this._answers[this._currentOpenedIndex] = true;
      this._answers[index] = true;
      print('${this._answers}');
    }

    print('WRONG:$index');
    this._currentOpenedIcon = null;
    this._currentOpenedIndex = -1;
    notifyListeners();
    return;
  }

  Icon icon(int index) {
    if (this._currentOpenedIndex == index || this._answers[index]) {
      return this._icons[index];
    }
    return Icon(Icons.check);
  }
}
