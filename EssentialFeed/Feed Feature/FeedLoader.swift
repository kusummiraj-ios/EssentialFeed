//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Kusum Miraj on 5/6/25.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}
protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
