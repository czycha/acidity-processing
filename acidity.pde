/*
 * Acidity by James Anthony Bruno (github.com/czycha)
 * Ported from Crystal (github.com/czycha/acidity)
 * MIT license
 */

import static java.lang.Math.toIntExact;

PImage input, output;
int RADIUS = 9;  // Larger numbers take longer, but produce more interesting results
String IMAGENAME = "hennepin";  // Name of image before extension
String IMAGEEXT = "png";  // Extension without period
boolean SAVEME = false;  // Whether to save image or not

void setup() {
  colorMode(RGB, 255, 255, 255);
  input = loadImage(IMAGENAME + "." + IMAGEEXT);
  size(1, 1);
  surface.setResizable(true);
  surface.setSize(input.width, input.height);
  input.loadPixels();
  output = createImage(input.width, input.height, RGB);
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
  noLoop();
}

void draw() {
  image(output, 0, 0);
  if(SAVEME) output.save(IMAGENAME + ".acid." + IMAGEEXT);
}