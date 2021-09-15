List<String> generateLeftTitle({required int highestValue}) {
  //Value parameter should be the highest value in the list
  List<String> leftTitles = [];
  //-------segregate the intvalue into 5 pieces----------
  int ceiling = 5;
  if (highestValue <= 250) {
    for (int i = 0; i <= ceiling; i++) {
      leftTitles.add((i * 50).toString());
    }
  } else if (highestValue <= 500) {
    for (int i = 0; i <= ceiling; i++) {
      leftTitles.add((i * 100).toString());
    }
  } else if (highestValue <= 1000) {
    for (int i = 0; i <= ceiling; i++) {
      leftTitles.add((i * 200).toString());
    }
  } else if (highestValue <= 2000) {
    for (int i = 0; i <= ceiling; i++) {
      leftTitles.add((i * 400).toString());
    }
  } else if (highestValue <= 5000) {
    for (int i = 0; i <= ceiling; i++) {
      if (i == 0) {
        leftTitles.add(i.toString());
      } else {
        leftTitles.add((i).toString() + 'k');
      }
    }
  } else if (highestValue <= 7500) {
    for (int i = 0; i <= ceiling; i++) {
      if (i == 0) {
        leftTitles.add(i.toString());
      } else {
        leftTitles.add((i).toString() + '.5' + 'k');
      }
    }
  } else if (highestValue <= 10000) {
    for (int i = 0; i <= ceiling; i++) {
      if (i == 0) {
        leftTitles.add(i.toString());
      } else {
        leftTitles.add((i * 2).toString() + 'k');
      }
    }
  } else if (highestValue <= 20000) {
    for (int i = 0; i <= ceiling; i++) {
      if (i == 0) {
        leftTitles.add(i.toString());
      } else {
        leftTitles.add((i * 4).toString() + 'k');
      }
    }
  } else if (highestValue <= 50000) {
    for (int i = 0; i <= ceiling; i++) {
      if (i == 0) {
        leftTitles.add(i.toString());
      } else {
        leftTitles.add((i * 10).toString() + 'k');
      }
    }
  } else if (highestValue <= 100000) {
    for (int i = 0; i <= ceiling; i++) {
      if (i == 0) {
        leftTitles.add(i.toString());
      } else {
        leftTitles.add((i * 20).toString() + 'k');
      }
    }
  } else if (highestValue <= 200000) {
    for (int i = 0; i <= ceiling; i++) {
      if (i == 0) {
        leftTitles.add(i.toString());
      } else {
        leftTitles.add((i * 40).toString() + 'k');
      }
    }
  } else if (highestValue <= 500000) {
    for (int i = 0; i <= ceiling; i++) {
      if (i == 0) {
        leftTitles.add(i.toString());
      } else {
        leftTitles.add((i * 100).toString() + 'k');
      }
    }
  } else if (highestValue <= 1000000) {
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
