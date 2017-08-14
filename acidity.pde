/*
 * Acidity by James Anthony Bruno (github.com/czycha)
 * Ported from Crystal (github.com/czycha/acidity)
 * MIT license
 */

import static java.lang.Math.toIntExact;

PImage input;

int RADIUS = 9;  // Larger numbers take longer, but produce more interesting results
String IMAGENAME = "drake";  // Name of image before extension
String IMAGEEXT = "png";  // Extension without period
boolean ITERATE = false;  // Iteratively acidify
boolean SAVEME = false;  // Whether to save image or not. Saves frames to convert to movie using MovieMaker if ITERATE is true.

PImage acidify(PImage input) {
  PImage output = createImage(input.width, input.height, RGB);
  for(int i = 0; i < input.pixels.length; i++) {
    int x = i % input.width,
        y = i / input.width;
    long sum = 0, 
         count = 0;
    for(int xi = (x - RADIUS); xi <= (x + RADIUS); xi++) {
      if(xi < 0 || input.width <= xi) continue;
      for(int yi = (y - RADIUS); yi <= (y + RADIUS); yi++) {
        if(yi < 0 || input.height <= yi) continue;
        sum += input.pixels[xi + yi * input.width];
        count++;
      }
    }
    output.pixels[i] = toIntExact(sum / count);
  }
  return output;
}

void setup() {
  colorMode(RGB, 255, 255, 255);
  input = loadImage(IMAGENAME + "." + IMAGEEXT);
  size(1, 1);
  surface.setResizable(true);
  surface.setSize(input.width, input.height);
  input.loadPixels();
  if(!ITERATE) noLoop();
}

void draw() {
  input = acidify(input);
  image(input, 0, 0);
  if(SAVEME && !ITERATE) {
    input.save(IMAGENAME + ".acid." + IMAGEEXT);
  } else if(SAVEME && ITERATE) {
    saveFrame(IMAGENAME + "/frame-####.tga");
  }
}