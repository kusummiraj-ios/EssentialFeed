//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Kusum Miraj on 5/8/25.
//

import XCTest

class RemoteLoadFeeder {
    
}

class HTTPClient {
    var requestedURL: URL?
}
final class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteLoadFeeder()
        
        XCTAssertNil(client.requestedURL)
    }
}
