void shop() {
  background(LGrey);
  
  balcounter(550, 550);
  skindisplay(50, 550);
  
  //Line to seperate skin display and bal from skin boxes
  fill(Grey);
  line(50, 525, 750, 525);
  
  //Skin boxes
  skinbox(50, 50, 0, 0, 1);
  skinbox(300, 50, 0, 0, 0);
  skinbox(550, 50, 0, 0, 0);
  skinbox(50, 300, 0, 0, 0);
  skinbox(300, 300, 0, 0, 0);
  skinbox(550, 300, 0, 0, 0);
}

//Shows your current balance 
void balcounter(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  fill(Grey);
  stroke(DGrey);
  strokeWeight(10);
  
  rect(0, 0, 200, 200);
  
  popMatrix();
}

//Displayed the skin the cursor is hovered over
void skindisplay(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  fill(Grey);
  stroke(DGrey);
  strokeWeight(10);
  
  rect(0, 0, 450, 200);
  
  popMatrix();
}

//The boxes that the skins on sale are shown in
void skinbox(int x, int y, int skin, int price, int bought) {
  pushMatrix();
  translate(x, y);
  
  fill(Grey);
  stroke(DGrey);
  strokeWeight(10);
  
  //Display
  rect(0, 0, 200, 200);
  
  //Price section
  rect(0, 150, 200, 50);
  
  //Skin
  cursor(100, 75, 60, false, true, true, skin);
  
  //Price text
  if (balance > price) {
    fill(DGreen);
  } else {
    fill(DRed);
  }
  textSize(40);
  if (bought == 1) {
    fill(Black);
    text("Sold", 100, 175);
  } else {
  text("$" + price, 100, 175);
  }
  
  popMatrix();
}
