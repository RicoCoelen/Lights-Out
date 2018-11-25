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
    textSize(40);
    text("Oops, Lights out buddy!", width / 8, 90);
    textSize(20);
    text("Top 10 Highscores:", width / 8, 130);
    
    int scoreY = 180;
    
    // get json array and max ten scores
    for (int i = 0; i < 10; i++) {
      // get json object from higscore class
      JSONObject item = highscore.highscores.getJSONObject(i); 
      // get from object
      int id = item.getInt("id");
      String name = item.getString("name");
      String time = item.getString("time");
      int score = item.getInt("score");
      // draw score
      text("Name: " + name + "   Score: " + score, width / 8, scoreY); // print score
      // add 100 for position
      scoreY += 25;
    }
    text("You might want to try again by pressing 0.", width / 8, 450);
  }
}
