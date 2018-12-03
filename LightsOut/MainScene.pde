class MainScene {
  
  // init scenes mainmenu, 1,2 - 6,7,8,9
  MainMenu mainmenu = new MainMenu();
  Scene1 scene1 = new Scene1();
  Scene2 scene2 = new Scene2();
  Scene3 scene3 = new Scene3();
  Scene6 scene6 = new Scene6();
  Scene7 scene7 = new Scene7();
  Scene8 scene8 = new Scene8();
  Scene9 scene9 = new Scene9();
   
  /*
  Function to update scenes
  */
  void update() {
    switch (state) { 
      case 0:
      // main menu
        mainmenu.draw();
        mainmenu.update();
      break;
      // endless survival
      case 1:
        scene1.update();
        scene1.draw();
      break; 
      case 2:
      // maybe tutorial and switch later with 1?
        scene2.update();
        scene2.draw();
      break; 
      case 3:
      // maybe tutorial and switch later with 1?
        scene3.update();
        scene3.draw();
      break; 
      case 6:
      // Option screen
        scene6.update();
        scene6.draw();
      break; 
      case 7:
      // highscore screen
        scene7.update();
        scene7.draw();
      break; 
      case 8:
      // enter name screen
        scene8.update();
        scene8.draw();
      break; 
      case 9:
      // death with highscore
        scene9.update();
        scene9.draw();
      break; 
    }  
  }
}
