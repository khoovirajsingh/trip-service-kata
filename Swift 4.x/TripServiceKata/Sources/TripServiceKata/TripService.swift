import Foundation

class TripService {
    func getTripsByUser(_ user:User) throws -> [Trip]? {
        guard let loggedUser = getLoggedUser() else {
            throw TripServiceErrorType.userNotLoggedIn
        }
        
        if user.isFriendWith(loggedUser) {
            return findTrip(user)
        }
        return noTrips()
    }
    
    func getLoggedUser() -> User? {
        return try! UserSession.sharedInstance.getLoggedUser()
    }
    
    func findTrip(_ user: User) -> [Trip]? {
        return try! TripDAO.findTripsByUser(user)
    }
    
    private func noTrips() -> [Trip]? {
        return nil
    }
}
