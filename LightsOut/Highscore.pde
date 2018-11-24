class Highscore {

  JSONArray highscores;
  boolean highscoresCheck = true;

  /*
  setup function
  */
  Highscore() {
    // load highscores
    try 
    { 
      // try loading the json file
      highscores = loadJSONArray("data/highscores.json");
    } 
    catch (Exception e) 
    { 
      // if false no file exists
      highscoresCheck = false;
      // create new json array instead
      highscores = new JSONArray();
      // show error loading json array
      println(e);
    } 
  }
 
  /*
  Function to update highscore
  */
  void update() {

  }

  /*
  Function to draw score
  */
  void draw() {
    text("Score: " + score, 0, 0, 1000, 80);  // Text wraps within text box
  }

  /*
  Function to save the json array to file
  */
  void saveScore(String name, int currentScore) {
    // loop trough all scores
    for (int i = 0; i < highscores.size(); i++) {
      // add current score at the end of array
      if(i == highscores.size() - 1) {
        // create temp json object
        JSONObject tempObject = new JSONObject();
        // declare all object variables
        tempObject.setInt("id", ++i);
        tempObject.setString("name", name);
        tempObject.setString("time", day() + "-" + month() + "-" + year() + " " + hour() + ":" + minute());
        tempObject.setInt("score", currentScore);
        // set all variables in json array
        highscores.setJSONObject(i, tempObject);
      }
    }
    // save json array to file
    saveJSONArray(highscores, "data/highscores.json");
  }

  /*
  Function to get and print json data from file
  */
  void getPrintJson() {

    JSONArray values = highscores;

    for (int i = 0; i < values.size(); i++) {

      JSONObject item = values.getJSONObject(i); 

      int id = item.getInt("id");
      String name = item.getString("name");
      String time = item.getString("time");
      int score = item.getInt("score");

      println(id, name, time, score);
    }
  }
}
