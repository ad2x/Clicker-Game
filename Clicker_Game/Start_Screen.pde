void startscreen() {
  background(LGrey);
  
  //Background stuff
  boxes();
  
  //Buttons
  tributtons();
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

boolean triPoint(float x1, float y1, float x2, float y2, float x3, float y3) {
  //Area of the triangle buttons
  float areaOrig = abs( (x2 - x1)*(y3 - y1) - (x3 - x1)*(y2 - y1) );
  
  //Get area of each triangle formed between the cursor and any two of the corners
  float area1 = abs((x1 - mouseX)*(y2 - mouseY) - (x2 - mouseX)*(y1 - mouseY));
  float area2 = abs((x2 - mouseX)*(y3 - mouseY) - (x3 - mouseX)*(y2 - mouseY));
  float area3 = abs((x3 - mouseX)*(y1 - mouseY) - (x1 - mouseX)*(y3 - mouseY));
  
  //Check if sum of all three is equal to area of button
  if (area1 + area2 + area3 == areaOrig) {
    return true;
  }
  return false;
}

void tributtons() {
  //==== Triangle button detection ====
  //--Button 1--
  hit_1 = triPoint(x1_1, y1_1, x2_1, y2_1, x3_1, y3_1);
  hit_2 = triPoint(x1_2, y1_2, x2_2, y2_2, x3_2, y3_2);
  
  //==== Triangle buttons ====
  gamestart_1();
  gamestart_2();
}

//==== Buttons ====

//Button to start game
void gamestart_1() {
  fill(Red);
  stroke(DRed);
  strokeWeight(5);
  
  triangle(x1_1, y1_1, x2_1, y2_1, x3_1, y3_1);
  
  //Text
  fill(Black);
  strokeWeight(50);
  textSize(15);
  text("Start Game", (x1_1 + x3_1)*(0.5) - 25, (y2_1 + y1_1)*(0.5) + 10);
}

void gamestart_2() {
  fill(Green);
  stroke(DGreen);
  strokeWeight(5);
  
  triangle(x1_2, y1_2, x2_2, y2_2, x3_2, y3_2);
  
  //Text 
  fill(Black);
  strokeWeight(50);
  textSize(15);
  text("Settings", (x1_2 + x3_2)*(0.5) + 20, (y2_2 + y1_2)*(0.5) + 50);
}

//==== Button Checks ====
//I made it check if the cursor is already spinning first so it doesn't get stuck

void tributtoncheck_1() {
  if (hit_1 == true && cursorspinr == false) {
    hit_1 = false;
    mode = game;
    
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
