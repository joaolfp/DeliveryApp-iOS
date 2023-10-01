//
//  AddressViewController.swift
//  
//
//  Created by João Lucas on 01/10/23.
//

import UIKit
import Core
import DesignSystem
import Networking

final class AddressViewController: UIViewController {
    
    private lazy var addressView: AddressView = {
        let view = AddressView()
        view.delegate = self
        return view
    }()
    
    private lazy var containerView: LoadingContainerView = {
        let view = LoadingContainerView(containerView: self.addressView)
        return view
    }()
    
    private let viewModel: AddressViewModelProtocol
    
    var coordinator: CoordinatorProtocol?
    
    init(viewModel: AddressViewModelProtocol = AddressViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = containerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Localizable.address.rawValue
        fetchAddressList()
    }
}

extension AddressViewController {
    
    func fetchAddressList() {
        viewModel.fetchAddress()
            .loadingObserver(onLoading)
            .successObserver(onSuccess)
            .errorObserver(onFailure)
    }
    
    func onLoading() {
        containerView.status = .loading
    }
    
    func onSuccess(list: [AddressDTO]) {
        containerView.status = .showView
        addressView.setup(data: list)
    }
    
    func onFailure(error: APIError) {
        let errorView = ErrorView(message: Localizable.messageError.rawValue)
        view = errorView
    }
}

extension AddressViewController: AddressViewDelegate {
    
    func getAddressSelected(item: AddressDTO) {
        // TODO: Guardar este dado local
    }
}
