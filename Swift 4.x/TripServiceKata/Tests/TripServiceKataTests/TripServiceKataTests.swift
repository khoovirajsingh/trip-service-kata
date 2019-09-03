import XCTest
@testable import TripServiceKata

class TripServiceKataTests: XCTestCase {
    
    var tripService: TestableTripService!
    var user: User!
    
    override func setUp() {
        tripService = TestableTripService()
        user = User()
    }
    
    func test_throws_user_not_logged_in_if_user_is_a_guest() {
        XCTAssertThrowsError(try tripService.getTripsByUser(user))
    }
    
    func test_no_trips_are_returned_if_logged_in_user_is_not_friend() throws {
        tripService.loggedUser = user
        let aStranger = User()
        
        let trips = try tripService.getTripsByUser(aStranger)
        
        XCTAssertNil(trips)
    }
    
    func test_a_list_of_trips_is_returned_if_logged_in_user_is_a_friend() throws {
        tripService.loggedUser = user
        
        let aFriend = User()
        aFriend.addTrip(Trip())
        
        aFriend.addFriend(user)
        
        let trips = try tripService.getTripsByUser(aFriend)

        XCTAssertNotNil(trips)
        
    }
}
