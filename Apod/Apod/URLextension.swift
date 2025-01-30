//
//  Apod
//
//  Created by Ming Xia on 4/13/22.
//


//This code is quoted from Professor Bonamy's lecture

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL?{
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap
        { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

//This code is quoted from Professor Bonamy's lecture
