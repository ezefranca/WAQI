import XCTest
@testable import AQI

final class AQITests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        aaa()
    }

    func aaa() {
        let service = AQIService(token: "0e2984c8898adeef2066dc70f2e828108b32063e")

        Task {
            let x = try await service.getGeolocalizedAQI(lat:38.88731, lng: -9.2242199999999)
            print(x)
        }
    }
}
