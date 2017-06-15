void aggiornaInterfaccia()
{
  
  //Testo                                         W    H
  PGraphics finestraLogMacchina = createGraphics(500, 200);
  finestraLogMacchina.beginDraw();
    finestraLogMacchina.textSize(16);
    finestraLogMacchina.background(g.backgroundColor);
    finestraLogMacchina.text("Quantità da miscelare ml", 10, 15);
    finestraLogMacchina.text("Diluizione: 1:" + nf(diluizione, 0, 0), 10, 35);
    finestraLogMacchina.text(serbatoioError, 10, 55);
  finestraLogMacchina.endDraw();
  image(finestraLogMacchina, 290, 30);
  
  //Serbatoi:
  image(serbatoio1.drawVolume(), 30,  260);
  image(serbatoio2.drawVolume(), 150, 260);
}