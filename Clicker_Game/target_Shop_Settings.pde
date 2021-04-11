void target_shop() {
  //I literally just changed a few things in the skinbox function and then copy and pasted everything :)
  background(LGrey);
  
  balcounter(550, 550);
  skindisplay(50, 550);
  
  //Line to seperate skin display and bal from skin boxes
  fill(Grey);
  line(50, 525, 750, 525);
  
  //Skin boxes
  skinbox(50, 50, 1, 75, "Red", "A basic red target", "", false);
  skinbox(300, 50, 2, 75, "Green", "A basic green target", "", false);
  skinbox(550, 50, 3, 75, "Blue", "A basic blue target", "", false);
  skinbox(50, 300, 4, 150, "Neon Green", "A black and neon green target", "", false);
  skinbox(550, 300, 5, 600, "White", "A special white target,", "it turns the background black", false);
  skinbox(300, 300, 6, 300, "The Sun", "A target that looks like the sun,", "makes the score indicator grow faster", false);
}
