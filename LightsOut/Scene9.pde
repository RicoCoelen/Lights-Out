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
    
    // get json array and max ten scores
    for (int i = 0; i < highscore.highscores.size(); i++) {
      if (i < 10) {
        // get json object from higscore class
        JSONObject item = highscore.highscores.getJSONObject(i); 
        // get from object
        int id = item.getInt("id");
        String name = item.getString("name");
        int score = item.getInt("score");
        // draw score
        if (id == highscore.highscores.size() - 1) {
          fill(255, 255, 0);
        }
        text("Name: " + name + "   Score: " + score, width / 8, scoreY); // print score
        if (id == highscore.highscores.size() - 1) {
          fill(255);
        }
        // add 100 for position
        scoreY += 25;
      }
    }
    text("You might want to try again by pressing 0.", width / 8, 450);
  }
}
