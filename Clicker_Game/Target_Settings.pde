void targetsettings() {
  background(LGrey);
  
  target_size_slider(50, 50);
  target_slidermap();
  
  achievementbutton(50, 250);
  
  shopbutton();
  shopbuttoncheck();
  
  target_closeup(425, 450);
  
  tskinselector(50, 450);
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

//=================================================================
//=================================================================

//Target viewer
void target_closeup(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  fill(Grey);
  stroke(DGrey);
  strokeWeight(10);
  
  rect(0, 0, 325, 300);  
  
  target(163, 150, 150, targetskin, false);
  
  String name = "";
  String desc = "";
  switch(targetskin) {
    case 0:
      name = "Default";
      desc = "No bonuses";
      break;
    case 1:
      name = "Red";
      desc = "No bonuses";
      break;
    case 2:
      name = "Green";
      desc = "No bonuses";
      break;
    case 3:
      name = "Blue";
      desc = "No bonuses";
      break;
    case 4:
      name = "Neon Green";
      desc = "No bonuses";
      break;
    case 5:
      name = "White";
      desc = "Background is black";
      break;
    case 6:
      name = "Sun";
      desc = "Score size increases faster";
      break;
    case 7:
      name = "Matching";
      desc = "Matches cursor skin";
      break;
    case 8:
      name = "Rankings";
      desc = "Score colour reflects current scores rank";
      break;
  }  
  
  textSize(45);
  fill(Black);
  
  text(name, 162.5, 40);
  
  textSize(25);
  
  if (targetskin == tplacesskin) {
    textSize(15);
  }
  
  text(desc, 162.5, 250);
  
  popMatrix();
}

//=================================================================
//=================================================================

//Inventory
void tskinselector(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  fill(Grey);
  stroke(DGrey);
  strokeWeight(10);
  
  rect(0, 0, 325, 300);
  
  tskinslots();
  
  popMatrix();
}

void tskinslots() {
  skinslot(65, 60, 0, 1, false);
  skinslot(163, 60, 1, tredskinlock, false);
  skinslot(260, 60, 2, tgreenskinlock, false);
  skinslot(65, 150, 3, tblueskinlock, false);
  skinslot(163, 150, 4, tbgskinlock, false);
  skinslot(260, 150, 5, twhiteskinlock, false);
  skinslot(65, 240, 6, tsunskinlock, false);
  skinslot(163, 240, 7, tmatchingskinlock, false);
  skinslot(260, 240, 8, tplacesskinlock, false);
}
