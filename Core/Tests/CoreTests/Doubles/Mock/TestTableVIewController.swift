//
//  TestTableVIewController.swift
//
//
//  Created by João Lucas on 22/12/23.
//

@testable import Core
import UIKit

final class TestTableViewController: UITableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.addCell(for: indexPath, cellType: MySimpleTableCell.self)
        return cell
    }
}

final class MySimpleTableCell: UITableViewCell, Identifiable {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
