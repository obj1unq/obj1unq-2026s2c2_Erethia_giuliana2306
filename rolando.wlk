object rolando {
    var mochila = []
    var capacidadDeMochila = 2
    var totalDeArtefactos = []
    var historia = []
    var poderBase = 0

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
}


object espadaDelDestino {
    var usosDeLaEspada = 0

    method poderQueAporta(personaje, bloque) {
    if (usosDeLaEspada == 0) {
        usosDeLaEspada = usosDeLaEspada + 1
        return bloque.apply(personaje)
    } else {
        usosDeLaEspada = usosDeLaEspada + 1
        return bloque.apply(personaje) / 2
    }
}
}
/*
Para aplicar : espadaDelDestino.poderQueAporta( self, { personaje => personaje.poderBase() }
)
*/

object libroDeHechizos {

}

object collarDivino {

}

object armaduraDeAceroValyrio {

}

object castillo {
    var artefactos = []

    method artefactos() {
        return artefactos 
    }
    method guardarArtefactos(_mochila) {
         _mochila.forEach({ artefacto => artefactos.add(artefacto)})
    }
}