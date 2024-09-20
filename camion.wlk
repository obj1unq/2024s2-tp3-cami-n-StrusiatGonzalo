import cosas.*

object camion {
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


}

