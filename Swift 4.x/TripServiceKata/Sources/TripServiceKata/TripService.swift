import Foundation

class TripService {
    func getTripsByUser(_ user:User) throws -> [Trip]? {
        guard let loggedUser = getLoggedUser() else {
            throw TripServiceErrorType.userNotLoggedIn
        }
        
        var tripList:[Trip]? = nil
        if user.isFriendWith(loggedUser) {
            tripList = findTrip(user)
        }
        return tripList
    }
    
    func getLoggedUser() -> User? {
        return try! UserSession.sharedInstance.getLoggedUser()
    }
    
    func findTrip(_ user: User) -> [Trip]? {
        return try! TripDAO.findTripsByUser(user)
    }
}
