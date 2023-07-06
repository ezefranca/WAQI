import Foundation

// MARK: - AQIResponse

struct AQIResponse: Decodable {
    let status: String
    let data: AQIData
}
