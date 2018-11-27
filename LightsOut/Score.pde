class Score {
  
  int id;
  String name;
  String time;
  int score;
  
  Score(int id, String name, String time, int score ) {
    this.id = id;
    this.name = name;
    this.time = time;
    this.score = score;
  }
 
  int getPID() {
    return id;
  }
 
  String getPName() {
    return name;
  }
 
  String getPTime() {
    return time;
  }
 
  int getPScore() {
    return score;
  }
 
}
