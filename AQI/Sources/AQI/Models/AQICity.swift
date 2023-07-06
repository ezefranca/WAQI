import Foundation

struct AQICity: Decodable {
    let name: String
    let geo: [Double]
    let url: String
}
