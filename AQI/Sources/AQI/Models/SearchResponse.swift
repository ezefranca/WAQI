import Foundation

// MARK: - SearchResponse
struct SearchResponse: Codable {
    let status: String
    let data: [AQIStation]
}

// MARK: - Datum
struct AQIStation: Codable {
    let lat, lon: Double
    let uid: Int
    let aqi: String
    let station: Station
}

// MARK: - Station
struct Station: Codable {
    let name: String
    let time: Date
}
