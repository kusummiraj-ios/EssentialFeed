//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Kusum Miraj on 5/8/25.
//

import XCTest

class RemoteLoadFeeder {
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient()
    
    func get(from url: URL) {}
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    override func get(from url: URL) {
        requestedURL = url
    }
}
final class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteLoadFeeder()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteLoadFeeder()
        
        sut.load()
        XCTAssertNotNil(client.requestedURL)
    }
}
