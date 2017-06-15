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
  
  private float m, q = 0;
  
  // Costruttore:
  Serbatoio(String _name, float _maxVolume, int _imageWidth, int _imageHeight, color _colore)
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
    pg.textFont(createFont("Helvetica-Bold", imageWidth/8)); //pg.textSize(imageWidth/8);
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
  
  /**
  *  Imposta il valore corrente del serbatoio in ml se tale valore è ammissibile.
  *  @param _volume: il volume da impostare.
  */
  void setVolume(float _volume)
  {
    float val = 0;
    if (_volume <= this.maxVolume && _volume > 0)
      val = _volume;
    else
    {
      val = this.currentVolume;
      println("questo valore non può essere impostato.");
    }
    
    this.currentVolume = val;
  }
  
  /**
  *  Svuota il serbatoio della quantità indicata nel parametro _volume se
  *  tale parametro non supera il volume residuo del serbatoio meno la tolleranza.
  *  @param _volume la quantità in ml da erogare.
  *  @return done ritorna vero se è possibile erogare la quantità richiesta,
  *               falso altrimenti.
  */
  boolean pour(float _volume)
  {
    boolean done = false;
    if (currentVolume-toll >= _volume)
    {
      currentVolume -= _volume;
      done = true;
    }
    else
    {
      println("not enough paste");
      done = false;
    }
    
    return done;
  }
  
  /**
  *  Riempie il serbatoio della quantità indicata nel parametro _volume.
  *  @param _volume: la quantità in ml per il refill.
  */
  float refill(float _volume)
  {
    if (currentVolume + _volume > maxVolume)
      currentVolume = maxVolume;
    else
      currentVolume += _volume;
      
    return currentVolume;
  }
  
  /**
  *  Ritorna il valore corrente di volume in ml.
  *  @return Il valore corrente di fluido nel serbatoio.
  */
  float getCurrentVolume()
  {
    return currentVolume;
  }
  
  /**
  *  Ritorna la percentuale di quantità di fluido residua nel serabatoio.
  *  @return Il valore corrente di fluido nel serbatoio in %.
  */
  float getPercentage()
  {
    return m*currentVolume + q;
  }
  
  /**
  *  Ritorna la tolleranza in ml impostata.
  *  @return La tolleranza in ml impostata.
  */
  float getToll_ml()
  {
    return toll;
  }
  
  /**
  *  Ritorna la tolleranza in % impostata.
  *  @return La tolleranza in % impostata.
  */
  float getToll_perc()
  {
    return toll/maxVolume * 100;
  }
  
  /**
  *  Imposta un valore in ml di tolleranza del serbatoio. Questo non sarà
  *  svuotato oltre questo valore.
  *  @param tolerance: la tolleranza in ml da settare, default: 10 ml.
  */
  void setToll_ml(float tolerance)
  {
    this.toll = tolerance;
  }
  
  /**
  *  Ritorna il nome impostato per il serbatoio.
  *  @return il nome impostato per il serbatoio.
  */
  String getName()
  {
    return this.name;
  }
}