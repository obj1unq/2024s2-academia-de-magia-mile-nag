import academia.*
class Mueble{
  const property cosasGuardadas = #{}

  method puedeGuardar(cosa) 
  method tiene(cosa) {
    return cosasGuardadas.any({c => c == cosa})
  }
  method agregarCosa(cosa) {
    cosasGuardadas.add(cosa)
  }
    
  method sumatoriaDeUtilidad() {
    return cosasGuardadas.sum({cosa => cosa.utilidad()})
  }

  method utilidad() {
    return self.sumatoriaDeUtilidad() / self.precio()
  }

  method precio()

  method cosaMenosUtil(){
    return cosasGuardadas.min({cosa => cosa.utilidad()}).marca()
  }
}

class Baul inherits Mueble {
  const volMax 

  method volumen() {
    return cosasGuardadas.sum({cosa => cosa.volumen()})
  }

  override method puedeGuardar(cosa) {
    return (self.volumen() + cosa.volumen()) <= volMax
  }

  override method precio() {
    return volMax + 2
  }

  method todasLasCosasSonReliquias() {
    return cosasGuardadas.all({cosa => cosa.esReliquia()})
  }

  override method utilidad() {
    return super() + self.extra()
  }

  method extra() {
    return if (self.todasLasCosasSonReliquias()) 2 else 0
  }
  
}

class Gabinete inherits Mueble {

  const property precio

  override method puedeGuardar(cosa) {
    return cosa.esMagico()
  }
  

}

class Armario inherits Mueble {
  var property cantMax

  override method puedeGuardar(cosa) {
    return cosasGuardadas.size() + 1 < cantMax 
  }

  override method precio() {
    return cantMax * 5
  }
}

class BaulMagico inherits Baul{
  override method utilidad(){
    return super() + self.cantDeElementosMagicos()
  }

  method cantDeElementosMagicos() {
    return cosasGuardadas.count({e => e.esMagico()})
  }

  override method precio() {
    return super() * 2
  }


}