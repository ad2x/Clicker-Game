void cursor(int x, int y, int size, boolean user, boolean blinklock, boolean locktoggle, int skin) { //==================================================================================
  
  //Locktoggle is to toggle the shape of the large cursor in the cursor settings menu
  //For the shapetoggle var(outside of this func) false is rect and true is circle
  pushMatrix();
  translate(x, y);
  
  //==== Cursor Colour ====
  //Setting stroke and fill based on selected skin
  if (skin == blueskin) {
    cursorfill = LBlue;
    cursorstroke = Blue;
  } else if (skin == redskin) {
    cursorfill = LRed;
    cursorstroke = Red;
  } else if (skin == greenskin) {
    cursorfill = LGreen;
    cursorstroke = Green;
  } else if (skin == defaultskin) {
    cursorfill = DGrey;
    cursorstroke = Black;
  } else if (skin == whiteskin) {
    cursorfill = White;
    cursorstroke = LGrey;
  } else if (skin == goldskin) {
    cursorfill = Gold;
    cursorstroke = DGold;
  } else if (skin == timeskin) {
    cursorfill = LBlue;
    cursorstroke = DDBrown;
  } else if (skin == iceskin) {
    cursorfill = White; 
    cursorstroke = LBlue;
  } else if (skin == lavaskin) {
    cursorfill = Red;
    cursorstroke = Black;
  }
  
  fill(cursorfill, 120);
  stroke(cursorstroke);
  
  
  if ((cursorc == true && user == true)||blinklock == true) {
    fill(cursorfill, 255);
    stroke(cursorstroke);
  }
  
  strokeWeight((0.2)*(size));
  
  //Rotate for cursorspin
  if (user == true) {
    rotate(cursorang);
  }
  
  //Cursor shape - I made everything relative to the size of the cursor so it can be changed more easily
  if (locktoggle == false) {
    if (cursorshape == square) {
      rect(-(0.5)*(size),-(0.5)*(size), size, size);
    } else if (cursorshape == circle) {
      ellipse(0, 0, size, size);
    }
  }
  
  //Locktoggle function
  if (locktoggle == true) {
    if (shapetoggle == false) {
      rect(-(0.5)*(size),-(0.5)*(size), size, size);
    } else if (shapetoggle == true) {
      ellipse(0, 0, size, size);
    }
  }
  
  //--Functions--
  
  //Check if cursor ckicks on a button, and if so makes it spin
  if (user == true) {
    cursorturn();
  }
  
  //Check if the game mode is game so it can change shape
  cursorshapecheck();
  
  //Spin cursor counterclockwise if you press esc
  cursorturnr();
  
  //Apply skin bonuses
  cursoreffects();
  
  popMatrix();
} //==================================================================================

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

void savecursorpreferences(boolean skinunlock, int skintochange) {

  String[] preferences1 = loadStrings("cursorsave.txt");
  
  int[] preferences2 = new int[10];
  preferences2[0] = cursorskin;
  preferences2[1] = cursorsize;
  preferences2[2] = Integer.parseInt(preferences1[2]);
  preferences2[3] = Integer.parseInt(preferences1[3]);
  preferences2[4] = Integer.parseInt(preferences1[4]);
  preferences2[5] = Integer.parseInt(preferences1[5]);
  preferences2[6] = Integer.parseInt(preferences1[6]);
  preferences2[7] = Integer.parseInt(preferences1[7]);
  preferences2[8] = Integer.parseInt(preferences1[8]);
  preferences2[9] = Integer.parseInt(preferences1[9]);
  
  redskinlock = preferences2[2];
  greenskinlock = preferences2[3];
  blueskinlock = preferences2[4];
  whiteskinlock = preferences2[5];
  goldskinlock = preferences2[6];
  timeskinlock = preferences2[7];
  iceskinlock = preferences2[8];
  lavaskinlock = preferences2[9];
  
  if (skinunlock == true) {
    preferences2[(skintochange + 1)] = 1;
  }
  
  //Converts int array to a string array
  String[] preferencesstring = str(preferences2);
  
  //Saves it to file
  saveStrings("cursorsave.txt", preferencesstring);
}

//Player gets special effects if they use certain skins
void cursoreffects() {
  if (cursorskin == goldskin) {
    goldbonus = 2;
  } else {
    goldbonus = 1;
  }
  
  if (cursorskin == timeskin) {
    timebonus = 2;
  } else {
    timebonus = 1;
  }
  
  if (cursorskin == iceskin) {
    icebonus = 2;
  } else {
    icebonus = 1;
  }
  
  if (cursorskin == lavaskin) {
    lavabonus = 2;
  } else {
    lavabonus = 1;
  }
}
