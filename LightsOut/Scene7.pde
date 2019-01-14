class Scene7 {
   
  /*
  setup function
  */
  Scene7() {
    highscore.sortScores();
  }
 
  /*
  Function to update Scene1
  */
  void update() {
    if (state == 7) {
      if(player.downPressed) {
        state = 0;
      }
    }
  }

  /*
  Function to draw Scene1
  */
  void draw() {
    // get max highscores
    String aantal = str(highscore.scoreList.size());
    
    // drawing background
    background(bgDeath); 
    
    // draw top part
    textSize(60);
    text(aantal + " Highscores (Top 25):", 10, 50); 
    
    // scorey postion for loop
    int scoreY = 90;
    textSize(20);
    
    // draw score
      text("Name:    Score:    Time:" , 10 , 72); // print score
      
    // get json array from higscore class
    for (int i = 0; i < 25; i++) {
     
      // get from Score
      int id = highscore.scoreList.get(i).getPID();
      String name = highscore.scoreList.get(i).getPName();
      String time = highscore.scoreList.get(i).getPTime();
      int score = highscore.scoreList.get(i).getPScore();
      if (id == highscore.scoreList.size() - 1) {
          fill(255, 255, 0);
      }
      // draw score
      text(name + "        " + score + "        " + time, 10, scoreY); // print score
      
      if (id == highscore.scoreList.size() - 1) {
          fill(255);
        }
      // add 15 for position
      scoreY += 15;
    }
    
    // draw text
    text("Press Left Arrow to return.", 10, height - 10);
  }
}
