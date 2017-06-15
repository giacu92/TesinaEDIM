void aggiornaInterfaccia()
{
  
  //Testo                                         W    H
  PGraphics finestraLogMacchina = createGraphics(300, 200);
  finestraLogMacchina.beginDraw();
    finestraLogMacchina.textSize(16);
    finestraLogMacchina.background(g.backgroundColor);
    finestraLogMacchina.text("Ciao", 10, 20);
  finestraLogMacchina.endDraw();
  image(finestraLogMacchina, 300, 30);
  
  //Serbatoi:
  image(serbatoio1.drawVolume(), 30,  210);
  image(serbatoio2.drawVolume(), 150, 210);
}