@testable import TripServiceKata

class TestableTripService: TripService {
    var loggedUser: User? = nil
    override func getLoggedUser() -> User? {
        return loggedUser
    }
}
