import java.awt.MouseInfo;
import java.awt.Component;
import java.awt.*;

void draw() {
  background(0);
  stroke(255);
  drawStars();
  drawPlanets();
  drawShuttle();
  //println(MouseInfo.getPointerInfo().getLocation(), mouseY);
}
