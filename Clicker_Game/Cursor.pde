void cursor() {
  pushMatrix();
  translate(mouseX, mouseY);
  
  //==== Cursor Colour ====
  if (cursorc == false) {
    fill(Blue);
    stroke(DBlue);
  } else if (cursorc == true) {
    fill(LBlue);
    stroke(Blue);
  }
  strokeWeight((0.2)*(cursorsize));
  
  //Rotate for cursorspin
  rotate(cursorang);
  
  //Cursor shape - I made everything relative to the size of the cursor so it can be changed more easily
  if (cursorshape == square) {
    rect(-(0.5)*(cursorsize),-(0.5)*(cursorsize), cursorsize, cursorsize);
  } else if (cursorshape == circle) {
    ellipse(0, 0, cursorsize, cursorsize);
  }
  
  //--Functions--
  
  //Check if cursor ckicks on a button, and if so makes it spin
  cursorturn();
  
  //Check if the game mode is game so it can change shape
  cursorshapecheck();
  
  //Spin cursor counterclockwise if you press esc
  cursorturnr();
  
  popMatrix();
}

//Make cursor flash when you click
void cursorclick() {
  cursorc = !cursorc;
}

//Spins the cursor around when you click a menu button
void cursorturn() {
  if (cursorspin == true) {
    cursorang = cursorang + 5 * spinspeed;
  }
  
  if (cursorang == 90) {
    cursorspin = false;
    cursorang = 0;
  }
}

//Spins the cursor counterclockwise when yougo back to the start menu
void cursorturnr() {
  if (cursorspinr == true) {
    cursorang = cursorang - 5 * spinspeed;
  }
  
  if (cursorang == -90) {
    cursorspinr = false;
    cursorang = 0;
  }
}

//Changes the cursor to a circle if you're playing the game
void cursorshapecheck () {
  if (mode == game && cursorspin == false) {
    cursorshape = circle;
  } else if (mode == start) {
    cursorshape = square;
  }
}
