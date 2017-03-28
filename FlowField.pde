class FlowField {
  float[] noiseField;
  int cols, rows;
  int scl; 
  
  float inc = 0.1;
  float zoff = 0;

  FlowField() {
    scl = 10;
    cols = floor(width/scl);
    rows = floor(height/scl);
    noiseField = new float[rows*cols]; 
  }
  
  void display(){ 
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        float theta = map(noise(xoff, yoff, zoff), 0, 1, 0, TWO_PI);
        noiseField[i*cols+j] = theta;
        stroke(0);
        pushMatrix();
        translate(i*scl, j*scl);
        rotate(theta);
        line(0, 0, scl, 0);
        popMatrix();
        yoff += inc;
      }
      xoff += inc;
    }
    zoff += inc*0.1;
  }
  
}