class Serbatoio
{
  // Attributi:
  float maxVolume;
  float currentVolume;
  int   imageWidth;
  int   imageHeight;
  color colore;
  PGraphics pg;
  float toll = 10; //tolleranza serbatoio in ml, non lo svuoto mai oltre questo val 
  String name = "";
  
  float m, q = 0;
  
  // Costruttore:
  Serbatoio(String _name, int _maxVolume, int _imageWidth, int _imageHeight, color _colore)
  {
    this.name           = _name;
    this.maxVolume      = _maxVolume;
    this.currentVolume  = maxVolume;
    this.imageWidth     = _imageWidth;
    this.imageHeight    = _imageHeight;
    this.colore         = _colore;
    
    this.m = 100/(maxVolume-toll);
    this.q = -(100*toll)/(maxVolume-toll);
    
    //creo il grafico 
    pg = createGraphics(imageWidth, imageHeight);
  }
  
  // Metodi:
  PImage drawVolume()
  {
    //riempio il grafico
    pg.beginDraw();
    pg.background(g.backgroundColor);
    
    //creo le linee che disegnano il serbatoio
    pg.stroke(255);
    pg.strokeWeight(2);
    pg.line(20, 20, 20, imageHeight-20);
    pg.line(imageWidth-20, 20, imageWidth-20, imageHeight-20);
    pg.line(20, imageHeight-20, imageWidth-20, imageHeight-20);
    
    //aggiungo il testo contenente il volume ed il nome
    float percentage = m*currentVolume + q;
    String stringa = nf(percentage, 1, 2);
    stringa += " %";
    pg.textSize(imageWidth/8);
    pg.text(stringa, imageWidth/2, 30);
    pg.text(name, imageWidth/2, imageHeight);
    pg.textAlign(CENTER);
    
    //aggiungo il rettangolo che indica il volume
    pg.colorMode(RGB, 255);
    pg.fill(colore);
    pg.rect(20, imageHeight-20, imageWidth-40, -(imageHeight-60)*percentage/100);
    
    pg.endDraw();
    
    return pg;
  }
  
  float pour(float _volume)
  {
    if (currentVolume-toll >= _volume)
      currentVolume -= _volume;
    else
      println("not enough paste");
      
    return currentVolume;
  }
  
  float refill(float _volume)
  {
    if (currentVolume + _volume > maxVolume)
      currentVolume = maxVolume;
    else
      currentVolume += _volume;
      
    return currentVolume;
  }
  
  float getCurrentVolume()
  {
    return currentVolume;
  }
  
  float getPercentage()
  {
    return m*currentVolume + q;
  }
}