import Foundation

struct AQIForecast: Decodable {
    let daily: [AQIDailyForecast]
}
