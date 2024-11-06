import muebles.*

class Academia {
  const property muebles = #{} 

  method guardar(cosa) {
    self.verificarSiSePuedeGuardar(cosa)
    self.guardarEnMuebleDisponible(cosa)
  }

  method verificarSiSePuedeGuardar(cosa) {
    if (!self.sePuedeGuardar(cosa)){
      self.error("No se puede guardar.")
    }
  }

  method guardarEnMuebleDisponible(cosa){
    self.enQueMuebleSePuedeGuardar(cosa).anyOne().agregarCosa(cosa)
  }

  method estaGuardada(cosa){
    return muebles.any({mueble => mueble.tiene(cosa)})
  }

  method sePuedeGuardar(cosa) {
    return !self.estaGuardada(cosa) and self.hayUnMuebleDisponible(cosa)
  }

  method hayUnMuebleDisponible(cosa) {
    return muebles.any({mueble => mueble.puedeGuardar(cosa)})
  }

  method enQueMuebleSePuedeGuardar(cosa) {
    return muebles.filter({mueble => mueble.puedeGuardar(cosa)})
  }

  method cosasMenosUtiles() {
    return muebles.map({mueble => mueble.cosaMenosUtil()}).asSet()
  }




}



