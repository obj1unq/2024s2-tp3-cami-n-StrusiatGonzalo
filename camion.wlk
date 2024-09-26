import cosas.*

class Camion {
	const property cosas = #{}
	const pesoDeLaTara = 1000
	const pesoMaximo = 2500

		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.cambiar()

	}

	method descargar(cosa) {
	  cosas.remove(cosa)
	}


	method todoPesoPar() {
	 return  cosas.all({cosa => cosa.peso().even()})
	}

	method hayAlgunoQuePesa(peso) {
	  return cosas.any({cosa => cosa.peso() == peso})
	}

	method elDeNivel(nivel) {
	  return  cosas.first({cosa => cosa.nivelPeligrosidad() == nivel})
	}

	method pesoTotal() {
	 return  cosas.sum({cosa => cosa.peso()}) + pesoDeLaTara
	}

	method excedidoDePeso() {
	  return self.pesoTotal() > pesoMaximo
	}

	method objetosQueSuperanPeligrosidad(nivel) {
	  return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel })
	}


	method objetosMasPeligrososQue(cosa2) {
	  return cosas.filter({cosa => cosa.nivelPeligrosidad() > cosa2.nivelPeligrosidad()})
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
	  return not self.excedidoDePeso() and self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	}

	method tieneAlgoQuePesaEntre(min, max) {
	  return cosas.any({ cosa => (cosa.peso() > min) and (cosa.peso() < max)})
	}

	method cosaMasPesada() {
	  return cosas.maxIfEmpty({cosa => cosa.peso()}, {})
	}

	method pesos() {
	  return cosas.map({cosa => cosa.peso()})
	}

	method totalBultos() {
	  return cosas.sum({cosa => cosa.bulto()})
	}

	method depositarEnDestino(destino) {
	  cosas.forEach({cosa => destino.agregar(cosa)}) // como tengo que ejecutar en cada una de las cosas uso un foreach y no un map(que me trae una lista con las cosas que cumplan la condi)
	  self.vaciarCamion()

	}

	method vaciarCamion() { 
	  cosas.clear() // clear vacia la lista dada 
	}

	method trasportar(camino,destino) {
	  self.validarPeso()
	  destino.validarCantidadDeBulto()
	  camino.validarCamino()
	  self.depositarEnDestino(destino)
	}

	method validarPeso() {
	  if (self.excedidoDePeso()){
		self.error("el camion esta excedido de peso")
	  }
	}

	method cantidadDeCosas() {
	  return cosas.size()
	}
}

const camion = new Camion(cosas = #{bumblebee},pesoDeLaTara = 850,pesoMaximo = 25)



object almacen {
  const property cosasDelAlmacen = []
  var property capacidadMaxima = 3

  method agregar(cosa) {
	cosasDelAlmacen.add(cosa)
  }

  method lugaresDisponibles() {
	return  capacidadMaxima - cosasDelAlmacen.size()
  }

  method validarCantidadDeBulto() {
	  if ( self.lugaresDisponibles() < camion.cantidadDeCosas()){
		self.error("no hay lugares disponibles para guardar el bulto")
	  }
  }
}


object ruta9 {
  
  method nivelPeligrosidad() {
	return 11
  }

  method noPuedeCircular(vehiculo) {
	return not vehiculo.puedeCircularEnRuta(self.nivelPeligrosidad())
  }

  method validarCamino() {
	  if (not self.noPuedeCircular(camion)){
		self.error("no puede circular en el destino dado")
	  }
  }
}

object caminosVecinales {
  var property pesoMaximo = 0 

    method noPuedeCircular(vehiculo) {
	return pesoMaximo < vehiculo.pesoTotal() 
    }

  method validarCamino() {
	  if (not self.noPuedeCircular(camion)){
		self.error("no puede circular en el destino dado")
	  }
  }
}



 
