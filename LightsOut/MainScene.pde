class MainScene {
  
  // init scenes 1,2 - 7,8,9
  Scene1 scene1 = new Scene1();
  Scene2 scene2 = new Scene2();
  Scene7 scene7 = new Scene7();
  Scene8 scene8 = new Scene8();
  Scene9 scene9 = new Scene9();
   
  /*
  Function to update scenes
  */
  void update() {
    switch (state) { 
      case 0:
        m.draw();
        m.update();
      break;
      case 1:
        scene1.update();
        scene1.draw();
      break; 
      case 2:
        scene2.update();
        scene2.draw();
      break; 
      case 7:
        scene7.update();
        scene7.draw();
      break; 
      case 8:
        scene8.update();
        scene8.draw();
      break; 
      case 9:
        scene9.update();
        scene9.draw();
      break; 
    }  
  }
}
