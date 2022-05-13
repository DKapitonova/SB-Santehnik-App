//
//  ChooseOrderAddressCollectionViewController.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class ChooseOrderAddressCollectionViewController: UIViewController {
  
  private(set) lazy var settedCollectionView = view as! ChooseOrderAddressCollectionView
  
  private(set) var currentSnapshot = NSDiffableDataSourceSnapshot<ChooseOrderAddressSection, ChooseOrderAddressItem>()
  
  private(set) lazy var dateSource = createDataSource()
  
  override func loadView() {
    view = ChooseOrderAddressCollectionView(frame: .init(), collectionViewLayout: creatLayout())
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    settedCollectionView.dataSource = dateSource
    // settedCollectionView.delegate = self
    
    let titleView = NavigationItemTitleView(frame: .zero)
    titleView.configureWith(title: title!, subtitle: "шаг 2/3")
    navigationItem.titleView = titleView
    
    settedCollectionView.continueButton.addTarget(self, action: #selector(continueButtonDidTapped(_:)), for: .touchUpInside)
  }
  
  @objc private func continueButtonDidTapped(_ sender: UIButton) {
    navigationController?.pushViewController(ChooseOrderDateViewController(title: title!), animated: true)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    var snapshot = NSDiffableDataSourceSnapshot<ChooseOrderAddressSection, ChooseOrderAddressItem>()
    snapshot.appendSections(ChooseOrderAddressSection.allCases)
    snapshot.appendItems([
      .address(.init(title: "Дом", address: "Москва, Ленинский проспект, д. 37, подъезд 7, этаж 3, кв. 67")),
      .address(.init(title: "Бабушка", address: "Москва, Панинский проспект, д. 12, подъезд 2, этаж 5, кв. 24")),
      .addAddress
    ])
    currentSnapshot = snapshot
    dateSource.applySnapshotUsingReloadData(snapshot)
  }
  
  init(title: String) {
    super.init(nibName: nil, bundle: nil)
    self.title = title
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
}

extension ChooseOrderAddressCollectionViewController {
  
  private func creatLayout() -> UICollectionViewCompositionalLayout {
    //
    let globalHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50.0))
    let globalHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: globalHeaderSize, elementKind: GeneralOrderInfoGlobalHeaderReusableView.kind, alignment: .topLeading, absoluteOffset: .init(x: 20.0, y: -20.0))
    
    //
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let itemGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100.0))
    let itemGroup = NSCollectionLayoutGroup.vertical(layoutSize: itemGroupSize, subitems: [item])
    let itemSection = NSCollectionLayoutSection(group: itemGroup)
    itemSection.interGroupSpacing = 15

    let configuration = UICollectionViewCompositionalLayoutConfiguration()
    configuration.boundarySupplementaryItems = [globalHeader]
    configuration.contentInsetsReference = .layoutMargins
    
    return .init(sectionProvider: { (sectionIndex, environment) in
      switch sectionIndex {
      case 0:
        return itemSection
      default:
        preconditionFailure()
      }
    }, configuration: configuration)
  }
}

extension ChooseOrderAddressCollectionViewController {
  
  private func createDataSource() -> UICollectionViewDiffableDataSource<ChooseOrderAddressSection, ChooseOrderAddressItem> {
    let dataSource = UICollectionViewDiffableDataSource<ChooseOrderAddressSection, ChooseOrderAddressItem>(collectionView: settedCollectionView) { (collectionView, indexPath, itemIdentifier) in
      switch itemIdentifier {
      case .address(let storedAddress):
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChooseOrderAddressItemCollectionViewCell.id, for: indexPath) as! ChooseOrderAddressItemCollectionViewCell
        cell.configureWith(name: storedAddress.title, address: storedAddress.address)
        return cell
        
      case .addAddress:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChooseOrderAddressAddCollectionViewCell.id, for: indexPath) as! ChooseOrderAddressAddCollectionViewCell
        cell.delegate = self
        return cell
      }
    }
    
    dataSource.supplementaryViewProvider = { (collectionView, elementKind, indexPath) in
      switch elementKind {
      case GeneralOrderInfoGlobalHeaderReusableView.kind:
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: GeneralOrderInfoGlobalHeaderReusableView.id, for: indexPath) as! GeneralOrderInfoGlobalHeaderReusableView
        supplementaryView.configure(withTitle: "Выберите адрес")
        return supplementaryView
        
      default:
        preconditionFailure()
      }
    }
    
    return dataSource
  }
}

extension ChooseOrderAddressCollectionViewController: ChooseOrderAddressAddCollectionViewCellDelegate {
  
  func didTapped(in cell: ChooseOrderAddressAddCollectionViewCell) {
    navigationController?.pushViewController(AddNewAddressCollectionViewController(title: title!), animated: true)
  }
}

enum ChooseOrderAddressSection: Hashable, CaseIterable {
  case main
}

enum ChooseOrderAddressItem: Hashable {
  case address(StoredAddress)
  case addAddress
}

struct StoredAddress: Hashable {
  let title: String
  let address: String
}
