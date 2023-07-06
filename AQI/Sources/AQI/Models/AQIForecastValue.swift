import Foundation

struct AQIForecastValue: Decodable {
    let avg: Int
    let day: String
    let max: Int
    let min: Int
}
