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
    String aantal = str(highscore.highscores.size());
    
    // drawing background
    background(bgDeath); 
    
    // draw top part
    textSize(60);
    text(aantal + " Highscores:", 10, 50); 
    
    
    // scorey postion for loop
    int scoreY = 70;
    textSize(20);
    
    // get json array from higscore class
    for (int i = 0; i < highscore.highscores.size(); i++) {
      // get json object from higscore class
      JSONObject item = highscore.highscores.getJSONObject(i); 
      // get from object
      int id = item.getInt("id");
      String name = item.getString("name");
      String time = item.getString("time");
      int score = item.getInt("score");
      // draw score
      text("ID   " + id + "   Name: " + name + "   Score: " + score + "   Time: " + time, 10, scoreY); // print score
      // add 15 for position
      scoreY += 15;
    }
    
    // draw text
    text("Press Left Arrow to return.", 10, height - 10);
  }
}
