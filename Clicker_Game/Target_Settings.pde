void targetsettings() {
  background(LGrey);
  
  target_size_slider(50, 50);
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
  
  fill(Grey);
  
  ellipse(target_sliderX - 50, target_sliderY - 50, 50, 50);
  
  textSize(30);
  fill(Black);
  text("Target Size", 80, 20);
  
  popMatrix();
}
