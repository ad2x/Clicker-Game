void game() {
  background(LGrey);
  
  //Target
  target(targetX, targetY, targetD);
  
  //Mode framework
  if (game_mode == start_game) {
    start_screen();
  } else if (game_mode == playing) {
    gameplay();
    timer(targetX, targetY);
  } else if (game_mode == paused) {
    paused();
    timer(targetX, targetY);
  } else if (game_mode == game_over) {
    background(Grey);
    gameover();
  }
  
}

//=================================================================
//=================================================================
//The target that you click on 
void target(float x, float y, float d) {
  pushMatrix();
  translate(x, y);
  
  fill(targetFill, 210);
  stroke(targetStroke, 210);
  
  ellipse(0, 0, d, d);
  
  //Movement
  if (game_mode == playing) {
    targetX = targetX + velocityX;
    targetY = targetY + velocityY;
  }
  
  //Bouncing 
  if (targetX <= 0 + targetD/2 || targetX >= width - targetD/2) {
    velocityX = -velocityX;
  }
  if (targetY <= 0 + targetD/2 || targetY >= height - targetD/2) {
    velocityY = -velocityY;
  }
  
  popMatrix();
}

//=================================================================
//=================================================================
//Randomizes the target velocity each time, I came up with this elaborate way of making sure the actual speed of the target is the same each time because I didn't like my game being luck based
void targetRandom() {
  //First I get a random degree from 0-360 around the origin
  float random = random(0, 360);
  
  //Makes the vertical and horizontal components negative or positive depending on the quadrant
  int xneg;
  int yneg;
  
  //I get the reference angle and adjust the vertical and horizontal components accordingly
  if (random <= 90) {
    xneg = 1;
    yneg = 1;
  } else if (random <= 180) {
    xneg = -1;
    yneg = 1;
    random = 180 - random;
  } else if (random <= 270) {
    xneg = -1;
    yneg = -1;
    random = random - 180;
  } else {
    xneg = 1;
    yneg = -1;
    random = 360 - random;
  }
  
  //Calculate  the x and y components of the targets velocity
  velocityX = (float) Math.cos(random)*velocityH*xneg;
  velocityY = (float) Math.sin(random)*velocityH*yneg;
  
  //Resets the position of the target
  targetX = width/2;
  targetY = width/2;
}

//Timer
void timer(float x, float y) {
  if (secondsleft > 0 && game_mode == playing) {
    secondsleft = currentsecond - (second() + minute() * 60) + gametime + pausedtimet;
  }
  
  pushMatrix();
  translate(x, y);
  
  fill((150/gametime)*(gametime - secondsleft), 0, 0, 140);
  textSize(60);
  
  text(secondsleft, 0, 0);
  
  popMatrix();
}

//=================================================================
//=================================================================
//Function for the start screen before you play 
void start_screen() {
  play_button(300, 600);
}

void play_button(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  fill(Grey);
  strokeWeight(10);
  
  if (mouseX >= x && mouseX <= x + 200 && mouseY >= y && mouseY <= y + 100) {
    play_check = true;
    stroke(60);
  } else {
    play_check = false;
    stroke(DGrey);
  }
  
  rect(0, 0, 200, 100, 45, 45, 45, 45);
  
  fill(Black);
  textSize(30);
  
  text("Start Game", 100, 50);
  
  popMatrix();
}

//Play button check for mousereleased
void play_button_check() {
  if (play_check == true) {
    game_mode = playing;
    play_check = false;
    currentsecond = second() + minute() * 60;
    pausedtime1 = 0;
    pausedtime2 = 0;
  }
}

//=================================================================
//=================================================================
//Function for when the game is actually being played
void gameplay() {
  scorecounter();
  //You need to keep hitting the target for the scorecounter to stay at the same size and it shrinks faster the bigger it is 
  if (scoresize > 0) {
    scoresize = scoresize - (scoresize * 0.01);
  }
  gameend();
}

void scoreincrease() {
  if (dist(mouseX, mouseY, targetX, targetY) <= targetD/2 && game_mode == playing) {
    score++;
    scoreup = true;
    scorecountersize();
    scoreup = false;
  } else if (score > 0 && game_mode == playing) {
    score--;
    scoresize--;
  }
}

void scorecounter() {
  pushMatrix();
  translate(width/2, height/2);
  
  fill(Black, 100);
  textSize(80 + scoresize);
  
  text(score, 0, 0);
  
  popMatrix();
}

//The score counter grows if your score is increasing and shrinks if it isn't 
void scorecountersize() {
  if (scoreup = true && scoresize < 250) {
    scoresize = scoresize + 10;
  } else if (game_mode == playing) {
    scoresize = scoresize - 5;
  }
}

//Ends the game if your timer reaches 0
void gameend() {
  if (secondsleft == 0) {
    game_mode = game_over;
    //Saves the new leaderbaord
    int[] leaderboard2 = new int[11];
    leaderboard2[0] = score1;
    leaderboard2[1] = score2;
    leaderboard2[2] = score3;
    leaderboard2[3] = score4;
    leaderboard2[4] = score5;
    leaderboard2[5] = score6;
    leaderboard2[6] = score7;
    leaderboard2[7] = score8;
    leaderboard2[8] = score9;
    leaderboard2[9] = score10;
    leaderboard2[10] = score;
    
    //Rearranges the leaderboard into the correct order
    java.util.Arrays.sort(leaderboard2);
    
    //Removes the lowest score in the leaderboard by making another array without the lowest value (because arraylists scare me)
    //Also reverses the order of the array so the first item is the highest
    int[] leaderboard3 = new int [10];
    leaderboard3[0] = leaderboard2[10];
    leaderboard3[1] = leaderboard2[9];
    leaderboard3[2] = leaderboard2[8];
    leaderboard3[3] = leaderboard2[7];
    leaderboard3[4] = leaderboard2[6];
    leaderboard3[5] = leaderboard2[5];
    leaderboard3[6] = leaderboard2[4];
    leaderboard3[7] = leaderboard2[3];
    leaderboard3[8] = leaderboard2[2];
    leaderboard3[9] = leaderboard2[1];
    
    //Saves the new values to the txt file
    String[] leaderboardstring = str(leaderboard3);
    saveStrings("leaderboard.txt", leaderboardstring);
    
    //Sets the score values to the new values
    score1 = leaderboard3[0];
    score2 = leaderboard3[1];
    score3 = leaderboard3[2];
    score4 = leaderboard3[3];
    score5 = leaderboard3[4];
    score6 = leaderboard3[5];
    score7 = leaderboard3[6];
    score8 = leaderboard3[7];
    score9 = leaderboard3[8];
    score10 = leaderboard3[9];
    
    //The player gains an amount of currency relative to their score + a base amount
    newbalance = Math.round(score/10) + 10;
    if (balance + newbalance <= 999) {
      balance = balance + newbalance;
    } else {
      balance = 999;
    }
  }
}

//=================================================================
//=================================================================
//Function for when the game is paused
void paused() {
  pausescreen(250, 288);
  exitbutton(50, 750);
}

void pausescreen(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  fill(Grey, 200);
  stroke(DGrey, 200);
  strokeWeight(10);
  
  rect(0, 0, 300, 225, 65, 65, 65, 65);
  
  strokeWeight(20);
  
  line(120, 62, 120, 178);
  line(180, 62, 180, 178);
  
  popMatrix();
}

//Button to go back to start menu
void exitbutton(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  if (dist(mouseX - x, mouseY - y, 0, 0) <= 25) {
    fill(DRed, 220);
    stroke(DRed);
  } else {
    fill(DRed, 140);
    stroke(DRed, 220);
  }
  
  strokeWeight(10);
  
  ellipse(0, 0, 50, 50);
  
  //Returns user to start menu if exit button is pressed
  if (dist(mouseX - x, mouseY - y, 0, 0) <= 25 && click == true) {
    mode = start;
    game_mode = start_game;
    cursorspinr = true;
  }
  
  popMatrix();
}

//=================================================================
//=================================================================
//Function for the game over screen
void gameover() {
  gamescore(400, 200);
  highscores(200, 600);
  playagain(600, 600);
  balancebar_gameover(740, 35);
}

void gamescore(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  fill(Black);
  textSize(125);
  
  text("Score:", 0, 0);
  
  textSize(100);
  
  text(score, 0, 150);
  
  popMatrix();
}

void highscores(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  fill(LGrey);
  stroke(DGrey);
  strokeWeight(10);
  
  rect(-150, -150, 300, 300);
  
  fill(Black);
  textSize(60);
  
  text("Highscores", 0, -100);
  
  textSize(30);
  
  //If statements to make it so if any of the top 3 scores are 0 it shows N/A instead of 0
  
  fill(Gold);
  if (score1 == 0) {
    text("1st    N/A", 0, -40);
  } else {
    text("1st    " + score1, 0, -40);
  }
  
  fill(120);
  if (score2 == 0) {
    text("2nd    N/A", 0, 20);
  } else {
    text("2nd    " + score2, 0, 20);
  }
  
  fill(Bronze);
  if (score3 == 0) {
    text("3rd    N/A", 0, 80);
  } else {
    text("3rd    " + score3, 0, 80);
  }
  
  popMatrix();
}

void playagain(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  fill(LGrey);
  stroke(DGrey);
  strokeWeight(10);
  
  rect(-150, -150, 300, 300);
  
  fill(Black);
  if (mouseX >= x - 65 && mouseX <= x + 65 && mouseY >= y - 50 && mouseY <= y + 50) {
    fill(5);
    textSize(75);
  } else {
    fill(Black);
    textSize(60);
  }
  
  text("Play", 0, -30);
  text("Again", 0, 30);
  
  popMatrix();
}

void playagaincheck(int x, int y) {
  if (mouseX >= x - 65 && mouseX <= x + 65 && mouseY >= y - 50 && mouseY <= y + 50 && game_mode == game_over) {
    //Reset the pos and get a new random direction for the target
    targetRandom();
    
    score = 0;
    secondsleft = gametime;
    
    game_mode = start_game;
  }
}

//Balance box at the top right of the screen
void balancebar_gameover(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  fill(LGrey);
  stroke(DGrey);
  strokeWeight(5);
  
  rect(-50, -25, 100, 50);
  
  fill(Black);
  textSize(40);
  
  text("$" + balance, 0, 0);
  
  fill(LGreen);
  textSize(20);
  
  text("+$" + newbalance, 0, 50);
  
  popMatrix();
}
