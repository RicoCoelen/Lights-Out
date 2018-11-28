class Scene9 {
   
  /*
  setup function
  */
  Scene9() {

  }
  
  /*
  Function to update Scene1
  */
  void update() {
    // update game mechanics here
    frameCount = -1;
  }

  /*
  Function to draw Scene1
  */
  void draw() {
    // drawing background
    background(bgDeath);
 
    // draw text
    fill(255);
    textSize(60);
    text("Oops, Lights out buddy!", width / 8, 90);
    textSize(30);
    text("Top 10 Highscores:", width / 8, 130);
    
    int scoreY = 180;
    int position = 1;
    
    // get json array and max ten scores
    for (int i = 0; i < highscore.scoreList.size(); i++) {
      if (i < 10) { 
        String name = highscore.scoreList.get(i).getPName();
        int score = highscore.scoreList.get(i).getPScore();
        int id = highscore.scoreList.get(i).getPID();
        // draw score
        if (id == highscore.scoreList.size() - 1) {
          fill(255, 255, 0);
        }
        text("#" + position + "   Name: " + name + "   Score: " + score, width / 8, scoreY); // print score
        if (id == highscore.scoreList.size() - 1) {
          fill(255);
        }
        
        // add 100 for position
        scoreY += 25;
        position++;
      }
    }
    text("You might want to try again by pressing 0.", width / 8, 450);
  }
}
