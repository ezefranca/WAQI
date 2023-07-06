import Foundation

public struct AQIForecast: Decodable {
    let daily: [AQIDailyForecast]
}
