import XCTest
@testable import TripServiceKata

class TripServiceKataTests: XCTestCase {
    
    var tripService: TripService!
    var FRED: User!
    
    override func setUp() {
        tripService = TestableTripService()
        FRED = User()
    }
    
    func test_throws_user_not_logged_in_if_user_is_a_guest() {
        let tripService = TestableTripService()
        XCTAssertThrowsError(try tripService.getTripsByUser(FRED))
    }
}
