void stackStart() {
  print("Started Main");
  functionOne();
  print("Finished Main");
}

void functionOne() {
  print("Started functionOne");
  try {
    functionTwo();
  } catch(e, stackTrace) {
    // print("Foi capturada dentro da functionOne");
    print(e.toString());
    print(stackTrace.toString());
    rethrow;
  } finally {
    print("Chegou no Finally");
  }
  print("Finished Function 01");
}

void functionTwo() {
  print("Started functionTwo");
  for(int i = 1; i <= 5; i++) {
    print(i);
      double amount = double.parse("Not a number");
  }
  print("Finished functionTwo");
}