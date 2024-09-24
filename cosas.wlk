object knightRider {
	method peso() {
		 return 500
	 }

	method nivelPeligrosidad() { 
		return 10
	 }

	method bulto() {
	  return 1
	}

	method cambiar() {
	  
	}
}

object bumblebee {
  var property estadoDeBumblebee = bumblebeeAuto

	method peso() {
	  return 800
	}

	method nivelPeligrosidad() {
	 return estadoDeBumblebee.nivelPeligrosidad()
	}

	method bulto() {
	  return 2
	}

	method cambiar() {
	  estadoDeBumblebee = bumblebeeRobot
	}
}

object bumblebeeRobot {
  
  method nivelPeligrosidad() {
	return 30
  }
}

object bumblebeeAuto {
  
	method nivelPeligrosidad() {
	  return 15
	}
}

object paqueteDeLadrillos {
	var property ladrillos = 301

	method nivelPeligrosidad() {
	return 2
  }

  method peso() {
	return ladrillos * 2 
  }

  method bulto() {
	  if (ladrillos < 100) {
		return 1
	  } else { 
		if (ladrillos < 300){
			return 2
		}else{
			return 3
		}}
	  }

	method cambiar() {
	  ladrillos += 12
	}
}

object arenaAGranel {
  var property peso = 0
  

 	method nivelPeligrosidad() {
	return 1
 	}

  	method bulto() {
	  return 1
	}

	method cambiar() {
	  peso += 20 
	}

}

object bateriaAntiaerea {
	var property estadoDeBateria = bateriaConMisiles

	method peso() {
	  return estadoDeBateria.peso()
	}

	method nivelPeligrosidad() {
	  return estadoDeBateria.nivelPeligrosidad()
	}

	method cambiar() {
	  estadoDeBateria = bateriaConMisiles

	}
}

object bateriaConMisiles {
  
  method peso() {
	return 300
  }

   method nivelPeligrosidad() {
	return 100
  }
}

object bateriaSinMisiles {
	
	method peso() {
		return 200
  }

   method nivelPeligrosidad() {
	return 0
  }
}

object contenedorPortuario {
  const property cosas = [] 
  const peso = 100

  method peso() {
	return peso + self.sumaTotalDe()
  }

  method sumaTotalDe() {
	return cosas.sum({cosa => cosa.peso()})
  }

  method nivelPeligrosidad() {
	return self.nivelesDeTodasLasCosas().maxIfEmpty() // si no hay maximo me da cero
  }

  method nivelesDeTodasLasCosas() {
	return cosas.map({cosa => cosa.nivelPeligrosidad()})
  }

  method cambiar() {
	cosas.forEach({cosa => cosa.cambiar()})// foreach solo para ejecutar acciones!!
  }
}

object residuosRadioactivos {
  var property peso = 0

    method nivelPeligrosidad() {
	return 200
  }

  	method bulto() {
	  return 1
	}

	method cambiar() {
	  peso += 15
	}
}

object embalajeDeSeguridad {
  var property cosa = bumblebee

 	method peso() {
	return cosa.peso()
  	}

 	method nivelPeligrosidad() {
	return cosa.nivelPeligrosidad() / 2
  	}

 	method bulto() {
	  return 2
	}

	method cambiar() {
	  
	}
}



