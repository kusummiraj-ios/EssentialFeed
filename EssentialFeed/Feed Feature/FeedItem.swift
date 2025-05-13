//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Kusum Miraj on 5/6/25.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String
    let location: String?
    let imageURL: URL
}
