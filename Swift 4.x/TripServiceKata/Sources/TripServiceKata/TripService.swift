import Foundation

class TripService {
    func getTripsByUser(_ user:User) throws -> [Trip]? {
        var tripList:[Trip]? = nil
        let loggedUser = getLoggedUser()
        var isFriend = false
        
        if (loggedUser == nil) {
            throw TripServiceErrorType.userNotLoggedIn
        }
        
        for friend in user.getFriends() {
            if friend == loggedUser {
                isFriend = true
                break
            }
        }
        
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
