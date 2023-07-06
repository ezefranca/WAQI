import Foundation

// MARK: - AQIData

struct AQIData: Decodable {
    let idx: Int
    let aqi: Int
    let time: AQITime
    let city: AQICity
    let iaqi: AQIIAQ
    let forecast: AQIForecast
}
