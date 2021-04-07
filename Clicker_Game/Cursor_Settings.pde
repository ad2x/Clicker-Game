void cursorsettings() {
  background(LGrey);
  
  cursor_closeup(425, 450);
  cursor_size_slider();
  cursor_slidermap();
  soundbutton();
  shopbutton();
  shopbuttoncheck();
  cursorviewmodebutton();
  skinselector(50, 450);
}

void cursor_closeup(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  fill(Grey);
  stroke(DGrey);
  strokeWeight(10);
  
  rect(0, 0, 325, 300);
  
  cursor(163, 150, 110, false, false, true, cursorskin);
  
  cursor(50, 50, 35, false, true, true, cursorskin);
  
  popMatrix();
}

void cursor_size_slider() {
  //Background stuff
  fill(Grey);
  stroke(DGrey);
  strokeWeight(10);
  
  rect(50, 50, 700, 150);
  
  stroke(Black);
  strokeWeight(5);
  
  line(90, 125, 710, 125);
  
  //Text
  textSize(30);
  fill(Black);
  text("Cursor Size", 130, 70);
  
  //Slider button
  fill(Grey);
  ellipse(cursor_sliderX, cursor_sliderY, 50, 50);
}

//==== Slider Stuff ====
//Moves slider
void cursor_slidermove() {
  if (mouseX >= 90 && mouseX <= 710 && mouseY >=90 && mouseY <= 135 && mode == cursor_settings) {
    cursor_sliderX = mouseX;
  }
}
//Maps slider to size
void cursor_slidermap() {
  cursorsize = Math.round(map(cursor_sliderX, 90, 710, 10, 50));
}

//Makes it so the cursor and slider are always in sync, even if the cursor settings tab hasn't been opened yet
void cursor_rslidermap() {
  cursor_sliderX = Math.round(map(cursorsize, 10, 50, 90, 710));
}

//Button to go to sound settings
void soundbutton() {
  fill(Grey);
  stroke(DGrey);
  strokeWeight(10);
  
  rect(50, 250, 325, 150);
}

//Button to go to shop
void shopbutton() {
  fill(Grey);
  stroke(DGrey);
  strokeWeight(10);
  
  if (shopbuttoncheck == true) {
    stroke(60);
  }
  
  rect(425, 250, 325, 150);
  
  //Text Shadow
  fill(DGold);
  textSize(50);
  text("$ Shop $", 580, 330);
  
  //Text
  fill(Gold);
  textSize(50);
  text("$ Shop $", 587.5, 325);
}

//Shop button check
void shopbuttoncheck() {
  if (mouseX >= 425 && mouseX <= 750 && mouseY >=250 && mouseY <= 400 && cursorspinr == false) {
    shopbuttoncheck = true;
  } else {
    shopbuttoncheck = false;
  }
}

//Button to toggle whether the cursor shown in the cursor  window is in circular or rectangular mode
void cursorviewmodebutton() {
  noStroke();
  fill(DGrey);
  if (shapetoggle == false) {
    ellipse(720, 480, 30, 30);
  } else if (shapetoggle == true) {
    rect(705, 465, 30, 30);
  }
}

void cursorviewtoggle() {
  if (dist(mouseX, mouseY, 720, 480) <= 30 && shapetoggle == false) {
    shapetoggle = !shapetoggle;
  } else if (mouseX >= 705 && mouseX <= 735 && mouseY >= 465 && mouseY <= 495 && shapetoggle == true) {
    shapetoggle = !shapetoggle;
  }
}

//Inventory of skins
void skinselector(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  fill(Grey);
  stroke(DGrey);
  strokeWeight(10);
  
  rect(0, 0, 325, 300);
  
  skinslots();
  
  popMatrix();
}

//Slots for skins in inventory
void skinslots() {
  skinslot(65, 60, defaultskin, 1);
  skinslot(163, 60, redskin, redskinlock);
  skinslot(260, 60, greenskin, greenskinlock);
  skinslot(65, 150, blueskin, blueskinlock);
  skinslot(163, 150, whiteskin, whiteskinlock);
  skinslot(260, 150, goldskin, goldskinlock);
  skinslot(65, 240, timeskin, timeskinlock);
}

//Invididual skinslot
void skinslot(int x, int y, int skin, int unlocked) {
  pushMatrix();
  translate(x, y);
  
  fill(Grey);
  stroke(DGrey);
  strokeWeight(5);
  
  //Hover
  
  String[] preferences = loadStrings("cursorsave.txt");
  
  if (dist(mouseX, mouseY, x + 50, y + 450) <= 40 && Integer.parseInt(preferences[skin + 1]) == 1) {
    noStroke();
    fill(LGrey);
  }
  
  if (dist(mouseX, mouseY, x + 50, y + 450) <= 40 && skin == defaultskin) {
    noStroke();
    fill(LGrey);
  }
  
  ellipse(0, 0, 80, 80);
  
  //Only show cursor if unlocked
  if (unlocked == 1) {
    cursor(0, 0, 30, false, true, false, skin); 
  }
  
  popMatrix();
  
  //Select skin if clicked
  //I found a way to effectively turn mouseReleased() into a variable for this function
  
  if (skinhitcheck(x + 50, y + 450, skin) && click == true && unlocked == 1) {
    cursorskin = skin;
    click = false;
  }
}

boolean skinhitcheck(int x, int y, int skin) {
  if (dist(mouseX, mouseY, x, y) <= 40) {
    return true;
  }
  return false;
}
