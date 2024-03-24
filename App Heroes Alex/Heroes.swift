//
//  Heroes.swift
//  App Heroes Alex
//
//  Created by Alex  on 12/3/24.
//

import Foundation

struct HeroDTO : Codable {
    let id: String
    let nombreReal: String
    let apodo: String
    let descripcion: String?
    let edad: Int
    let poderes: [Poderes]
    let imagen: String
    var historia: String?
    
    var toHero: Hero {
        Hero(
            id: id,
            nombreReal: nombreReal,
            apodo: apodo,
            descripcion: descripcion,
            edad: edad,
            poderes: poderes,
            imagen: imagen,
            historia: historia,
            favorited: false
        )
    }
}

struct Hero: Codable {
    let id: String
    let nombreReal: String
    let apodo: String
    let descripcion: String?
    let edad: Int
    let poderes: [Poderes]
    let imagen: String
    var historia: String?
    var favorited: Bool
}

enum Poderes: String, Codable {
    case comunicacionMarina = "Comunicación con vida marina"
    case invulnerabilidad = "Invulnerabilidad"
    case manipulacionSombras = "Manipulación de sombras"
    case manipulacionAgua = "Manipulación del agua"
    case manipulacionClima = "Manipulación del Clima"
    case manipulacionFuego = "Manipulación del fuego"
    case manipulacionMental = "Manipulación Mental"
    case pielMetalica = "Piel Metálica"
    case regeneracion = "Regeneración"
    case superFuerza = "Super Fuerza"
    case telepatia = "Telepatía"
    case teletransportacionATravesDeSombras = "Teletransportación a través de sombras"
    case transformacionEnFormaAcuática = "Transformación en forma acuática"
    case vuelo = "Vuelo"
    case amplificacionSonido = "Amplificación del Sonido"
    case controlElemental = "Control Elemental"
    case controlVibraciones = "Control de Vibraciones"
    case creacionRocas = "Creación de Rocas"
    case creacionTornados = "Creación de Tornados"
    case duplicacion = "Duplicación"
    case emisionLuz = "Emisión de Luz"
    case generacionVibraciones = "Generación de Vibraciones"
    case giroRapido = "Giro Rápido"
    case imitacionSonido = "Imitación de Sonido"
    case intangibilidad = "Intangibilidad"
    case invisibilidad = "Invisibilidad"
    case manipulacionLuz = "Manipulación de la Luz"
    case manipulacionTiempo = "Manipulación del Tiempo"
    case manipulacionTierra = "Manipulación de la Tierra"
    case teleTransportacion = "Teletransportación"
    case visionRayosX = "Visión de Rayos X"
}
