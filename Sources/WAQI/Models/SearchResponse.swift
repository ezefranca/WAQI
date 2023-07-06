import Foundation

// MARK: - SearchResponse
public struct SearchResponse: Codable {
    let status: String
    let data: [AQIStation]
}

// MARK: - Datum
public struct AQIStation: Codable {
    let lat, lon: Double
    let uid: Int
    let aqi: String
    let station: Station
}

// MARK: - Station
public struct Station: Codable {
    let name: String
    let time: Date
}
