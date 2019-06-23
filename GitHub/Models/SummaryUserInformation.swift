//
//  SummaryUserInformation.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/23.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import Foundation

/*
 "login": "kishikawakatsumi",
 "id": 40610,
 "node_id": "MDQ6VXNlcjQwNjEw",
 "avatar_url": "https://avatars1.githubusercontent.com/u/40610?v=4",
 "gravatar_id": "",
 "url": "https://api.github.com/users/kishikawakatsumi",
 "html_url": "https://github.com/kishikawakatsumi",
 "followers_url": "https://api.github.com/users/kishikawakatsumi/followers",
 "following_url": "https://api.github.com/users/kishikawakatsumi/following{/other_user}",
 "gists_url": "https://api.github.com/users/kishikawakatsumi/gists{/gist_id}",
 "starred_url": "https://api.github.com/users/kishikawakatsumi/starred{/owner}{/repo}",
 "subscriptions_url": "https://api.github.com/users/kishikawakatsumi/subscriptions",
 "organizations_url": "https://api.github.com/users/kishikawakatsumi/orgs",
 "repos_url": "https://api.github.com/users/kishikawakatsumi/repos",
 "events_url": "https://api.github.com/users/kishikawakatsumi/events{/privacy}",
 "received_events_url": "https://api.github.com/users/kishikawakatsumi/received_events",
 "type": "User",
 "site_admin": false
 */

struct SummaryUserInformation: Codable {
    var id = 0
    var screenId = ""
    var avatarURL = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case screenId = "login"
        case avatarURL = "avatar_url"
    }
}
