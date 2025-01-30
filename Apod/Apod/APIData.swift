//
//  Apod
//
//  Created by Ming Xia on 4/13/22.
//

import Foundation


struct APIData: Codable{
    var title: String
    var explanation: String
    var url: URL
    var copyright: String?
    var date: String
    
    enum Keys: String, CodingKey{
        case title
        case explanation
        case url
        case copyright
        case date
        case hdurl
    }
    
    
//    init(from decoder: Decoder) throws {
//        let valueContainer = try decoder.container(keyedBy: Keys.self)
//        self.title = try valueContainer.decode(String.self, forKey: .title)
//        self.explanation = try valueContainer.decode(String.self, forKey: .explanation)
//        self.url = try valueContainer.decode(URL.self, forKey: .url)
//        self.copyright = try valueContainer.decode(String.self, forKey: .copyright)
//        self.date = try valueContainer.decode(String.self, forKey: .date)
//        self.hdurl = try valueContainer.decode(URL.self, forKey: .hdurl)
//    }
    
}
