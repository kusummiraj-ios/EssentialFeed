//
//  RemoteLoadFeeder.swift
//  EssentialFeed
//
//  Created by Kusum Miraj on 5/8/25.
//

import Foundation

public enum HTTPClientResult {
    case success(HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}

public final class RemoteLoadFeeder {
    private let client: HTTPClient
    private let url: URL
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public init(client: HTTPClient, url: URL) {
        self.client = client
        self.url = url
    }
    
    public func load(completion: @escaping (Error) -> Void) {
        client.get(from: url)  { result in
            switch result {
            case .success(let response):
                completion(.invalidData)
            case .failure(let error):
                completion(.connectivity)
            }
        }
    }
}

