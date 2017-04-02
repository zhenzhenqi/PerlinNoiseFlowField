class FlowField {

  PVector[][] field;
  int cols, rows;
  int resolution;

  FlowField(int r) {
    resolution = r;

    cols = width/resolution;
    rows = height/resolution;
    field = new PVector[cols][rows];
  }

  void display() {
    //    float zoff = 0;
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        float theta = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
        field[i][j] = new PVector(cos(theta), sin(theta));
        yoff += 0.1;
        pushMatrix();
        translate(j, i);
        //line(0, 0, resolution, 0);
        rotate(theta);
        popMatrix();
      }
      xoff += 0.1;
    }
    //    zoff += 0.01;
  }

  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution, 0, cols-1));
    int row = int(constrain(lookup.y/resolution, 0, rows-1));
    return field[column][row].get();
  }
}

