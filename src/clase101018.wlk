class Persona {
	var property celulasSanas
	var property cantidadcelulasAmenazadas
	var property temperatura
	method recibir (dosis) {
		enfermedades.forEach({e=> e.atenderse (dosis*15)})
		enfermedades.removeAllSochThat ({e=> e.estacurada()})
	}
	method cambiarTemperatura (cantidad) {
		temperatura = temperatura + cantidad
		temperatura = temperatura.max(45)
		
	}
	method cantidadcelulas () {
		return celulasSanas + cantidadcelulasAmenazadas
	}
	method estaencoma () {
		return temperatura == 45
	}
	method vivirUnDia () {
		enfermedades.forEach ({ënfermedad=> enfermedad.efecto (self)} // preguntar
	}

}

class EnfermedadInfecciosa {
	var celulasAfectadas
	method afectarCelulas (persona) {
		persona.cantidadcelulasAmenazadas (celulasAfectadas)
	}
	method reproducirCelulas (persona) {
		persona.cantidadcelulasAmenazadas (persona.cantidadcelulasAmenazadas()*2)
	}
	method efecto (persona) {
		persona.cambiarTemperatura (persona.temperatura()/1000 )
		}
	method esAgresivo (persona) {
		return celulasAfectadas > (persona.cantidadcelulas()*0.1)
	}
		
}

class EnfermedadAutoinmune {
	var cantidaddias
	method efecto (persona) {
		persona.cantidadcelulasAmenazadas (0)
		cantidaddias += 1
	}
	method esAgresivo (persona) {
		return cantidaddias > 30
	}
}



class Medico inherits Persona {
	var dosis
	method atenderA (paciente) {
		paciente.recibir(dosis)
	}
}
class Enfermedad {
	var celulasame
	method atenuarse (cuantas) {
		celulasame = 0.max (celulasame - cuantas)
	}
	method estacurada() {
		return celulasame == 0
	}
}
class infecciosa inherits Enfermedad {} // mara heredar una clase y agregar mas methodos y propiedades

)
class Jefe inherits Medico {
	var subordinados //una lista
	override method atenderA (paciente) {//redefinicion: la subclase pisa el metodo de la clase superior, por ende aplica primero este metodo (override)
 		subordinados.anyone({s=> s.atenderA})
	}
}