import Foundation

public enum AQIServiceError: Error {
    case invalidURL
    case requestFailed
    case responseError(Error)
    case decodingError(Error)
}
