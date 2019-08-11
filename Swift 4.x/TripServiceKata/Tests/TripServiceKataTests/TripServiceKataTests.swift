import XCTest
@testable import TripServiceKata

class TripServiceKataTests: XCTestCase {
    func test_throws_user_not_logged_in_if_user_is_a_guest() {
        let tripService = TestableTripService()
        let BOB = User()
        XCTAssertThrowsError(try tripService.getTripsByUser(BOB))
    }
}
