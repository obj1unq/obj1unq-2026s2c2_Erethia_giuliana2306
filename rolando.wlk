object rolando {
    var mochila = #{}
    var capacidadDeMochila = 2
    var totalDeArtefactos = #{}
    var encuentros = []
    var poderBase = 5

    method capacidadDeMochila(_capacidadDeMochila) {
        capacidadDeMochila = _capacidadDeMochila
    }
    method encuentraArtefacto(_artefacto) {
        encuentros.add(_artefacto)
        if (mochila.size()  < capacidadDeMochila) {
            mochila.add(_artefacto)
        }
    }
    method artefactosDeLaMochila() {
        return mochila
    }
    method llegarAlCastillo() {
        castillo.guardarArtefactos()
        mochila.clear()
    }
    method artefactosEnTotal() {
        castillo.artefactos().forEach({artefacto => totalDeArtefactos.add(artefacto)})
        mochila.forEach({artefacto => totalDeArtefactos.add(artefacto)})
        return totalDeArtefactos
    }
    method posee(_artefacto) {
        totalDeArtefactos.any({artefacto => artefacto == _artefacto})
    }
    method historia() {
        return encuentros
    }
    method poderBase() {
        return poderBase
    }
    method modificarPoderBase(_poder) {
        poderBase = _poder
    }
    method poderDePelea() {
        return poderBase + mochila.sum({artefacto => artefacto.poderQueAporta(self)})
    }
    method pelearEnBatalla() {
        mochila.forEach({artefacto => artefacto.usosDeArtefacto()})
        poderBase = poderBase + 1
    }
}

object espadaDelDestino {
    var usos = 0

    method poderQueAporta(_personaje) { 
        if (usos == 0) {
            return _personaje.poderBase()
        } else {
            return _personaje.poderBase() / 2
        }
    }
    method usosDeArtefacto() {
        usos = usos + 1
    }
}

object libroDeHechizos {
    var hechizos = []

    method agregarHechizo(_hechizo) {
        hechizos.add(_hechizo)
    }
    method poderQueAporta(_personaje) {
        if (hechizos != []) {
            return hechizos.first().poderQueAporta(_personaje))
        } else {
          return 0
        } 
    }
    method usosDeArtefacto() {
        if (hechizos != []) {
            hechizos.remove(hechizos.first()) 
        }
    }
}

object bendicion {

    method poderQueAporta(_personaje) {
        return 4
    }
    method usosDeArtefacto() {
    }
}

object invisibilidad {

    method poderQueAporta(_personaje) {
        return _personaje.poderBase()
    }
    method usosDeArtefacto() {
    }
}
object invocacion {

    method poderQueAporta(_personaje) {
        if (castillo.artefactos() != []) {
            return castillo.artefactos().max({artefacto => artefacto.poderQueAporta(_personaje)}).poderQueAporta(_personaje)
        } else {
            return 0
        }
    method usosDeArtefacto() {

    }
}
}
object collarDivino {
    var usos = 0
    
    method poderQueAporta(_personaje) {
        if (_personaje.poderBase() > 6) {
            return 3 + usos 
        } else {
            return 3
        }
    }
     method usosDeArtefacto() {
        usos = usos + 1
    }
}

object armaduraDeAceroValyrio {

    method poderQueAporta(_personaje) {
        return 6
    }
    method usosDeArtefacto() {
    }
}

object castillo {
    var artefactos = #{}

    method guardarArtefactos() {
        rolando.artefactosDeLaMochila().forEach({artefacto => artefactos.add(artefacto)})
    }
    method artefactos() {
        return artefactos
    }
}

object caterina {

    method poderDePelea() {
        return 28
    } 
    method morada() {
        return "fortaleza de acero"
    }
}

object archibaldo {

    method poderDePelea() {
        return 16 
    } 
    method morada() {
        return "palacio de marmol"
    }
}

object astra {

    method poderDePelea() {
        return 13 
    } 
    method morada() {
        return "torre de marfil"
    }
}


