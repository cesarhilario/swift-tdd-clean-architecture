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
        let data = try? JSONEncoder().encode(addAccountModel);
        httpClient.post(to: url, with: data)
    }
}

protocol HttpPostClient {
    func post(to url: URL, with data: Data?);
}

final class RemoteAddAccountTests: XCTestCase {
    func test_add_should_call_httpClient_with_correct_url() {
        let url = URL(string: "https://any-url.com")!;
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.add(addAccountModel:  makeAccountModel());
        XCTAssertEqual(httpClientSpy.url, url);
    }
    
    func test_add_should_call_httpClient_with_correct_data() {
        let (sut, httpClientSpy) = makeSut();
        let addAccountModel = makeAccountModel();
        sut.add(addAccountModel: addAccountModel);
        let data = try? JSONEncoder().encode(addAccountModel);
        XCTAssertEqual(httpClientSpy.data, data);
    }

}

// Helpers
extension RemoteAddAccountTests {
    // Spy
    class HttpClientSpy: HttpPostClient {
        var url: URL?
        var data: Data?
        
        func post(to url: URL, with data: Data?) {
            self.url = url;
            self.data = data;
        }
    }
    
    // Factories
    func makeSut(url: URL = URL(string: "https://any-url.com")!) -> (sut: RemoteAddAccount, httpClientSpy: HttpClientSpy) {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy);
        
        return (sut, httpClientSpy);
    }
    
    func makeAccountModel() -> AddAccountModel {
        return AddAccountModel(name: "any_name", email: "any_email@email.com", password: "any_password", passwordConfirmation: "any_password");
    }
}
