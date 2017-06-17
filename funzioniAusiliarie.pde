/**
*  Rimuove la _stringa dal file avente nome pari a _nomeFile
*/
void removeLineFromFile(String _stringa, String _nomeFile)
{
  BufferedReader reader = createReader(dataPath("listaClienti.csv"));
  String         line = "";
  StringBuilder  stringBuilder = new StringBuilder();
  String         ls = System.getProperty("line.separator");

  try
  {
    // creo uno StringBuilder contenente la lista aggiornata
    while(line != null)
    {
      line = reader.readLine();
      if(line!=null && line.indexOf(_stringa) < 0)
      {
        stringBuilder.append(line);
        stringBuilder.append(ls);
      }
    }
    reader.close();
    
    //scrivo il nuovo file senza il cliente cercato.
    PrintWriter output = createWriter(dataPath("listaClienti.csv"));
    output.print(stringBuilder.toString());
    output.flush();
    output.close();
    
  }
  catch (IOException e)  {}
}

/** ORDINO IL FILE IN ORDINE ALFABETICO
*
*/
public void sortFile(String _filename, String _fileOutName)
{
  try
  {
    BufferedReader reader = createReader(dataPath(_filename));
    String inputLine;
    List<String> lineList = new ArrayList<String>();
    
    while ((inputLine = reader.readLine()) != null)
    {
      lineList.add(inputLine);
    }
    
    Collections.sort(lineList);
  
    PrintWriter out = createWriter(dataPath(_fileOutName));
    for (String outputLine : lineList)
    {
      out.println(outputLine);
    }
    out.flush();
    out.close();
  }
  catch (Exception e)  {}
}