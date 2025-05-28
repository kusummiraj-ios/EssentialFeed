//
//  URLSessionHTTPClientTests.swift
//  EssentialFeedTests
//
//  Created by Kusum Miraj on 5/28/25.
//

import XCTest

class URLSessionHTTPClient {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func get(from url: URL) {
        session.dataTask(with: url) {_, _, _ in }
    }
}

final class URLSessionHTTPClientTests: XCTestCase {

    func test() {
        let url = URL(string: "http://any-url.com")!
        let session = URLSessionSpy()
        let sut = URLSessionHTTPClient(session: session)
        
        sut.get(from: url)
        XCTAssertEqual(session.receivedURLs, [url])
    }
}

// MARK - Helpers

private class FakeURLSessionDataTask: URLSessionDataTask {}
private class URLSessionSpy: URLSession {
    var receivedURLs = [URL]()
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        receivedURLs.append(url)
        return FakeURLSessionDataTask()
    }
}

