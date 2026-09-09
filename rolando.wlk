object rolando {
    var mochila = []
    var capacidadDeMochila = 2
    var totalDeArtefactos = []

    method capacidadDeMochila(_capacidadDeMochila) {
        capacidadDeMochila = _capacidadDeMochila
    }
    method encuentraArtefacto(_artefacto) {
        if (mochila.size() < capacidadDeMochila) 
        mochila.add(_artefacto)
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

}

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