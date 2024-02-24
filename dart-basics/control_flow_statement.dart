void main() {
  // if statement
  int age = 20;
  if (age >= 18) {
    print('You are an adult');
  }

  // if-else statement
  int number = 10;
  if (number % 2 == 0) {
    print('Even number');
  } else {
    print('Odd number');
  }

  // if-else if-else statement
  int score = 80;
  if (score >= 90) {
    print('A');
  } else if (score >= 80) {
    print('B');
  } else if (score >= 70) {
    print('C');
  } else if (score >= 60) {
    print('D');
  } else {
    print('F');
  }

  // switch statement
  String grade = 'A';
  switch (grade) {
    case 'A':
      print('Excellent');
      break;
    case 'B':
      print('Good');
      break;
    case 'C':
      print('Fair');
      break;
    case 'D':
      print('Poor');
      break;
    case 'F':
      print('Fail');
      break;
    default:
      print('Invalid grade');
  }

  // for loop
  for (int i = 0; i < 5; i++) {
    print(i);
  }

  // for-in loop
  List<String> names = ['Ali', 'Ahmed', 'Sara'];
  for (String name in names) {
    print(name);
  }

  // while loop
  int count = 0;
  while (count < 5) {
    print(count);
    count++;
  }

  // do-while loop
  int count2 = 0;
  do {
    print(count2);
    count2++;
  } while (count2 < 5);

  // break statement
  for (int i = 0; i < 5; i++) {
    if (i == 3) {
      break;
    }
    print(i);
  }

  // continue statement
  for (int i = 0; i < 5; i++) {
    if (i == 3) {
      continue;
    }
    print(i);
  }

  // labels
  outerLoop:
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (i == 2 && j == 2) {
        break outerLoop;
      }
      print('$i $j');
    }
  }
}
