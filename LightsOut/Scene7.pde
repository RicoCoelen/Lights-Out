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

  }

  /*
  Function to draw Scene1
  */
  void draw() {
    // drawing background
    background(255); 
    // top part
    fill(50);
    // change text
    textSize(20);
    text("Highscores:", 10, 50); 
    // scorey postion for loop
    int scoreY = 90;
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
      // add 100 for position
      scoreY += 25;
    }
     // if arrow return
    if (state == 7 && player.leftPressed) {
      state = 0;
    }
  }
}
