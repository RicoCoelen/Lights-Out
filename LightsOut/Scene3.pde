class Scene3 {
  float delayCounter;
  float delay = 0.15; //  sets delay in seconds 

  
  /*
  setup function
  */
  Scene3() {

  }
  
  /*
  Function to update Scene1
  */
  void update() {
    highscore.sortScores();
    if (state == 3) {
      delayCounter+=(float)1/60;
      if (delayCounter >= delay) {
        if(player.rightPressed) {
          reset();
          state = 0;
          delayCounter = 0;
        } 
      }
    }
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
    text("You Survived!", width / 8, 90);
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
