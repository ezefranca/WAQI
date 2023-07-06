import Foundation

// MARK: - APIRouter Protocol

protocol APIRouter {
    var baseURL: URL { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}

extension APIRouter {
    var url: URL {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.path = path
        components.queryItems = queryItems
        return components.url ?? self.baseURL
    }
}
