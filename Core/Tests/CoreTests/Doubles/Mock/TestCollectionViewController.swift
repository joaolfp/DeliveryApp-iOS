@testable import Core
import UIKit

final class TestCollectionViewController: UICollectionViewController {

    override public init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: <UICollectionViewDataSource>

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.addCell(for: indexPath, cellType: MySimpleCell.self)
        return cell
    }
}

final class MySimpleCell: UICollectionViewCell, Identifiable {}
