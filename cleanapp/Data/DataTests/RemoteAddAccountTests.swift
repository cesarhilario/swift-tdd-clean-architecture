//
//  DataTests.swift
//  DataTests
//
//  Created by Cesar Hilario on 28/03/23.
//

import XCTest
import Domain

class RemoteAddAccount {
    private let url: URL;
    private let httpClient: HttpPostClient;
    
    init(url: URL, httpClient: HttpPostClient) {
        self.url = url;
        self.httpClient = httpClient;
    }
    
    func add(addAccountModel: AddAccountModel) {
        httpClient.post(url: url)
    }
}

protocol HttpPostClient {
    func post(url: URL);
}

final class RemoteAddAccountTests: XCTestCase {
    func test_add_should_call_httpClient_with_correct_url() {
        let url = URL(string: "https://any-url.com")!;
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy);
        let addAccountModel = AddAccountModel(name: "any_name", email: "any_email@email.com", password: "any_password", passwordConfirmation: "any_password");
        sut.add(addAccountModel: addAccountModel);
        XCTAssertEqual(httpClientSpy.url, url);
    }

}

// Helpers
extension RemoteAddAccountTests {
    class HttpClientSpy: HttpPostClient {
        var url: URL?
        
        func post(url: URL) {
            self.url = url;
        }
    }
}
