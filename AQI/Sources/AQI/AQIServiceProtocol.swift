import Foundation

// MARK: - AQIServiceProtocol

protocol AQIServiceProtocol {
    func getAQI(for city: String) async throws -> AQIResponse
    func getGeolocalizedAQI(lat: Double, lng: Double) async throws -> AQIResponse
    func getGeolocalizedAQIUsingIP() async throws -> AQIResponse
    func getStationsInBounds(lat1: Double, lng1: Double, lat2: Double, lng2: Double) async throws -> AQIResponse
    func searchStations(by keyword: String) async throws -> [AQIStation]
}
