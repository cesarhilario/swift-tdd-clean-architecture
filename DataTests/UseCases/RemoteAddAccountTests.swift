//
//  DataTests.swift
//  DataTests
//
//  Created by Cesar Hilario on 14/08/22.
//

import XCTest;
import Domain;
import Data;

class RemoteAddAccountTests: XCTestCase {
    func test_add_should_call_httpClient_with_correct_url() {
        let (sut, httpClientSpy) = makeSut();
        let url = URL(string: "http://any-url.com");
        sut.add(addAccountModel: makeAccountModel()) { _ in };
        XCTAssertEqual(httpClientSpy.urls, [url]);
    }
    
    func test_add_should_call_httpClient_with_correct_data() {
        let (sut, httpClientSpy) = makeSut();
        let addAccountModel = makeAccountModel();
        sut.add(addAccountModel: addAccountModel) { _ in };
        XCTAssertEqual(httpClientSpy.data, addAccountModel.toData());
    }
    
    func test_add_should_complete_with_error_if_client_fails() {
        let (sut, httpClientSpy) = makeSut();
        let exp = expectation(description: "waiting");
        sut.add(addAccountModel: makeAccountModel()) { error in
            XCTAssertEqual(error, .unexpected);
            exp.fulfill();
        };
        httpClientSpy.completeWithError(.noConnectivity);
        wait(for: [exp], timeout: 1);
    }
}

// Helpers
extension RemoteAddAccountTests {
    // Factory Design Pattern
    func makeAccountModel() -> AddAccountModel {
        return AddAccountModel(name: "any_name", email: "any_email@emai.com", password: "any_password", passwordConfirmation: "any_password");
    }
    
    func makeSut(url: URL = URL(string: "http://any-url.com")!) -> (sut: RemoteAddAccount, httpClientSpy: HttpClientSpy) {
        let httpClientSpy = HttpClientSpy();
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy);
        
        return (sut, httpClientSpy);
    }
    
    class HttpClientSpy: HttpPostClient {
        var urls = [URL]();
        var data: Data?;
        var completion: ((HttpError) -> Void)?;
        
        func post(to url: URL, with data: Data?, completion: @escaping (HttpError) -> Void) {
            self.urls.append(url);
            self.data = data;
            self.completion = completion;
        }
        
        func completeWithError(_ error: HttpError) {
            completion?(error);
        }
    }
}
