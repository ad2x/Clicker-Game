void settingsmenu() {
  background(LGrey);
  
  //Background stuff
  circles();
  
  //Buttons
  tributtons_settings();
  buttonhover_4();
  buttonhover_5();
}

void circles() {
  //Colours
  fill(Grey);
  stroke(DGrey);
  strokeWeight(4);
  
  //==Circles==
  ellipse(800, 400, 40, 40);
  ellipse(400, 0, 40, 40);
  ellipse(492, 102, 50, 50);
  ellipse(596, 195, 60, 60);
  ellipse(719, 281, 70, 70);
  ellipse(674, 223, 120, 120);
  ellipse(565, 115, 133, 133);
  ellipse(792, 314, 150, 150);
  ellipse(491, 14, 168, 168);
  ellipse(662, 127, 180, 180);
  ellipse(612.5, 0, 230, 230);
  ellipse(800, 187.5, 250, 250);
  ellipse(800, 0, 375, 375);
}

void cursor_settings() {
  fill(Red);
  stroke(DRed);
  strokeWeight(5 * buttonhover_4);
  
  triangle(x1_4, y1_4, x2_4, y2_4, x3_4, y3_4);
  
  textSize(25);
  fill(Black);
  text("Cursor", (x1_4 + x3_4)*(0.5) - 50, (y2_4 + y1_4)*(0.5) + 40);
}

void target_settings() {
  fill(Blue);
  stroke(DBlue);
  strokeWeight(5 * buttonhover_5);
  
  triangle(x1_5, y1_5, x2_5, y2_5, x3_5, y3_5);
  
  textSize(25);
  fill(Black);
  text("Target", (x1_5 + x3_5)*(0.5) + 50, (y2_5 + y1_5)*(0.5) - 50);
}

void tributtons_settings() {
  //==== Buttons ====
  cursor_settings();
  target_settings();
  
  //==== Triangle button detection ====
  hit_4 = triPoint(x1_4, y1_4, x2_4, y2_4, x3_4, y3_4);
  hit_5 = triPoint(x1_5, y1_5, x2_5, y2_5, x3_5, y3_5);
}

//==== Button Checks ====
//I made it check if the cursor is already spinning first so it doesn't get stuck

void tributtoncheck_4() {
  if (hit_4 == true && cursorspinr == false) {
    hit_4 = false;
    mode = cursor_settings;
    
    //Toggle cursorspin
    if (cursorspin == false) {
      cursorspin = true;
    }
  }
}

void tributtoncheck_5() {
  if (hit_5 == true && cursorspinr == false) {
    hit_5 = false;
    mode = target_settings;
    
    //Toggle cursorspin
    if (cursorspin == false) {
      cursorspin = true;
    }
  }
}

void buttonhover_4() {
  if (hit_4 == true) {
    buttonhover_4 = 2;
  } else if (hit_4 == false) {
    buttonhover_4 = 1;
  }
}

void buttonhover_5() {
  if (hit_5 == true) {
    buttonhover_5 = 2;
  } else if (hit_5 == false) {
    buttonhover_5 = 1;
  }
}
