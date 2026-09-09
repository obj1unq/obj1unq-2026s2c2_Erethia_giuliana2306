object rolando {
    var mochila = #{}
    var capacidadDeMochila = 2
    var totalDeArtefactos = []
    var historia = []
    var poderBase = 5

    method capacidadDeMochila(_capacidadDeMochila) {
        capacidadDeMochila = _capacidadDeMochila
    }
    method encuentraArtefacto(_artefacto) {
         historia.add(_artefacto)
        if (mochila.size() < capacidadDeMochila) {
            mochila.add(_artefacto)
        }
    }
    method poderBase() {
        return poderBase
    }
    method historia() {
        return historia
    }
    method artefactosEnLaMochila() {
        return mochila 
    }
    method llegarAlCastillo() {
        castillo.guardarArtefactos(mochila)
        mochila.clear()
    }
    method agregarArtefactos(_artefactos) {
        _artefactos.forEach({artefacto => totalDeArtefactos.add(artefacto)})
    }
    method artefactosQueLleva() {
        totalDeArtefactos.clear()
        self.agregarArtefactos(self.artefactosEnLaMochila())
        self.agregarArtefactos(castillo.artefactos())
        return totalDeArtefactos
    }
    method tieneArtefacto(_artefacto) {
        self.artefactosQueLleva()
        return totalDeArtefactos.any({artefacto => artefacto == _artefacto})
    }
    method poderDePelea() {
        return self.poderBase() + mochila.sum({artefacto => artefacto.poderQueAporta(self)})
    }
    method cambiarPoderBase(_poderBase) {
        poderBase = _poderBase
    }
    method pelearEnBatalla ()  {
        poderBase = poderBase + 1
        
    }
}


object espadaDelDestino {
    var usosDeLaEspada = 0

    method poderQueAporta(personaje) {
    if (usosDeLaEspada == 0) {
        usosDeLaEspada = usosDeLaEspada + 1
        return personaje.poderBase()
    } else {
        usosDeLaEspada = usosDeLaEspada + 1
        return personaje.poderBase() / 2
    }
}
}


object libroDeHechizos {
    var hechizos = []

    method agregarHechizo(hechizo) {
        hechizos.add(hechizo)
    }
    method hechizos() {
        return hechizos
    }

}

object bendicion {

    method poderQueAPorta(personaje) {
        return 4
    }
}

object inivisibilidad {

    method poderQueAporta(personaje) {
        return personaje.poderBase()
    }
}

object invocacion {

    method poderQueAporta(personaje) {
        (castillo.artefactos().map{artefacto => artefacto.poderQueAPorta(personaje)}).max()
    }
}

object collarDivino {
    var usoDelCollar = 0

    method poderQueAporta(personaje) {
        if (personaje.poderBase() > 6) {
            usoDelCollar = usoDelCollar + 1
            return 3 * usoDelCollar -1
        } else {
            usoDelCollar = usoDelCollar + 1
            return 3
        }

    }
}

object armaduraDeAceroValyrio {

    method poderQueAporta(personaje) {
        return 6
    }
}

object castillo {
    var artefactos = #{}

    method artefactos() {
        return artefactos 
    }
    method guardarArtefactos(_mochila) {
         _mochila.forEach({ artefacto => artefactos.add(artefacto)})
    }
}