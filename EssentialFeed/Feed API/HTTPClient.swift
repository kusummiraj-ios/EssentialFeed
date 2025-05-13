//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Kusum Miraj on 5/13/25.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
