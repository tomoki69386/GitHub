//
//  UserInformation.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/23.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import Foundation

/*
 "login": "tomoki69386",
 "id": 28350464,
 "node_id": "MDQ6VXNlcjI4MzUwNDY0",
 "avatar_url": "https://avatars0.githubusercontent.com/u/28350464?v=4",
 "gravatar_id": "",
 "url": "https://api.github.com/users/tomoki69386",
 "html_url": "https://github.com/tomoki69386",
 "followers_url": "https://api.github.com/users/tomoki69386/followers",
 "following_url": "https://api.github.com/users/tomoki69386/following{/other_user}",
 "gists_url": "https://api.github.com/users/tomoki69386/gists{/gist_id}",
 "starred_url": "https://api.github.com/users/tomoki69386/starred{/owner}{/repo}",
 "subscriptions_url": "https://api.github.com/users/tomoki69386/subscriptions",
 "organizations_url": "https://api.github.com/users/tomoki69386/orgs",
 "repos_url": "https://api.github.com/users/tomoki69386/repos",
 "events_url": "https://api.github.com/users/tomoki69386/events{/privacy}",
 "received_events_url": "https://api.github.com/users/tomoki69386/received_events",
 "type": "User",
 "site_admin": false,
 "name": "ともき",
 "company": null,
 "blog": "http://tomoki69386.github.io/",
 "location": null,
 "email": null,
 "hireable": null,
 "bio": "iOS & Rails Engineer",
 "public_repos": 27,
 "public_gists": 0,
 "followers": 16,
 "following": 21,
 "created_at": "2017-05-03T13:00:56Z",
 "updated_at": "2019-06-11T04:22:22Z"
 */

struct UserInformation: Codable {
    var id = 0
    var screenId = ""
    var avatarURL = ""
    var name = ""
    var description = ""
    var publicRepositorys = 0
    var followers = 0
    var following = 0
    
    enum CodingKeys: String, CodingKey {
        case id
        case screenId = "login"
        case avatarURL = "avatar_url"
        case name
        case description = "bio"
        case publicRepositorys = "public_repos"
        case followers
        case following
    }
}
