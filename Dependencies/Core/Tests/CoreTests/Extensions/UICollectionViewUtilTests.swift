//
//  UICollectionViewUtilTests.swift
//
//
//  Created by João Lucas on 22/12/23.
//

import XCTest
@testable import Core

final class UICollectionViewUtilTests: XCTestCase {

    func testSuccessWhenRegisteringTheUICollectionViewCellAndDequeuing() {
        let viewController = TestCollectionViewController(collectionViewLayout: UICollectionViewLayout())
        guard let collectionView = viewController.collectionView else {
            XCTFail("CollectionView is nil")
            return
        }

        collectionView.registerCell(cellType: MySimpleCell.self)

        let cell = collectionView.addCell(for: IndexPath(row: 0, section: 0), cellType: MySimpleCell.self)
        XCTAssertTrue(cell is MySimpleCell)
    }
}
