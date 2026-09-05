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
}




object espadaDelDestino {

}

object libroDeHechizos {

}

object collarDivino {

}

object armaduraDeAceroValyrio {

}