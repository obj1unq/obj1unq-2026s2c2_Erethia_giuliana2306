object rolando {
    var mochila = []
    var capacidadDeMochila = 2

    method capacidadDeMochila(_capacidadDeMochila) {
        capacidadDeMochila = _capacidadDeMochila
    }
    method encuentraArtefacto(_artefacto) {
        if (mochila.size() < capacidadDeMochila) 
        mochila.add(_artefacto)
    }
    method artefactosQueLleva() {
        return mochila 
    }
    method llegarAlCastillo() {
        castillo.guardarArtefactos(mochila)
        mochila.clear()
    }
}

/**/

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