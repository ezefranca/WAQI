import Foundation

@available(iOS 15.0, *)
@available(macOS 12.0, *)
public class AQIService: AQIServiceProtocol {

    private let baseURL = URL(string: "https://api.waqi.info/v2")!
    private let token: String

    public init(token: String) {
        self.token = token
    }

    public func getAQI(for city: String) async throws -> AQIResponse {
        let router = AQIRouter.city(city, token)
        return try await fetchData(from: router.url)
    }

    public func getGeolocalizedAQI(lat: Double, lng: Double) async throws -> AQIResponse {
        let router = AQIRouter.geolocalized(lat, lng, token)
        return try await fetchData(from: router.url)
    }

    public func getGeolocalizedAQIUsingIP() async throws -> AQIResponse {
        let router = AQIRouter.geolocalizedIP(token)
        return try await fetchData(from: router.url)
    }

    public func getStationsInBounds(lat1: Double, lng1: Double, lat2: Double, lng2: Double) async throws -> AQIResponse {
        let router = AQIRouter.mapBounds(lat1, lng1, lat2, lng2, token)
        return try await fetchData(from: router.url)
    }

    public func searchStations(by keyword: String) async throws -> [AQIStation] {
        let router = AQIRouter.search(keyword, token)
        let response: SearchResponse = try await fetchData(from: router.url)
        return response.data
    }

    private func fetchData<T: Decodable>(from url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            throw AQIServiceError.decodingError(error)
        }
    }
}

enum AQIRouter: APIRouter {
    case city(String, String)
    case geolocalized(Double, Double, String)
    case geolocalizedIP(String)
    case mapBounds(Double, Double, Double, Double, String)
    case search(String, String)

    var baseURL: URL {
        return URL(string: "https://api.waqi.info/")!
    }

    var path: String {
        switch self {
        case .city(let city, _):
            return "feed/\(city)/"

        case .geolocalized(let lat, let lng, _):
            return "feed/geo:\(lat);\(lng)/"

        case .geolocalizedIP(_):
            return "feed/here/"

        case .mapBounds(_, _, _, _, _):
            return "map/bounds"

        case .search(_, _):
            return "search/"
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .city(_, let token),
                .geolocalized(_, _, let token),
                .geolocalizedIP(let token),
                .mapBounds(_, _, _, _, let token),
                .search(_, let token):
            return [URLQueryItem(name: "token", value: token)]
        }
    }
}
