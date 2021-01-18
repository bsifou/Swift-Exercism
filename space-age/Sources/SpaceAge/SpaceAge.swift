struct SpaceAge {
    let seconds: Double
    
    init(_ seconds: Double) {
        self.seconds = seconds
    }
    
    enum Planet: Double {
        case mercury = 0.2408467
        case venus = 0.61519726
        case mars = 1.8808158
        case jupiter = 11.862615
        case saturn = 29.447498
        case uranus = 84.016846
        case neptune = 164.79132
    }
    
    var onEarth: Double { seconds / 31557600 }
    var onMercury: Double { onEarth /  Planet.mercury.rawValue }
    var onVenus: Double { onEarth / Planet.venus.rawValue }
    var onMars: Double { onEarth / Planet.mars.rawValue }
    var onJupiter: Double { onEarth / Planet.jupiter.rawValue }
    var onSaturn: Double { onEarth / Planet.saturn.rawValue }
    var onUranus: Double { onEarth / Planet.uranus.rawValue }
    var onNeptune: Double { onEarth /  Planet.neptune.rawValue }
}

