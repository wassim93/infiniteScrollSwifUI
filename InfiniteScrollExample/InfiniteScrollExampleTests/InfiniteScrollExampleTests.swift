//
//  InfiniteScrollExampleTests.swift
//  InfiniteScrollExampleTests
//
//  Created by wassim on 23/8/2021.
//

import XCTest
@testable import InfiniteScrollExample

class InfiniteScrollExampleTests: XCTestCase {
    
    var vm:TvShowViewModel = TvShowViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUrls() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        vm.getTvShows()
        XCTAssertEqual(Api.getPopularUrl(page: vm.page), "https://api.themoviedb.org/3/tv/popular?api_key=\(Api.apiKey)&page=1")
        
        XCTAssertEqual(Api.getSearchUrl(query: "raw", page: nil), "https://api.themoviedb.org/3/search/tv?api_key=\(Api.apiKey)&query=raw")
        
        
        XCTAssertEqual(Api.getSearchUrl(query: "raw", page: vm.page), "https://api.themoviedb.org/3/search/tv?api_key=\(Api.apiKey)&query=raw&page=1")

        //vm.page += 1

        XCTAssertEqual(vm.page, 1)
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
