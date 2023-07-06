import Foundation

// MARK: - AQIResponse

public struct AQIResponse: Decodable {
    let status: String
    let data: AQIData
}
