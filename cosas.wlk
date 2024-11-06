import academia.*
import muebles.*

class Cosa {
  const property marca
  const property volumen
  const property esReliquia
  const property esMagico 

  method utilidad() {
    return volumen + self.valorDeMagia() + self.valorDeReliquia() + marca.valorQueAporta(self)
  }
  
  method valorDeMagia() {
    return if (esMagico) 3 else 0
  }

  method valorDeReliquia() {
    return if (esReliquia) 5 else 0
  }
}
