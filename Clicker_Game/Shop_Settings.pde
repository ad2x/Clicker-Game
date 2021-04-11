void shop() {
  background(LGrey);
  
  balcounter(550, 550);
  skindisplay(50, 550);
  
  //Line to seperate skin display and bal from skin boxes
  fill(Grey);
  line(50, 525, 750, 525);
  
  //Skin boxes
  skinbox(50, 50, 1, 50, "Red", "A basic red cursor", "", true);
  skinbox(300, 50, 2, 50, "Green", "A basic green cursor", "", true);
  skinbox(550, 50, 3, 50, "Blue", "A basic blue cursor", "", true);
  skinbox(50, 300, 4, 200, "Translucent", "A translucent cursor", "", true);
  skinbox(300, 300, 5, 500, "Golden", "A special golden cursor,", "using it will give you bonus money", true);
  skinbox(550, 300, 6, 500, "Time", "A special time cursor,", "using it will give you extra time", true);
}

//Shows your current balance 
void balcounter(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  fill(Grey);
  stroke(DGrey);
  strokeWeight(10);
  
  rect(0, 0, 200, 200);
  
  fill(Black);
  textSize(40);
  
  text("Balance:", 100, 75);
  text("$" + balance, 100, 125);
  
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
void skinbox(int x, int y, int skin, int price, String name, String desc1, String desc2, boolean cursor) {
  pushMatrix();
  translate(x, y);
   
  fill(Grey);
  stroke(DGrey);
  strokeWeight(10);
  
  String[] preferences = new String[10];
  
  if (cursor == true) {
    String[] preferences1 = loadStrings("cursorsave.txt");
    preferences = preferences1;
  } else if (cursor == false) {
    String[] preferences1 = loadStrings("targetsave.txt");
    preferences = preferences1;
  }
  
  boolean[] hovered = new boolean[6];
  
  hovered[0] = false;
  hovered[1] = false;
  hovered[2] = false;
  hovered[3] = false;
  hovered[4] = false;
  hovered[5] = false;
 
  if (mouseX > x && mouseX < x + 200 && mouseY > y && mouseY < y + 200) {
    stroke(60);
    
    hovered[0] = false;
    hovered[1] = false;
    hovered[2] = false;
    hovered[3] = false;
    hovered[4] = false;
    hovered[5] = false;
    
    hovered[skin - 1] = true;
    
    //I ended up using mousePressed instead of mouseReleased for the shop buttons since mouseReleased doesn't have a global variable for some reason
    if (mousePressed == true && price < balance && Integer.parseInt(preferences[skin + 1]) == 0 && skin != 0) {
      balance = balance - price;
      cashspent = cashspent + price;
      
      if (cursor == true) {
        savecursorpreferences(true, skin);
      } else {
        targetsavepref(true, skin);
      }
    }
  }
  
  //Display
  rect(0, 0, 200, 200);
  
  //Price section
  rect(0, 150, 200, 50);
  
  //Skin
  if (cursor == true) {
    cursor(100, 75, 60, false, true, true, skin);
  } else {
    target(100, 75, 90, skin, false);
  }
  
  //Price text
  if (balance > price) {
    fill(DGreen);
  } else {
    fill(DRed);
  }
  textSize(40);
  if (Integer.parseInt(preferences[skin + 1]) == 1) {
    fill(Black);
    text("Sold", 100, 175);
  } else {
  text("$" + price, 100, 175);
  }
  
  popMatrix();

  if (hovered[skin - 1] == true) {
    fill(Black);
    textSize(50);
    
    if (cursor == true) {
      text(name + " Cursor", 275, 600);
    } else {
      text(name + " Target", 275, 600);
    }
    
    textSize(30);
    
    if (skin == 6 && cursor == false) {
      textSize(26);
    }
    
    text(desc1, 275, 650);
    text(desc2, 275, 700);
  }
}
