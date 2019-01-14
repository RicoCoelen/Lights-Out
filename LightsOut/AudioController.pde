class AudioController {
  AudioPlayer audio;
  
  AudioController(PApplet p, String filename) {
    minim = new Minim(p);
    audio = minim.loadFile(filename);
  }
  
  void changeSource(PApplet p, String filename) {
    minim = new Minim(p);
    audio = minim.loadFile(filename);
  }
  
  void play() {
    audio.play();
  }
  
  void loop() {
    audio.loop();
  }
  
  void stop() {
    audio.close();
  }
}
