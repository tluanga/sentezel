List<String> generateLeftTitle(int value) {
  //Value parameter should be the highest value in the list
  List<String> leftTitles = [];
  //-------segregate the intvalue into 5 pieces----------
  int ceiling = 5;
  if (value <= 250) {
    for (int i = 0; i <= ceiling; i++) {
      leftTitles.add((i * 50).toString());
    }
  } else if (value <= 500) {
    for (int i = 0; i <= ceiling; i++) {
      leftTitles.add((i * 100).toString());
    }
  } else if (value <= 1000) {
    for (int i = 0; i <= ceiling; i++) {
      leftTitles.add((i * 200).toString());
    }
  } else if (value <= 2000) {
    for (int i = 0; i <= ceiling; i++) {
      leftTitles.add((i * 400).toString());
    }
  } else if (value <= 5000) {
    for (int i = 0; i <= ceiling; i++) {
      if (i == 0) {
        leftTitles.add(i.toString());
      } else {
        leftTitles.add((i).toString() + 'k');
      }
    }
  } else if (value <= 7500) {
    for (int i = 0; i <= ceiling; i++) {
      if (i == 0) {
        leftTitles.add(i.toString());
      } else {
        leftTitles.add((i).toString() + '.5' + 'k');
      }
    }
  } else if (value <= 10000) {
    for (int i = 0; i <= ceiling; i++) {
      if (i == 0) {
        leftTitles.add(i.toString());
      } else {
        leftTitles.add((i * 2).toString() + 'k');
      }
    }
  } else if (value <= 20000) {
    for (int i = 0; i <= ceiling; i++) {
      if (i == 0) {
        leftTitles.add(i.toString());
      } else {
        leftTitles.add((i * 4).toString() + 'k');
      }
    }
  } else if (value <= 50000) {
    for (int i = 0; i <= ceiling; i++) {
      if (i == 0) {
        leftTitles.add(i.toString());
      } else {
        leftTitles.add((i * 10).toString() + 'k');
      }
    }
  } else if (value <= 100000) {
    for (int i = 0; i <= ceiling; i++) {
      if (i == 0) {
        leftTitles.add(i.toString());
      } else {
        leftTitles.add((i * 20).toString() + 'k');
      }
    }
  } else if (value <= 200000) {
    for (int i = 0; i <= ceiling; i++) {
      if (i == 0) {
        leftTitles.add(i.toString());
      } else {
        leftTitles.add((i * 40).toString() + 'k');
      }
    }
  } else if (value <= 500000) {
    for (int i = 0; i <= ceiling; i++) {
      if (i == 0) {
        leftTitles.add(i.toString());
      } else {
        leftTitles.add((i * 100).toString() + 'k');
      }
    }
  } else if (value <= 1000000) {
    for (int i = 0; i <= ceiling; i++) {
      if (i == 0) {
        leftTitles.add(i.toString());
      } else {
        leftTitles.add((i * 200).toString() + 'k');
      }
    }
  }
  return leftTitles;
}
