class Scene7 {
   
  /*
  setup function
  */
  Scene7() {
  
  }
 
  /*
  Function to update Scene1
  */
  void update() {
    if (state == 7) {
      if(player.leftPressed) {
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
    text(aantal + " Highscores:", 10, 50); 
    
    
    // scorey postion for loop
    int scoreY = 70;
    textSize(20);
    
    // get json array from higscore class
    for (int i = 0; i < highscore.scoreList.size(); i++) {
     
      // get from Score
      int id = highscore.scoreList.get(i).getPID();
      String name = highscore.scoreList.get(i).getPName();
      String time = highscore.scoreList.get(i).getPTime();
      int score = highscore.scoreList.get(i).getPScore();
      // draw score
      text("ID: " + id + "   Name: " + name + "   Score: " + score + "   Time: " + time, 10, scoreY); // print score
      // add 15 for position
      scoreY += 15;
    }
    
    // draw text
    text("Press Left Arrow to return.", 10, height - 10);
  }
}
