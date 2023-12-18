import 'dart:io';

List<String> values = ['1', '2','3','4','5','6','7','8','9']; //to define the values of gameboard

void main() {
  board(); // to print the game board
  game();
}

void board() {
  //print the gameboard
  print(' ${values[0]} | ${values[1]} | ${values[2]}');
  print('---+---+---');
  print(' ${values[3]} | ${values[4]} | ${values[5]}');
  print('---+---+---');
  print(' ${values[6]} | ${values[7]} | ${values[8]}');
}

bool isWinner(List<String> a) {
  //to check the winner
  if (a[0] == a[1] && a[1] == a[2]) return true;
  if (a[3] == a[4] && a[4] == a[5]) return true;
  if (a[6] == a[7] && a[7] == a[8]) return true;
  if (a[0] == a[4] && a[4] == a[8]) return true;
  if (a[2] == a[4] && a[4] == a[6]) return true;
  if (a[0] == a[3] && a[3] == a[6]) return true;
  if (a[1] == a[4] && a[4] == a[7]) return true;
  if (a[2] == a[5] && a[5] == a[8]) return true;
  return false;
}

void regenerate() {
  // to regenerate the gameboard
  values = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
}

void game() {
  //to start the game
  int i;
  for (i = 0; i < 9; i++) {
    if (i.isEven) {
      //to choose player one to play
      print(
          "Player 1,please enter the number of the square you want to place your x:");
      int choise = int.parse(stdin.readLineSync()!);
      if ((choise > 9) ||
          (values[choise - 1] == 'O') ||
          (values[choise - 1] == 'X')) //to check the input
      {
        print("Invalid input please enter new choise");
        i--;
        continue;
      }
      values[choise - 1] = 'X'; //to change the value of gameboard
      if (isWinner(values)) {
        // to check if x is the winner
        print("winner winner x:");
        break;
      }
    } else {
      //to choose  player two to play
      print(
          "Player 2,please enter the number of the square you want to place your O:");
      int choise = int.parse(stdin.readLineSync()!);
      if ((choise > 9) ||
          (values[choise - 1] == 'O') ||
          (values[choise - 1] == 'X')) //to check the input
      {
        print("Invalid input please enter new choise");
        i--;
        continue;
      }
      values[choise - 1] = 'O'; //to change the value of gameboard
      if (isWinner(values)) {
        // to check if o is the winner
        print("winner winner o:");
        break;
      }
    }
    board(); //to display the change of gameboard
  }
  if (i == 9) // to check if its a draw
    print("Draw match!.....");
  print(
      "Enter 1 to play again \nEnter 2 to end game"); //to choose end game or play again

  for (;;) {
    // this loop to apply it to play forever
    int choise1 = int.parse(stdin.readLineSync()!);
    if (choise1 > 2) {
      print("Invalid input please enter new choise");
      continue;
    }
    if (choise1 == 1) {
      //to play again
      regenerate();
      board();
      game();
    } else {
      // to end the game
      print("Thanks For Playing");
      break;
    }
  }
}