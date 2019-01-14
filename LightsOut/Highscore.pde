class Highscore {
  
  ArrayList<Score> scoreList = new ArrayList<Score>();
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
    text("Score: " + displayScore, 5, 55, 1000, 80);  // Text wraps within text box
  }
  
  /*
  Function to save the json array to file
  */
  void saveScore(String name, int currentScore) {
    // loop trough all scores
    for (int i = 0; i < highscore.highscores.size(); i++) {
      // add current score at the end of array
      if(i == highscore.highscores.size() - 1) {
        // create temp json object
        JSONObject tempObject = new JSONObject();
        // declare all object variables
        tempObject.setInt("id", ++i);
        tempObject.setString("name", name);
        tempObject.setString("time", day() + "-" + month() + "-" + year() + " " + hour() + ":" + minute());
        tempObject.setInt("score", currentScore);
        // set all variables in json array
        highscore.highscores.setJSONObject(i, tempObject);
      }
    }
    // save json array to file
    saveJSONArray(highscore.highscores, "data/highscores.json");
  }

  /*
  Function to get score sorted Score array
  */
  void sortScores() {
    // clear old scores
    scoreList.clear();
    // loop trough all json data
    for(int i = 0; i < highscores.size(); i++) {
      //  gets values from JSON array 
      int id = highscores.getJSONObject(i).getInt("id");
      String name = highscores.getJSONObject(i).getString("name");
      String time = highscores.getJSONObject(i).getString("time");
      int score = highscores.getJSONObject(i).getInt("score");
      // add to array list
      scoreList.add(new Score(id, name, time, score));
    }
    
    //  Sorts Score object by score (descending)
    Collections.sort(scoreList, new Comparator<Score>() {
      public int compare(Score s1, Score s2) {
        return Integer.valueOf(s2.getPScore()).compareTo(s1.getPScore());
      }
    }); 
  }
}
