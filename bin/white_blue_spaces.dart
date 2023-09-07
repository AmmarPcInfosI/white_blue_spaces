void main() {
  List<int> height1 = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1];
  List<int> height2 = [4, 2, 0, 3, 2, 5];
  int bUnits2 = findBlueUnits(height2);
  int bUnits1 = findBlueUnits(height1);
  print('$bUnits1');
  print('$bUnits2');
}

int findBlueUnits(List<int> a) {
  if (a.isEmpty) {
    return 0;
  }

  int r = 0;
  List<int> firstMax = List.filled(a.length, 0);
  List<int> secondMax = List.filled(a.length, 0);

  firstMax[0] = a[0];

  for (int i = 1; i < firstMax.length; i++) {
    if (firstMax[i - 1] > a[i]) {
      firstMax[i] = firstMax[i - 1];
    } else {
      firstMax[i] = a[i];
    }
  }

  secondMax[a.length - 1] = a[a.length - 1];

  for (int j = secondMax.length - 2; j >= 0; j--) {
    if (secondMax[j + 1] > a[j]) {
      secondMax[j] = secondMax[j + 1];
    } else {
      secondMax[j] = a[j];
    }
  }

  for (int x = 0; x < a.length; x++) {
    if (firstMax[x] < secondMax[x]) {
      r += firstMax[x];
    } else {
      r += secondMax[x];
    }
    r -= a[x];
  }

  return r;
}
