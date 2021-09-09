List<String> rpBarChartYTitleGenerator(int value) {
  //Value parameter should be the highest value in the list
  List<String> leftTitles = [];
  //-------segregate the intvalue into 5 pieces----------
  int ceiling = 5;
  int i = 1;
  if (value <= 50) {
    while (i <= ceiling) {
      leftTitles.add((i * 10).toString());
      i++;
    }
  }
  if (value <= 100) {
    while (i <= ceiling) {
      leftTitles.add((i * 20).toString());
      i++;
    }
  }
  if (value <= 250) {
    while (i <= ceiling) {
      leftTitles.add((i * 50).toString());
      i++;
    }
  } else if (value <= 500) {
    while (i <= ceiling) {
      leftTitles.add((i * 100).toString());
      i++;
    }
  } else if (value <= 1000) {
    while (i <= ceiling) {
      leftTitles.add((i * 200).toString());
      i++;
    }
  } else if (value <= 2000) {
    while (i <= ceiling) {
      leftTitles.add((i * 400).toString());
      i++;
    }
  } else if (value <= 5000) {
    while (i <= ceiling) {
      if (i == 0) {
        leftTitles.add(i.toString());
        i++;
      } else {
        leftTitles.add((i).toString() + 'k');
        i++;
      }
    }
  } else if (value <= 7500) {
    while (i <= ceiling) {
      if (i == 0) {
        leftTitles.add(i.toString());
        i++;
      } else {
        leftTitles.add((i).toString() + '.5' + 'k');
        i++;
      }
    }
  } else if (value <= 10000) {
    while (i <= ceiling) {
      if (i == 0) {
        leftTitles.add(i.toString());
        i++;
      } else {
        leftTitles.add((i * 2).toString() + 'k');
        i++;
      }
    }
  } else if (value <= 20000) {
    while (i <= ceiling) {
      if (i == 0) {
        leftTitles.add(i.toString());
        i++;
      } else {
        leftTitles.add((i * 4).toString() + 'k');
        i++;
      }
    }
  } else if (value <= 50000) {
    while (i <= ceiling) {
      if (i == 0) {
        leftTitles.add(i.toString());
        i++;
      } else {
        leftTitles.add((i * 10).toString() + 'k');
        i++;
      }
    }
  } else if (value <= 100000) {
    while (i <= ceiling) {
      if (i == 0) {
        leftTitles.add(i.toString());
        i++;
      } else {
        leftTitles.add((i * 20).toString() + 'k');
        i++;
      }
    }
  } else if (value <= 200000) {
    while (i <= ceiling) {
      if (i == 0) {
        leftTitles.add(i.toString());
        i++;
      } else {
        leftTitles.add((i * 40).toString() + 'k');
        i++;
      }
    }
  } else if (value <= 500000) {
    while (i <= ceiling) {
      if (i == 0) {
        leftTitles.add(i.toString());
        i++;
      } else {
        leftTitles.add((i * 100).toString() + 'k');
        i++;
      }
    }
  } else if (value <= 1000000) {
    while (i <= ceiling) {
      if (i == 0) {
        leftTitles.add(i.toString());
        i++;
      } else {
        leftTitles.add((i * 200).toString() + 'k');
        i++;
      }
    }
  }
  return leftTitles;
}
