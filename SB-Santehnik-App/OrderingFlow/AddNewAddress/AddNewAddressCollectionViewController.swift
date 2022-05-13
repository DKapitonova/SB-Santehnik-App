//
//  AddNewAddressCollectionViewController.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class AddNewAddressCollectionViewController: UIViewController {
  
  private(set) lazy var settedCollectionView = view as! AddNewAddressCollectionView
  
  private(set) var currentSnapshot = NSDiffableDataSourceSnapshot<AddNewAddressSection, AddNewAddressItem>()
  
  private(set) lazy var dateSource = createDataSource()
  
  override func loadView() {
    view = AddNewAddressCollectionView(frame: .zero, collectionViewLayout: creatLayout())
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    settedCollectionView.dataSource = dateSource
    // settedCollectionView.delegate = self
    
    title = "Новый адрес"
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    var snapshot = NSDiffableDataSourceSnapshot<AddNewAddressSection, AddNewAddressItem>()
    snapshot.appendSections(AddNewAddressSection.allCases)
    snapshot.appendItems([
      .addressPart("Название адреса в профиле"),
      .addressPart("Город"),
      .addressPart("Адрес"),
      .addressPart("Дом"),
      .addressPart("Корпус"),
      .addressPart("Строение"),
      .addressPart("Подъезд"),
      .addressPart("Квартира"),
      .addressPart("Этаж"),
    ], toSection: .main)
    snapshot.appendItems([.comment], toSection: .comment)
    currentSnapshot = snapshot
    dateSource.applySnapshotUsingReloadData(snapshot)
    
    settedCollectionView.continueButton.addTarget(self, action: #selector(continueButtonDidTapped(_:)), for: .touchUpInside)
  }
  
  private let _title: String
  
  @objc private func continueButtonDidTapped(_ sender: UIButton) {
    navigationController?.pushViewController(ChooseOrderDateViewController(title: _title), animated: true)
  }
  
  init(title: String) {
    self._title = title
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
}

extension AddNewAddressCollectionViewController {
  
  private func creatLayout() -> UICollectionViewCompositionalLayout {
    //
    let globalHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50.0))
    let globalHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: globalHeaderSize, elementKind: AddNewAddressGlobalHeaderReusableView.kind, alignment: .top, absoluteOffset: .init(x: 0.0, y: -20.0))
    
    //
    let largeItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50.0))
    let largeItem = NSCollectionLayoutItem(layoutSize: largeItemSize)
    
    let largeItemGroupSizeHeightEstimated = 50.0 * 3.0 + 2.0 * 20.0
    let largeItemGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(largeItemGroupSizeHeightEstimated))
    let largeItemGroup = NSCollectionLayoutGroup.vertical(layoutSize: largeItemGroupSize, subitem: largeItem, count: 3)
    largeItemGroup.interItemSpacing = .fixed(20.0)
    
    let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(50.0))
    let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
    
    let smallItemGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50.0))
    let smallItemGroup = NSCollectionLayoutGroup.horizontal(layoutSize: smallItemGroupSize, subitem: smallItem, count: 2)
    smallItemGroup.interItemSpacing = .fixed(20.0)
    
    let allSmallItemGroupSizeHeightEstimated = 50.0 * 3.0 + 2.0 * 20.0
    let allSmallItemGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(allSmallItemGroupSizeHeightEstimated))
    let allSmallItemGroup = NSCollectionLayoutGroup.vertical(layoutSize: allSmallItemGroupSize, subitem: smallItemGroup, count: 3)
    allSmallItemGroup.interItemSpacing = .fixed(20.0)
    
    let itemGroupSizeHeightEstimated = largeItemGroupSizeHeightEstimated + allSmallItemGroupSizeHeightEstimated + 20.0
    let itemGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(itemGroupSizeHeightEstimated))
    let itemGroup = NSCollectionLayoutGroup.vertical(layoutSize: itemGroupSize, subitems: [largeItemGroup, allSmallItemGroup])
    itemGroup.interItemSpacing = .fixed(20.0)
    
    let itemSection = NSCollectionLayoutSection(group: itemGroup)
    
    //
    let descHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50.0))
    let descHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: descHeaderSize, elementKind: GeneralOrderInfoTaskDescriptionHeaderReusableView.kind, alignment: .top, absoluteOffset: .init(x: 0.0, y: -10.0))
    
    let descItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150.0))
    let descItem = NSCollectionLayoutItem(layoutSize: descItemSize)
    let descGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150.0))
    let descGroup = NSCollectionLayoutGroup.vertical(layoutSize: descGroupSize, subitem: descItem, count: 1)
    let descSection = NSCollectionLayoutSection(group: descGroup)
    descSection.boundarySupplementaryItems = [descHeader]
    descSection.interGroupSpacing = 20.0
    
    //
    let configuration = UICollectionViewCompositionalLayoutConfiguration()
    configuration.boundarySupplementaryItems = [globalHeader]
    configuration.contentInsetsReference = .layoutMargins
    configuration.interSectionSpacing = 30.0
    
    return .init(sectionProvider: { (sectionIndex, environment) in
      switch sectionIndex {
      case 0:
        return itemSection
      case 1:
        return descSection
      default:
        preconditionFailure()
      }
    }, configuration: configuration)
  }
}

extension AddNewAddressCollectionViewController {
  
  private func createDataSource() -> UICollectionViewDiffableDataSource<AddNewAddressSection, AddNewAddressItem> {
    let dataSource = UICollectionViewDiffableDataSource<AddNewAddressSection, AddNewAddressItem>(collectionView: settedCollectionView) { (collectionView, indexPath, itemIdentifier) in
      switch itemIdentifier {
      case .addressPart(let part):
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddNewAddressTextFieldCollectionViewCell.id, for: indexPath) as! AddNewAddressTextFieldCollectionViewCell
        cell.configure(withPlaceholder: part)
        return cell
        
      case .comment:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GeneralOrderInfoTaskDescriptionCollectionViewCell.id, for: indexPath) as! GeneralOrderInfoTaskDescriptionCollectionViewCell
        return cell
      }
    }
    
    dataSource.supplementaryViewProvider = { (collectionView, elementKind, indexPath) in
      switch elementKind {
      case AddNewAddressGlobalHeaderReusableView.kind:
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: AddNewAddressGlobalHeaderReusableView.id, for: indexPath) as! AddNewAddressGlobalHeaderReusableView
        supplementaryView.configure(withTitle: "Новый адрес")
        return supplementaryView
        
      case GeneralOrderInfoTaskDescriptionHeaderReusableView.kind:
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: GeneralOrderInfoTaskDescriptionHeaderReusableView.id, for: indexPath) as! GeneralOrderInfoTaskDescriptionHeaderReusableView
        return supplementaryView
        
      default:
        preconditionFailure()
      }
    }
    
    return dataSource
  }
}

enum AddNewAddressSection: Hashable, CaseIterable {
  case main
  case comment
}

enum AddNewAddressItem: Hashable {
  case addressPart(String)
  case comment
}
