@testable import TripServiceKata

class TestableTripService: TripService {
    override func getLoggedUser() -> User? {
        return nil
    }
}
