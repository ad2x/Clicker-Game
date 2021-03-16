//Clicker Game

//Alexander Double
//1-3b
//March 12 2021


//Used code from https://www.jeffreythompson.org/collision-detection/table_of_contents.php for the triangular buttons



//==== Mode Framework ====
int mode;
final int start = 0;
final int game = 1;
final int settings = 2;

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

//==== Cursor ====
boolean cursorc;
int cursorsize;
boolean cursorspin;
float cursorang;
int spinspeed;
boolean cursorspinr;

//Controls cursor shape
int cursorshape;
final int square = 0;
final int circle = 1;

//==== Triangle Button Coords (as with the cursor coords I simply denoted which button the variable is related to with a number next to it) ====
float x1_1 = 150;
float y1_1 = 175;
float x2_1 = 125;
float y2_1 = 350;
float x3_1 = 300;
float y3_1 = 300;  

float x1_2 = 310;
float y1_2 = 413;
float x2_2 = 464;
float y2_2 = 393;
float x3_2 = 461;
float y3_2 = 574;

//==== Triangle Button Bools ====
boolean hit_1;

boolean hit_2;

//Font
PFont font;

void setup() {
  size(800, 800);
  noCursor();
  
  //==== Initialize Mode ====
  mode = start;
  
  //==== Cursor ====
  cursorc = false;
  cursorsize = 20;
  cursorspin = false;
  cursorang = 0;
  spinspeed = 1;
  cursorspinr = false;
  
  //Create font
  font = createFont("cubic.ttf", 30);
  textAlign(CENTER, CENTER);
  textSize(30);
  textFont(font);
}

void draw() {
  //==== Mode Framework ====
  if (mode == start) {
    startscreen();
  } else if (mode == game) {
    game();
  } else if (mode == settings) {
    settingsmenu();
  } else {
    println("Mode " + mode + " does not exist");
  }
  
  //==== Cursor ====
  cursor();
  
  //Test
  //coordtest();
}

void mousePressed() {
  //Cursor lights up when mouse is pressed
  cursorclick();
}

void mouseReleased() {
  //Cursor isn't lit up if the mouse isn't pressed
  cursorclick();
  
  //Menu Buttons
  tributtoncheck_1();
  tributtoncheck_2();
}

void keyPressed() {
  esc_home();
}

void coordtest() {
  println(mouseX);
  println(mouseY);
}

//Press the escape key anywhere to instantly go back to the main menu
void esc_home() {
  if (keyCode == ESC) {
    //Overwrites the key so processing doesn't exit the program
    key = 0;
    // I made it check if the cursor is already spinning as pressing escape during the animation makes the cursor get permanently stuck at an angle
    if (cursorspinr == false && cursorspin == false && mode != start) {
      mode = start;
      cursorspinr = true;
    }
  }
}
