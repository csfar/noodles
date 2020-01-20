//
//  NoodlesTests.swift
//  noodlesTests
//
//  Created by Artur Carneiro on 14/01/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import XCTest
@testable import noodles
import CloudKit

class NoodlesTests: XCTestCase {


    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testQuery() {
        let query = CKQuery(recordType: "Channel", predicate: NSPredicate(value: true))
        let exp = expectation(description: "CloudKit Async Query")
        let manager = CloudKitManager()

        var records: [CKRecord]?

        manager.query(using: query, on: .publicDB, completionHandler: { (response) in
            records = response.records
            exp.fulfill()
        })

        waitForExpectations(timeout: 5) { (_) in
        }

        if let records = records {
            XCTAssert(records.count > 0)
        }
    }

    func testSave() {
        let record = CKRecord(recordType: "Channel")
        record.setValue("Bob", forKey: "name")

        let exp = expectation(description: "CloudKit Async Save")
        let manager = CloudKitManager()

        var assertion: Bool = false

        manager.save(record: record, on: .publicDB, completionHandler: { (response) in
            print(response)
            if response.error == nil && response.records == nil {
                assertion.toggle()
            }
            exp.fulfill()
        })

        waitForExpectations(timeout: 5) { (_) in
        }

        XCTAssert(assertion == true)

    }

    func testUpdate() {
        let newRecord = CKRecord(recordType: "Channel")
        let recordID = CKRecord.ID(recordName: "15F50A18-BE79-5D1B-5C05-FAB2104FAC3D")
        let manager = CloudKitManager()
        let exp = expectation(description: "CloudKit Async Update")

        var assertion: Bool = false

        manager.update(recordID: recordID, with: newRecord, on: .publicDB) { (response) in
            print(response)
            if response.error == nil && response.records == nil {
                assertion.toggle()
            }
            exp.fulfill()
        }

        waitForExpectations(timeout: 5) { (error) in
            XCTAssertNil(error)
        }

        XCTAssert(assertion == true)
    }

    func testDelete() {
        let recordID = CKRecord.ID(recordName: "15F50A18-BE79-5D1B-5C05-FAB2104FAC3D")

        let exp = expectation(description: "CloudKit Async Delete")
        let manager = CloudKitManager()

        var assertion: Bool = false

        manager.delete(recordID: recordID, on: .publicDB) { (response) in
            if response.error == nil && response.records == nil {
                assertion.toggle()
            }
            exp.fulfill()
        }

        waitForExpectations(timeout: 5) { (_) in
        }

        XCTAssert(assertion == true)
    }

}
