//Clicker Game

//Alexander Double
//1-3b
//March 12 2021


//Used code from https://www.jeffreythompson.org/collision-detection/table_of_contents.php for the triangular buttons


import java.util.Arrays;

//==== Mode Framework ====
int mode;
final int start = 0;
final int game = 1;
final int settings = 2;
final int cursor_settings = 3;
final int cursor_shop_settings = 4;
final int leaderboard = 5;
final int general_settings = 6;
final int target_settings = 7;
final int cursor_achievements_settings = 8;
final int target_shop_settings = 9;
final int target_achievements_settings = 10;

//==== Colour Palette ====
color White = #FFFFFF;
color Black = #000000;
color LGrey = #CBCBCB;
color Grey = #8E8E8E;
color DGrey = #5F5F5F;
color LBlue = #7C92FF;
color Blue = #0832FC;
color DBlue = #001CA0;
color LRed = #FF4040;
color Red = #FF0000;
color DRed = #AD0000;
color DGreen = #007D00;
color Green = #00C800;
color LGreen = #00E600;
color DGold = #B58D3D;
color Gold = #D3A13B;
color Silver = #C0C0C0;
color Bronze = #CD7F32;
color Brown = #964B00;
color DBrown = #51361a;
color DDBrown = #171009;
color Yellow = #ffc921;
color Orange = #ff8100;
color DDGrey = #222222;

//==== Cursor ====
boolean cursorc;
int cursorsize;
boolean cursorspin;
float cursorang;
final int spinspeed = 1;
boolean cursorspinr;
boolean shapetoggle;
boolean circletoggle;
//For skins
color cursorfill;
color cursorstroke;
//Skin hit var
boolean click;
//Controls cursor shape
int cursorshape;
final int square = 0;
final int circle = 1;

//Cursor colour scheme/skin variable
int cursorskin;
//Not really that useful, these are mostly just here so I can remember which skin corresponds to which number
final int defaultskin = 0;
final int redskin = 1;
final int greenskin = 2;
final int blueskin = 3;
final int whiteskin = 4;
final int goldskin = 5;
final int timeskin = 6;
final int iceskin = 7;
final int lavaskin = 8;
//Ints for locking and unlocking skins, I didn't use booleans so I could more easily save and load them
int redskinlock;
int greenskinlock;
int blueskinlock;
int whiteskinlock;
int goldskinlock;
int timeskinlock;
int iceskinlock;
int lavaskinlock;

//Strings
String cursorcolour;

//Special cursor effect ints 
int goldbonus;
int timebonus;
int icebonus;
int lavabonus;

//==== Triangle Button Coords (as with the cursor coords I simply denoted which button the variable is related to with a number next to it) ====
//-- Start Menu --
//Game
float x1_1 = 150;
float y1_1 = 175;
float x2_1 = 125;
float y2_1 = 350;
float x3_1 = 300;
float y3_1 = 300;  
//Settings
float x1_2 = 310;
float y1_2 = 413;
float x2_2 = 464;
float y2_2 = 393;
float x3_2 = 461;
float y3_2 = 574;
//Leaderboard
float x1_3 = 505;
float y1_3 = 128;
float x2_3 = 320;
float y2_3 = 180;
float x3_3 = 576;
float y3_3 = 321;

//-- Settings menu --
//Cursor
float x1_4 = 187;
float y1_4 = 126;
float x2_4 = 112;
float y2_4 = 324;
float x3_4 = 295;
float y3_4 = 375;
//Target
float x1_5 = 344;
float y1_5 = 357;
float x2_5 = 590;
float y2_5 = 602;
float x3_5 = 562;
float y3_5 = 382;

//==== Triangle Button Vars ====
//--Bools--
boolean hit_1;

boolean hit_2;

boolean hit_3;

boolean hit_4;

boolean hit_5;
//--Hover Vars--
int buttonhover_1;

int buttonhover_2;

int buttonhover_3;

int buttonhover_4;

int buttonhover_5;

//Font
PFont font;

//==== Slider Vars ====
int cursor_sliderX = 300;
int cursor_sliderY = 125;
int target_sliderX = 400;
int target_sliderY = 125;

//==== Shop Button ====
boolean shopbuttoncheck;
boolean shopbuttoncheck_target;

//==== Gameplay ====
//Target
float targetX;
float targetY;
float targetD;

color targetFill;
color targetStroke;
color targetText;

float velocityX;
float velocityY;

//The actual velocity of the target away from the center at the start fo the game 
float velocityH;

//==== Target Skins ====
int targetskin;

final int tdefaultskin = 0;
final int tredskin = 1;
final int tgreenskin = 2;
final int tblueskin = 3;
final int tblackskin = 4;
final int twhiteskin = 5;
final int tearthskin = 6;
final int tmatchingskin = 7;

int tredskinlock;
int tgreenskinlock;
int tblueskinlock;
int tblackskinlock;
int twhiteskinlock;
int tearthskinlock;
int tmatchingskinlock;

//Mode framework for game pausing and start
//I kind of regret not doing the same for the settings screen but it seems pointless now
int game_mode;
final int start_game = 0;
final int playing = 1;
final int paused = 2;
final int game_over = 3;

//Hit check for play button
boolean play_check;

//Score variable
//It starts at 2 because for some reason it starts at -3 otherwise (it counts clicking on buttons as missing the target)
int score = 2;

//Represents whether the score has gone up in the current frame
boolean scoreup = false;

//Variable for the size of the scorecounter
float scoresize = 0;

//Time variable 

int gametime = 15;

int secondsleft = gametime;
int currentsecond;

int pausedtime1;
int pausedtime2;
int pausedtimet;

//==== Leaderboard ====
int score1;
int score2;
int score3;
int score4;
int score5;
int score6;
int score7;
int score8;
int score9;
int score10;

//==== Balance ====
int balance;
//The amount of balance gained from a single play, I made it a seperate variable so I could more easily display the amount gained under the balance, I called it newbalance because it's funny
int newbalance;

//==== Achievements ====
boolean achievementbuttoncheck;

//Games played achievement
int gamesplayed;
int pointsearned;

void setup() {
  size(800, 800, FX2D);
  noCursor();
  
  //==== Initialize Modes ====
  mode = start;
  game_mode = start_game;
  
  //==== Cursor ====
  cursorc = false;
  cursorspin = false;
  cursorang = 0;
  cursorspinr = false;
  
  goldbonus = 1;
  timebonus = 1;
  icebonus = 1;
  lavabonus = 1;
  
  //Create font
  font = createFont("AldotheApache.ttf", 30);
  textAlign(CENTER, CENTER);
  textSize(30);
  textFont(font);
  
  //==== Buttons ====
  buttonhover_1 = 1;
  buttonhover_2 = 1;
  buttonhover_3 = 1;
  buttonhover_4 = 1;
  buttonhover_5 = 1;
  
  //==== Cursor ====
  //Load cursor configuration
  String[] preferences1 = loadStrings("cursorsave.txt");
  cursorskin = Integer.parseInt(preferences1[0]);
  cursorsize = Integer.parseInt(preferences1[1]);
  //Which skins have been unlocked
  redskinlock = Integer.parseInt(preferences1[2]);
  greenskinlock = Integer.parseInt(preferences1[3]);
  blueskinlock = Integer.parseInt(preferences1[4]);
  whiteskinlock = Integer.parseInt(preferences1[5]);
  goldskinlock = Integer.parseInt(preferences1[6]);
  timeskinlock = Integer.parseInt(preferences1[7]);
  iceskinlock = Integer.parseInt(preferences1[8]);
  lavaskinlock = Integer.parseInt(preferences1[9]);
  
  //==== Leaderboard ====
  String[] leaderboard1 = loadStrings("leaderboard.txt");
  //Top 10 scores
  score1 = Integer.parseInt(leaderboard1[0]);
  score2 = Integer.parseInt(leaderboard1[1]);
  score3 = Integer.parseInt(leaderboard1[2]);
  score4 = Integer.parseInt(leaderboard1[3]);
  score5 = Integer.parseInt(leaderboard1[4]);
  score6 = Integer.parseInt(leaderboard1[5]);
  score7 = Integer.parseInt(leaderboard1[6]);
  score8 = Integer.parseInt(leaderboard1[7]);
  score9 = Integer.parseInt(leaderboard1[8]);
  score10 = Integer.parseInt(leaderboard1[9]);
  
  //==== General Stuff ====
  String[] general1 = loadStrings("general.txt");
  //Balance is saved to the general file
  balance = Integer.parseInt(general1[0]);
  gamesplayed = Integer.parseInt(general1[1]);
  pointsearned = Integer.parseInt(general1[2]);
  
  //==== Target Config ====
  String[] tpreferences1 = loadStrings("targetsave.txt");
  targetskin = Integer.parseInt(tpreferences1[0]);
  targetD = Integer.parseInt(tpreferences1[1]);
  //Skins
  tredskinlock = Integer.parseInt(tpreferences1[2]);
  tgreenskinlock = Integer.parseInt(tpreferences1[3]);
  tblueskinlock = Integer.parseInt(tpreferences1[4]);
  tblackskinlock = Integer.parseInt(tpreferences1[5]);
  twhiteskinlock = Integer.parseInt(tpreferences1[6]);
  tearthskinlock = Integer.parseInt(tpreferences1[7]);
  tmatchingskinlock = Integer.parseInt(tpreferences1[8]);
  
  //Makes sure the size sliders is properly adjusted
  cursor_rslidermap(); 
  target_rslidermap();
  
  //==== Target ====
  //Init. vars
  targetX = width/2;
  targetY = height/2;
  
  velocityH = 5;
}

void draw() {
  //==== Saves Cursor Options ====
  savecursorpreferences(false, 0);
  
  //==== Saves Target Options ====
  targetsavepref(false, 0);
  
  //==== Saves Bala
  generalsave();
  
  //==== Mode Framework ====
  switch(mode) {
    case 0:
      startscreen();
      break;
    case 1:
      game();
      break;
    case 2:
      settingsmenu();
      break;
    case 3:
      cursorsettings();
      break;
    case 4:
      shop();
      break;
    case 5:
      leaderboard();
      break;
    case 6:
      println("Error");
      //I originally planned to add general settings, but changed my mind later, I never got rid of the mode itself though
      break;
    case 7:
      targetsettings();
      break;
    case 8:
      achievements_settings();
      break;
    case 9:
      target_shop();
      break;
    case 10:
      achievements_settings();
      break;
    default:
      println("Mode " + mode + " does not exist");
  }
  
  //Esc pointer
  if (game_mode != playing && game_mode != paused && game_mode != game_over) {
    escpointer();
  }
  
  //==== Cursor ====
  cursor(mouseX, mouseY, cursorsize, true, false, false, cursorskin);
  
  //Test
  //coordtest();
  //println(mode);
  //println(hit_4);'
  //println(Math.round(map(sliderX, 90, 710, 10, 50)) + "what");
  //println(Math.round(map(cursorsize, 10, 50, 90, 710)));
  //println(cursorsize);
  //println(secondsleft);
  //println(hit_5);
  //println(mode);
  //println(achievementbuttoncheck);
}

void mousePressed() {
  //Cursor lights up when mouse is pressed
  cursorclick();
  
  //For hitting the target
  scoreincrease();
  
  target_slidermove();
}

void mouseReleased() {
  //Cursor isn't lit up if the mouse isn't pressed
  cursorclick();
  
  //Menu Buttons
  tributtoncheck_1();
  tributtoncheck_2();
  tributtoncheck_3();
  tributtoncheck_4();
  tributtoncheck_5();
  
  //Slider clicked
  cursor_slidermove();
  target_slidermove();
  
  //Shop butotn check
  if (shopbuttoncheck == true && mode == cursor_settings) {
    mode = cursor_shop_settings;
    cursorspin = true;
    shopbuttoncheck = false;
  } else if (shopbuttoncheck == true && mode == target_settings) {
    mode = target_shop_settings;
    cursorspin = true;
    shopbuttoncheck = false;
  }
  
  //Toggle cursor view shape
  cursorviewtoggle();
  
  //For inventory
  click = true;
  
  //For game start/play button
  play_button_check();
  
  //For play again button
  playagaincheck(600, 600);
  
  //For cursor achievement button
  achievementbuttoncheck();
  
  //For settings target size
  target_difficulty_set();
}

void mouseMoved() {
  //Fixes issue where if you click at any point before the cursor settings screen (which you have to) the inventory skin buttons are activated if you just move your cursor over them
  //Not a perfect fix but it works, the only issue being that you can't click the buttons if you're still moving your mouse, people don't usually click while moving their cursors so I just left it 
  click = false;
}

void keyPressed() {
  esc_home();
}

void mouseDragged() {
  //Slider dragged
  cursor_slidermove();
  target_slidermove();
}

void coordtest() {
  println(mouseX, mouseY);
}

//Press the escape key anywhere to instantly go back to the main menu
void esc_home() {
  if (keyCode == ESC) {    
    //Fixes issue where the hit var for a button persists after leaving respective menu leading to the next button you press leading back to that buttons menu instead
    hit_1 = false;
    hit_2 = false;
    hit_3 = false;
    hit_4 = false;
    shopbuttoncheck = false;
    achievementbuttoncheck = false;
    //Overwrites the key so processing doesn't exit the program
    key = 0;
    // I made it check if the cursor is already spinning as pressing escape during the animation makes the cursor get permanently stuck at an angle
    if (cursorspin == false && game_mode != playing && game_mode != paused && game_mode != game_over) {
      cursorspinr = true;
      if (mode == settings || mode == game || mode == leaderboard) {
        mode = start;
      } else if (mode == cursor_settings || mode == target_settings) {
        mode = settings;
      } else if (mode == cursor_shop_settings || mode == cursor_achievements_settings) {
        mode = cursor_settings;
      } else if (mode == target_achievements_settings || mode == target_shop_settings) {
        mode = target_settings;
      } else if (mode == start) {
        exit();
      } 
    }
    
    //For gameplay
    if (game_mode == playing) {
      pausedtime1 = (minute() * 60) + second();
      //println(pausedtime1);
      game_mode = paused;
    } else if (game_mode == paused) {
      pausedtime2 = (minute() * 60) + second();
      pausedtimet = pausedtimet + (pausedtime2 - pausedtime1);
      //println(pausedtime1, pausedtime2);
      game_mode = playing;
    }
  }
}

void escpointer() {
  fill(Grey, 50);
  stroke(DGrey, 50);
  strokeWeight(5);
  rect(0, 0, 50, 50);
  
  textSize(20);
  text("Esc", 25, 25);
}

//For triangle button detection
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

//Function for saving balance + achievements
void generalsave() {
    //Creates a general array to save the balance value
    int[] general2 = new int[3];
    general2[0] = balance;
    general2[1] = gamesplayed;
    general2[2] = pointsearned;
    
    String[] general2string = str(general2);
    saveStrings("general.txt", general2string);
}
