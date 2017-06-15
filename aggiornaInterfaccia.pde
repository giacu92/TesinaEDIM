void aggiornaInterfaccia()
{
  
  //Testo                                         W    H
  PGraphics finestraLogMacchina = createGraphics(500, 200);
  finestraLogMacchina.beginDraw();
    finestraLogMacchina.textSize(14);
    finestraLogMacchina.background(g.backgroundColor);
    finestraLogMacchina.text("Quantità da miscelare ml", 10, 10);
    finestraLogMacchina.text("Diluizione: 1:" + nf(diluizione, 0, 0), 10, 30);
    finestraLogMacchina.text(serbatoioError, 10, 50);
  finestraLogMacchina.endDraw();
  image(finestraLogMacchina, 150, 30);
  
  //Serbatoi:
  image(serbatoio1.drawVolume(), 30,  210);
  image(serbatoio2.drawVolume(), 150, 210);
}