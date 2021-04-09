void leaderboard() {
  background(LGrey);
  
  leaderboardtitle(50, 50);
  
  leaderboardbox(50, 250);
}

//=================================================================
//=================================================================
//Leaderboard title 
void leaderboardtitle(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  fill(Grey);
  stroke(DGrey);
  strokeWeight(10);
  
  rect(0, 0, 700, 150);
  
  fill(Black);
  textSize(125);
  
  text("Top 10 Scores", 350, 75);
  
  fill(Grey);
  stroke(DGrey);
  
  line(0, 175, 700, 175);
  
  popMatrix();
}

//=================================================================
//=================================================================
//Leaderboard rankings
void leaderboardbox(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  fill(Grey);
  stroke(DGrey);
  strokeWeight(10);
  
  rect(0, 0, 700, 500);
  
  //== Rankings ==
  //1st Place
  fill(Gold);
  textSize(80);
  text("1st", 80, 45);
  text("-", 350, 45);
  if (score1 == 0) {
    text("N/A", 600, 45);
  } else {
    text(score1, 600, 45);
  }
  //2nd Place
  fill(Silver);
  textSize(70);
  text("2nd", 80, 105);
  text("-", 350, 105);
  if (score2 == 0) {
    text("N/A", 600, 105);
  } else {
    text(score2, 600, 105);
  }
  //3rd Place
  fill(Bronze);
  textSize(60);
  text("3rd", 80, 157);
  text("-", 350, 157);
  if (score3 == 0) {
    text("N/A", 600, 157);
  } else {
    text(score3, 600, 157);
  }
  //4th-10th Place
  fill(45);
  textSize(50);
  
  text("4th", 80, 202);
  text("-", 350, 202);
  if (score4 == 0) {
    text("N/A", 600, 202);
  } else {
    text(score4, 600, 202);
  }
  
  text("5th", 80, 240);
  text("-", 350, 240);
  if (score5 == 0) {
    text("N/A", 600, 240);
  } else {
    text(score5, 600, 240);
  }
  
  text("6th", 80, 278);
  text("-", 350, 278);
  if (score6 == 0) {
    text("N/A", 600, 278);
  } else {
    text(score6, 600, 278);
  }
  
  text("7th", 80, 316);
  text("-", 350, 316);
  if (score7 == 0) {
    text("N/A", 600, 316);
  } else {
    text(score7, 600, 316);
  }
  
  text("8th", 80, 354);
  text("-", 350, 354);
  if (score8 == 0) {
    text("N/A", 600, 354);
  } else {
    text(score8, 600, 354);
  }
  
  text("9th", 80, 392);
  text("-", 350, 392);
  if (score9 == 0) {
    text("N/A", 600, 392);
  } else {
    text(score9, 600, 392);
  }
  
  text("10th", 80, 430);
  text("-", 350, 430);
  if (score10 == 0) {
    text("N/A", 600, 430);
  } else {
    text(score10, 600, 430);
  }

  popMatrix();
}
