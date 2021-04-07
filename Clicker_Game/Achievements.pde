void achievements_settings() {
  background(LGrey);
  
  achievement(50, 50, 7, 1, "Ice Cursor", "Play 10 Games", 10, gamesplayed);
}

//=================================================================
//=================================================================

void achievement(int x, int y, int rewardn, int rewardt, String rewardname, String reqdesc, int totalreq, int currentn) {
  //rewardn - # of skin reward (e.g. the red cursor is 1)
  //rewardt - type of skin reward, 1 is a cursor skin and 2 is a target skin
  //rewardname - name of the skin reward
  //reqdesc - description of the requirements to unlock the achievement
  //totalreq - number of whatever you need to get to unlock the achievement
  //currentn - number player currently has of the required amount
  
  pushMatrix();
  translate(x, y);
  
  fill(Grey);
  stroke(DGrey);
  strokeWeight(10);
  
  //You can't get the same achievement twice
  String[] preferences = loadStrings("cursorsave.txt");
  if (rewardt == 1) {
    if (currentn >= totalreq && mouseX > x && mouseX < x + 325 && mouseY > y && mouseY < y + 325 && Integer.parseInt(preferences[rewardn + 1]) == 0) {
    stroke(60);
    }
  }
  
  rect(0, 0, 325, 325);
  
  fill(Black);
  textSize(50);
  
  text(rewardname, 162.5, 35);
  
  fill(20);
  textSize(30);
  
  text(reqdesc, 162.5, 225);
  
  if (rewardt == 1) {
    cursor(163, 130, 90, false, true, true, rewardn);
  } else if (rewardt == 2) {
    //Show target reward
  }
  
  fill(DGrey);
  stroke(Black);
  strokeWeight(5);
  
  rect(25, 250, 275, 50); 
  
  if (currentn >= totalreq) {
    fill(Green);
    noStroke();
    
    rect(25, 250, 275, 50);
    
    //Unlock reward
    if (rewardt == 1 && mousePressed == true) {
      savecursorpreferences(true, rewardn);
    }
  } else {
    fill(Black);
    
    float barX = map(currentn, 0, totalreq, 0, 275);
    
    rect(25, 250, barX, 50);
  }
  
  if (rewardt == 1 && Integer.parseInt(preferences[rewardn + 1]) == 1) {
    fill(DGrey);
    stroke(DGrey);
    strokeWeight(5);
    
    rect(25, 250, 275, 50);
    
    fill(Black);
    textSize(25);
    
    text("Unlocked", 162.5, 275);
  }
  
  popMatrix();
}
