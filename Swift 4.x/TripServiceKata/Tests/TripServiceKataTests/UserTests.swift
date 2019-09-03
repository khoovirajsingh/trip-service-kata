import XCTest
@testable import TripServiceKata

class UserTests: XCTestCase {
    let BOB = User()
    let TOM = User()
    
    func test_false_is_returned_if_user_does_not_contain_friend() {
        let user = User()
        user.addFriend(BOB)
        XCTAssertFalse(user.isFriendWith(TOM))
    }
}
