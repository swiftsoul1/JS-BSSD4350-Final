//import controlP5.*;

int planeBounds = 2;
//ControlP5 cp5;
int iterations = 10;
//Slider slider;
//DropdownList d1;
String rule = "Normal";
PShader shader;

void setup() {
  size(400, 400, P2D);
  //noLoop();
  shader = loadShader("basic.gsgl");
  shader.set("u_resolution", float(width), float(height));
}

void draw() {
  
  shader.set("u_time", millis() / 500);
  
  background(120);
  pixelDensity(1);
  loadPixels();
  
  switch(rule){
    case "Normal":
      Normal();
      break;
    case "Ship":
      BurningShip();
      break;
    case "Celtic":
      Celtic();
      break;
  }
  updatePixels();
  
  shader(shader);
  rect(0,0, width,height);
}


void keyPressed(){
  switch(key){
      case '1':
        rule = "Normal";
        break;
      case '2':
        rule = "Ship";
        break;
      case '3':
        rule = "Celtic";
        break;
      case '4':
        planeBounds += 1;
        break;
      case '5':
        planeBounds -= 1;
        break;
      case '6':
        iterations += 10;
        break;
      case '7':
        iterations -= 10;
        break;
     
    }
}
void Celtic(){
  for (int y = 0; y < height; y++) {
    for(int x = 0; x< width; x++){
      
      float xfrac = map(x, 0, width, -planeBounds, planeBounds);
      float yfrac = map(y, 0, height, -planeBounds, planeBounds);
      
      int inf = 25;
      int maxIter = iterations;
      int n = 0;
      float a = xfrac;
      float b = yfrac;
      for(n = 0; n < maxIter; n++){
        float aa = abs(sq(a) - sq(b));
        float bb = 2 * a * b;
        a = aa + xfrac;
        b = bb + yfrac;
        if(abs(a + b) > inf){
          pixels[x+y*width] = color(255, n*inf, 204);
          break;
        }
      }
      if(n == maxIter) {
          pixels[x+y*width] = color(0, 102, 204);
      }
    }
  }
}
void Normal(){
  for (int y = 0; y < height; y++) {
    for(int x = 0; x< width; x++){
      
      float xfrac = map(x, 0, width, -planeBounds, planeBounds);
      float yfrac = map(y, 0, height, -planeBounds, planeBounds);
      
      int inf = 25;
      int maxIter = iterations;
      int n = 0;
      float a = xfrac;
      float b = yfrac;
      for(n = 0; n < maxIter; n++){
        float aa = sq(a) - sq(b);
        float bb = 2 * a * b;
        a = aa + xfrac;
        b = bb + yfrac;
        if(abs(a + b) > inf){
          pixels[x+y*width] = color(255, n*inf, 204);
          break;
        }
      }
      if(n == maxIter) {
          pixels[x+y*width] = color(0, 102, 204);
      }
    }
  }
}

void BurningShip(){
  for (int y = 0; y < height; y++) {
    for(int x = 0; x< width; x++){
      
      float xfrac = map(x, 0, width, -planeBounds, planeBounds);
      float yfrac = map(y, 0, height, -planeBounds, planeBounds);
      
      int inf = 25;
      int maxIter = iterations;
      int n = 0;
      float a = xfrac;
      float b = yfrac;
      for(n = 0; n < maxIter; n++){
        float aa = sq(a) - sq(b);
        float bb = 2 * abs(a * b);
        a = aa + xfrac;
        b = bb + yfrac;
        if(abs(a + b) > inf){
          pixels[x+y*width] = color(255, n*inf, 204);
          break;
        }
      }
      if(n == maxIter) {
          pixels[x+y*width] = color(0, 102, 204);
      }
    }
  }
}
