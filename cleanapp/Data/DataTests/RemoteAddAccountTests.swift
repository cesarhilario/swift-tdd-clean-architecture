//
//  DataTests.swift
//  DataTests
//
//  Created by Cesar Hilario on 28/03/23.
//

import XCTest

class RemoteAddAccount {
    private let url: URL;
    private let httpClient: HttpClient;
    
    init(url: URL, httpClient: HttpClient) {
        self.url = url;
        self.httpClient = httpClient;
    }
    
    func add() {
        httpClient.post(url: url)
    }
}

protocol HttpClient {
    func post(url: URL);
}

final class RemoteAddAccountTests: XCTestCase {
    func test_ensure_RemoteAddAccount_calls_HttpClient_with_correct_URL() {
        let url = URL(string: "https://any-url.com")!;
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy);
        
        sut.add();
        
        XCTAssertEqual(httpClientSpy.url, url);
    }
    
    class HttpClientSpy: HttpClient {
        var url: URL?
        
        func post(url: URL) {
            self.url = url;
        }
    }
}
