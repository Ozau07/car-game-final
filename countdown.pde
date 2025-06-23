void countdown() {
  image(gif[f], 0, 0, width, height);
  f++;
  if (f == numberofframes) {
    f = 0;
  }
    
  textSize(200);
  fill(255);
  
  if (count >= 360) {
    text("READY?", width/2, height/2);
  } else if (count >= 300) {
    text("3", width/2, height/2);
  } else if (count >= 240) {
    text("2", width/2, height/2);
  } else if (count >= 180) {
    text("1", width/2, height/2);
  } else if (count >= 120) {
    text("0", width/2, height/2);
  } else if (count >= 60) {
    text("START!", width/2, height/2);
  } else if (count >= 0) {
    mode = GAME;
  }
  
  count--;
}
