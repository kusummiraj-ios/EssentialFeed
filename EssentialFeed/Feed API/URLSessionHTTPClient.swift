//
//  URLSessionHTTPClient.swift
//  EssentialFeed
//
//  Created by Kusum Miraj on 6/23/25.
//

import Foundation

public class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession
    private struct UnExpectedValuesRepresentation: Error {}
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    public func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {
        session.dataTask(with: url) { data, response, error in
            if let data = data, let response = response as? HTTPURLResponse {
                completion(.success(data, response))
            } else if let error = error {
                completion(.failure(error))
            } else {
                completion(.failure(UnExpectedValuesRepresentation()))
            }
        }.resume()
    }
}
