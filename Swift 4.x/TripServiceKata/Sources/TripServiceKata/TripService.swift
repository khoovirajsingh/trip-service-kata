import Foundation

class TripService {
    func getTripsByUser(_ user:User) throws -> [Trip]? {
        guard let loggedUser = getLoggedUser() else {
            throw TripServiceErrorType.userNotLoggedIn
        }
        
        var isFriend = false
        for friend in user.getFriends() {
            if friend == loggedUser {
                isFriend = true
                break
            }
        }
        
        var tripList:[Trip]? = nil
        if isFriend {
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
