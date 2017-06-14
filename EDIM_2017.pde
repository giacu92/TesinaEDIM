// G4P
import g4p_controls.*;
import java.awt.Font;

int WinSize_X = 800;
int WinSize_Y = 480;

Serbatoio serbatoio1, serbatoio2;
color c1 = color(100, 255, 255);
color c2 = color(255, 20, 50);

void setup()
{
  size(800, 480);
  frameRate(30);
  
  // Creo GUI
  createGUI();
  
  serbatoio1 = new Serbatoio("Nutella", 50, 100, 120, c1); // volume, Width, Height, colore
  serbatoio2 = new Serbatoio("Panna", 200, 120, 160, c2);
}

void draw()
{
  // Display
  background(0); // Metto lo sfondo nero
 
  image(serbatoio1.drawVolume(), 30, 150);
  image(serbatoio2.drawVolume(), 150, 150);
  if (serbatoio1.getPercentage() < 1)
    while (serbatoio1.getCurrentVolume() < 99)
    {
      serbatoio1.refill(3);
      image(serbatoio1.drawVolume(), 100, 200);
    }
  if (serbatoio2.getPercentage() < 1)
    while (serbatoio2.getCurrentVolume() < 199)
    {
      serbatoio2.refill(7);
      image(serbatoio2.drawVolume(), 100, 200);
    }
}