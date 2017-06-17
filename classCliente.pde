class Cliente
{
  // Attributi:
  String name;
  String surname;
  String cellphone;
  float  quantity;
  float  diluition;
  
  // Costruttore:
  /**
  *  Inizializza un cliente.
  *  @param _name      il nome del cliente.
  *  @param _surname   il cognome del cliente.
  *  @param _cellphone il numero di cellulare.
  *  @param _quantity  quantità impostata per il cliente.
  *  @param _diluition diluizione impostata per il cliente.
  */
  Cliente(String _name, String _surname, String _cellphone, float _quantity, float _diluition)
  {
    if(! _name.equals(""))      this.name      = _name;      else  {this.name      = "NESSUN_NOME";}
    if(! _surname.equals(""))   this.surname   = _surname;   else  {this.surname   = "NESSUN_COGNOME";}
    if(! _cellphone.equals("")) this.cellphone = _cellphone; else  {this.cellphone = "NESSUN_CELLULARE";}
    if(_quantity < 0)  this.quantity  = 0; else this.quantity  = _quantity;
    if(_diluition < 0) this.diluition = 1; else this.diluition = _diluition;
  }
  
  String toString()
  {
    return( surname + "," + name + "," + cellphone + "," + 
      str(quantity) + "," + str(diluition));
  }
}