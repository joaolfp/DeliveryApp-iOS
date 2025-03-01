//
//  UITableViewUtilTests.swift
//
//
//  Created by João Lucas on 22/12/23.
//

import XCTest
@testable import Core

final class UITableViewUtilTests: XCTestCase {

    func testSuccessWhenRegisteringTheUITableViewCellAndDequeuing() {
        let viewController = TestTableViewController()
        guard let tableView = viewController.tableView else {
            XCTFail("TableView is nil")
            return
        }

        tableView.registerCell(cellType: MySimpleTableCell.self)

        let cell = tableView.addCell(for: IndexPath(row: 0, section: 0), cellType: MySimpleTableCell.self)
        XCTAssertTrue(cell is MySimpleTableCell)
    }
}
