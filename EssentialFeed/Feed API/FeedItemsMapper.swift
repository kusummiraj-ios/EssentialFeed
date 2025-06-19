//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Kusum Miraj on 5/13/25.
//

import Foundation

internal class FeedItemsMapper {
    private struct Root: Decodable {
        let items: [Item]
        
        var feed: [FeedItem] {
            items.map { $0.item }
        }
    }

    private struct Item: Decodable {
        let id: UUID
        let description: String?
        let location: String?
        let image: URL

        var item: FeedItem {
            FeedItem(id: id, description: description, location: location, imageURL: image)
        }
    }
    
    private static var OK_200: Int { 200 }
    
    internal static func map(_ data: Data, from response: HTTPURLResponse) -> RemoteFeedLoader.Result {
        guard response.statusCode == OK_200,
              let root = try? JSONDecoder().decode(Root.self, from: data)
        else { return .failure(RemoteFeedLoader.Error.invalidData) }

        return .success(root.feed)
    }
}

struct DataRaceDemonstrator {
    
    /// When the Thread Sanitizer in the scheme settings is turned on, this method will result in a purple warning for a data race in closure #1.
    func demonstrateDataRace() {
        var counter = 0
        let queue = DispatchQueue.global(qos: .background)
        
        for _ in 1...10 {
            queue.async {
                // Data race potential: multiple threads access without synchronization:
                counter += 1
            }
        }
        
        // Reading the value while it's written.
        print("Final counter value: \(counter)")
    }
}
