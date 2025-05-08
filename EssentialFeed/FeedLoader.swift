//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Kusum Miraj on 5/6/25.
//

import Foundation

enum Result {
    case success([FeedItem])
    case error(Error)
}
protocol FeedLoader {
    func load(completion: @escaping () -> Void)
}
