//
//  RemoteLoadFeeder.swift
//  EssentialFeed
//
//  Created by Kusum Miraj on 5/8/25.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (Error) -> Void)
}

public final class RemoteLoadFeeder {
    private let client: HTTPClient
    private let url: URL
    
    public enum Error: Swift.Error {
        case connectivity
    }
    
    public init(client: HTTPClient, url: URL) {
        self.client = client
        self.url = url
    }
    
    public func load(completion: @escaping (Error) -> Void = { _ in }) {
        client.get(from: url)  { error in
            completion(.connectivity)
        }
    }
}

