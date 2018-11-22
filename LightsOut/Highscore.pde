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
  Function to draw
  */
  void draw() {

  }

  /*
  Function to save the json array to file
  */
  void saveJson() {

    // array with the specified information
    String[] species = { "Angelo", "Steven", "Alex", "Rico" };

    // loop trough all
    for (int i = 0; i < species.length; i++) {
      // create temp json object
      JSONObject tempObject = new JSONObject();

      // declare all object variables
      tempObject.setInt("id", i);
      tempObject.setString("name", species[i]);
      tempObject.setString("time", day() + "-" + month() + "-" + year() + " " + hour() + ":" + minute());
      tempObject.setInt("score", 200);

      // set all variables in json array
      highscores.setJSONObject(i, tempObject);
    }

    // save json array to file
    saveJSONArray(highscores, "data/highscores.json");
  }

  /*
  Function to get json data from file
  */
  void getJson() {

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
  
  /*
  Function to sort json array by score (not done)
  */
  void sortJson() {

    JSONArray temp = new JSONArray();

    for (int i = 0; i < highscores.size(); i++) {
      temp.append(highscores.getJSONObject(i));
    }
    println(temp, highscores);
  }

  /*
  Function to compare 2 integers (not done)
  */
  int compare(JSONObject jsonObjectA, JSONObject jsonObjectB) {

      int compare = 0;
      try
      {
          int keyA = jsonObjectA.getInt("score");
          int keyB = jsonObjectB.getInt("score");
          compare = Integer.compare(keyA, keyB);
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      return compare;
  }
}
