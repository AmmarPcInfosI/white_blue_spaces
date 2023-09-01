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
  List<int> lMax = List.filled(a.length, 0);
  List<int> rMax = List.filled(a.length, 0);

  lMax[0] = a[0];

  for (int i = 1; i < lMax.length; i++) {
    if (lMax[i - 1] > a[i]) {
      lMax[i] = lMax[i - 1];
    } else {
      lMax[i] = a[i];
    }
  }

  rMax[a.length - 1] = a[a.length - 1];

  for (int j = rMax.length - 2; j >= 0; j--) {
    if (rMax[j + 1] > a[j]) {
      rMax[j] = rMax[j + 1];
    } else {
      rMax[j] = a[j];
    }
  }

  for (int x = 0; x < a.length; x++) {
    if (lMax[x] < rMax[x]) {
      r += lMax[x];
    } else {
      r += rMax[x];
    }
    r -= a[x];
  }

  return r;
}
