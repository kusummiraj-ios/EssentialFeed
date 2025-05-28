//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Kusum Miraj on 5/6/25.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
