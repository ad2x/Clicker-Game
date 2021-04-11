 void startscreen() {
  background(LGrey);
  
  //Background stuff
  boxes();
  
  //Buttons
  tributtons_start();
  buttonhover_1();
  buttonhover_2();
  buttonhover_3();
}

void boxes() {
  //Box Colours
  fill(Grey);
  stroke(DGrey);
  strokeWeight(4);
  
  //==Boxes==
  rect(0, 600, 200, 200);
  rect(0, 500, 100, 100);
  rect(200, 650, 150, 150);
  rect(100, 550, 50, 50);
  rect(200, 610, 40, 40);
  rect(350, 710, 90, 90);
  rect(0, 480, 20, 20);
  rect(440, 770, 30, 30);
  rect(350, 695, 15, 15);
}

void tributtons_start() {
  //==== Triangle button detection ====
  hit_1 = triPoint(x1_1, y1_1, x2_1, y2_1, x3_1, y3_1);
  hit_2 = triPoint(x1_2, y1_2, x2_2, y2_2, x3_2, y3_2);
  hit_3 = triPoint(x1_3, y1_3, x2_3, y2_3, x3_3, y3_3);
  
  //==== Triangle buttons ====
  gamestart_1();
  settings_2();
  leaderboard_3();
}

//==== Buttons ====

//Button to start game
void gamestart_1() {
  fill(Red);
  stroke(DRed);
  strokeWeight(5 * buttonhover_1);
  
  triangle(x1_1, y1_1, x2_1, y2_1, x3_1, y3_1);
  
  //Text
  fill(Black);
  textSize(25);
  text("Play", (x1_1 + x3_1)*(0.5) - 25, (y2_1 + y1_1)*(0.5) + 20);
}

void settings_2() {
  fill(Green);
  stroke(DGreen);
  strokeWeight(5 * buttonhover_2);
  
  triangle(x1_2, y1_2, x2_2, y2_2, x3_2, y3_2);
  
  //Text 
  fill(Black);
  textSize(25);
  text("Options", (x1_2 + x3_2)*(0.5) + 20, (y2_2 + y1_2)*(0.5) + 40);
}

void leaderboard_3() {
  fill(Blue);
  stroke(DBlue);
  strokeWeight(5 * buttonhover_3);
  
  triangle(x1_3, y1_3, x2_3, y2_3, x3_3, y3_3);
  
  //Text
  fill(Black);
  textSize(25);
  text("Leaderboard", (x1_3 + x3_3)*(0.5) + -90, (y2_3 + y1_3)*(0.5) + 40);
}

//==== Button Checks ====

void tributtoncheck_1() {
  if (hit_1 == true && cursorspinr == false) {
    hit_1 = false;
    mode = game;
    game_mode = start_game;
    score = 0;
    
    //Reset the pos and get a new random direction for the target
    targetRandom(random(0, 360));
    
    //Toggle cursorspin
    if (cursorspin == false) {
      cursorspin = true;
    }
  }
}

void tributtoncheck_2() {
  if (hit_2 == true && cursorspinr == false) {
    hit_2 = false;
    mode = settings;
        
    //Toggle cursorspin
    if (cursorspin == false) {
      cursorspin = true;
    }
  }
}

void tributtoncheck_3() {
  if (hit_3 == true && cursorspinr == false) {
    hit_3 = false;
    mode = leaderboard;
    
    //Toggle cursorspin
    if (cursorspin == false) {
      cursorspin = true;
    }
  }
}

void buttonhover_1() {
  if (hit_1 == true) {
    buttonhover_1 = 2;
  } else if (hit_1 == false) {
    buttonhover_1 = 1;
  }
}

void buttonhover_2() {
  if (hit_2 == true) {
    buttonhover_2 = 2;
  } else if (hit_2 == false) {
    buttonhover_2 = 1;
  }
}

void buttonhover_3() {
  if (hit_3 == true) {
    buttonhover_3 = 2;
  } else if (hit_3 == false) {
    buttonhover_3 = 1;
  }
}
