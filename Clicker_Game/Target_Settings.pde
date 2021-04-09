void targetsettings() {
  background(LGrey);
  
  target_size_slider(50, 50);
  target_slidermap();
  
  achievementbutton(50, 250);
  
  shopbutton();
  shopbuttoncheck();
}

//=================================================================
//=================================================================

void target_size_slider(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  fill(Grey);
  stroke(DGrey);
  strokeWeight(10);
  
  rect(0, 0, 700, 150);
  
  stroke(Black);
  strokeWeight(5);
  
  line(40, 75, 660, 75);
  
  line(40, 65, 40,  85);
  line(350, 65, 350, 85);
  line(660, 65, 660, 85);
  
  fill(Grey);
  
  ellipse(target_sliderX - 50, target_sliderY - 50, 50, 50);
  
  textSize(30);
  fill(Black);
  textAlign(TOP, LEFT);
  
  //Cursor size indicator
  int small = 75;
  int medium = 150;
  int large = 225;
  
  String currentsize = "";
  
  if (targetD == small) {
    currentsize = "Small";
  } else if (targetD == medium) {
    currentsize = "Medium";
  } else if (targetD == large) {
    currentsize = "Large";
  }
  
  text("Target Size: " + currentsize, 20, 40);
  
  textAlign(CENTER, CENTER);
  
  popMatrix();
}

//Moves slider
void target_slidermove() {
  if (mouseX >= 90 && mouseX <= 710 && mouseY >= 90 && mouseY <= 135 && mode == target_settings) {
    target_sliderX = mouseX;
  }
}

//Maps slider to size
void target_slidermap() {
  targetD = Math.round(map(target_sliderX, 90, 710, 75, 225));
}

void target_rslidermap() {
  target_sliderX = Math.round(map(targetD, 75, 225, 90, 710));
}

//Target is always set to one of three sizes
void target_difficulty_set() {
  if (targetD <= 112.5) {
    targetD = 75;
  } else if (targetD > 112.5 && targetD < 187.5) {
    targetD = 150;
  } else if (targetD >= 187.5) {
    targetD = 225;
  }
  target_rslidermap();
}