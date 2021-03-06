import Foundation

struct Issue: Codable {
    let number: Int
    let title: String
    let user: User
    let body: String?
    
    static func empty() -> Issue {
        return Issue(number: 0, title: "", user: User(login: "", avatarURL: ""), body: "")
    }
}

struct User: Codable {
    let login: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}
