//
//  GeneralOrderInfoCollectionViewController.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit
import Photos
import PhotosUI

final class GeneralOrderInfoCollectionViewController: UIViewController {
  
  private(set) lazy var settedCollectionView = view as! GeneralOrderInfoCollectionView
  
  private(set) var currentSnapshot = NSDiffableDataSourceSnapshot<GeneralOrderInfoSection, GeneralOrderInfoItem>()
  
  private(set) lazy var dateSource = createDataSource()
  
  override func loadView() {
    view = GeneralOrderInfoCollectionView(frame: .zero, collectionViewLayout: creatLayout())
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    settedCollectionView.dataSource = dateSource
    settedCollectionView.delegate = self
    
    let titleView = NavigationItemTitleView(frame: .zero)
    titleView.configureWith(title: title!, subtitle: "шаг 1/3")
    navigationItem.titleView = titleView
    
    settedCollectionView.continueButton.addTarget(self, action: #selector(continueButtonDidTapped(_:)), for: .touchUpInside)
  }
  
  @objc private func continueButtonDidTapped(_ sender: UIButton) {
    navigationController?.pushViewController(ChooseOrderAddressCollectionViewController(title: title!), animated: true)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    var snapshot = NSDiffableDataSourceSnapshot<GeneralOrderInfoSection, GeneralOrderInfoItem>()
    snapshot.appendSections(GeneralOrderInfoSection.allCases)
    snapshot.appendItems([.taskDescription], toSection: .taskDescription)
    snapshot.appendItems([.addPhoto], toSection: .addPhotos)
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

extension GeneralOrderInfoCollectionViewController {
  
  private func creatLayout() -> UICollectionViewCompositionalLayout {
    //
    let globalHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50.0))
    let globalHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: globalHeaderSize, elementKind: GeneralOrderInfoGlobalHeaderReusableView.kind, alignment: .topLeading, absoluteOffset: .init(x: 20.0, y: -20.0))
    
    //
    let descHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50.0))
    let descHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: descHeaderSize, elementKind: GeneralOrderInfoTaskDescriptionHeaderReusableView.kind, alignment: .top, absoluteOffset: .init(x: 0.0, y: -10.0))
    
    let descItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150.0))
    let descItem = NSCollectionLayoutItem(layoutSize: descItemSize)
    let descGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150.0))
    let descGroup = NSCollectionLayoutGroup.vertical(layoutSize: descGroupSize, subitem: descItem, count: 1)
    let descSection = NSCollectionLayoutSection(group: descGroup)
    descSection.boundarySupplementaryItems = [descHeader]
    
    //
    let photoHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50.0))
    let photoHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: photoHeaderSize, elementKind: GeneralOrderInfoPhotosHeaderReusableView.kind, alignment: .top, absoluteOffset: .init(x: 0.0, y: -10.0))
    
    let photoFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50.0))
    let photoFooter = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: photoFooterSize, elementKind: GeneralOrderInfoPhotosFooterReusableView.kind, alignment: .bottom, absoluteOffset: .init(x: 0.0, y: 10.0))
    
    let photoItemSize = NSCollectionLayoutSize(widthDimension: .absolute(150.0), heightDimension: .absolute(100.0))
    let photoItem = NSCollectionLayoutItem(layoutSize: photoItemSize)
    let photoGroupSize = NSCollectionLayoutSize(widthDimension: .absolute(150.0), heightDimension: .absolute(100.0))
    let photoGroup = NSCollectionLayoutGroup.horizontal(layoutSize: photoGroupSize, subitems: [photoItem])
    let photoSection = NSCollectionLayoutSection(group: photoGroup)
    photoSection.interGroupSpacing = 15
    photoSection.orthogonalScrollingBehavior = .continuous
    photoSection.boundarySupplementaryItems = [photoHeader, photoFooter]
    
    let configuration = UICollectionViewCompositionalLayoutConfiguration()
    configuration.boundarySupplementaryItems = [globalHeader]
    configuration.contentInsetsReference = .layoutMargins
    configuration.interSectionSpacing = 30.0
    
    return .init(sectionProvider: { (sectionIndex, environment) in
      switch sectionIndex {
      case 0:
        return descSection
      case 1:
        return photoSection
      default:
        preconditionFailure()
      }
    }, configuration: configuration)
  }
}

extension GeneralOrderInfoCollectionViewController {
  
  private func createDataSource() -> UICollectionViewDiffableDataSource<GeneralOrderInfoSection, GeneralOrderInfoItem> {
    let dataSource = UICollectionViewDiffableDataSource<GeneralOrderInfoSection, GeneralOrderInfoItem>(collectionView: settedCollectionView) { (collectionView, indexPath, itemIdentifier) in
      switch itemIdentifier {
      case .taskDescription:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GeneralOrderInfoTaskDescriptionCollectionViewCell.id, for: indexPath) as! GeneralOrderInfoTaskDescriptionCollectionViewCell
        return cell
        
      case .photo(let photo):
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GeneralOrderInfoPhotosItemCollectionViewCell.id, for: indexPath) as! GeneralOrderInfoPhotosItemCollectionViewCell
        cell.configure(withImage: photo)
        return cell
        
      case .addPhoto:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GeneralOrderInfoPhotosAddCollectionViewCell.id, for: indexPath) as! GeneralOrderInfoPhotosAddCollectionViewCell
        return cell
      }
    }
    
    dataSource.supplementaryViewProvider = { [unowned self] (collectionView, elementKind, indexPath) in
      switch elementKind {
      case GeneralOrderInfoGlobalHeaderReusableView.kind:
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: GeneralOrderInfoGlobalHeaderReusableView.id, for: indexPath) as! GeneralOrderInfoGlobalHeaderReusableView
        supplementaryView.configure(withTitle: "Общие данные заказа")
        return supplementaryView
        
      case GeneralOrderInfoTaskDescriptionHeaderReusableView.kind:
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: GeneralOrderInfoTaskDescriptionHeaderReusableView.id, for: indexPath) as! GeneralOrderInfoTaskDescriptionHeaderReusableView
        return supplementaryView
        
      case GeneralOrderInfoPhotosHeaderReusableView.kind:
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: GeneralOrderInfoPhotosHeaderReusableView.id, for: indexPath) as! GeneralOrderInfoPhotosHeaderReusableView
        let count = currentSnapshot
          .itemIdentifiers(inSection: .addPhotos)
          .count
        supplementaryView.configure(withCount: count - 1, limitedBy: 10)
        return supplementaryView
        
      case GeneralOrderInfoPhotosFooterReusableView.kind:
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: GeneralOrderInfoPhotosFooterReusableView.id, for: indexPath) as! GeneralOrderInfoPhotosFooterReusableView
        return supplementaryView
        
      default:
        preconditionFailure()
      }
    }
    
    return dataSource
  }
}

extension GeneralOrderInfoCollectionViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let itemIdentifier = dateSource.itemIdentifier(for: indexPath) else { return }
    if case .addPhoto = itemIdentifier {
      var configuration = PHPickerConfiguration(photoLibrary: .shared())
      configuration.selectionLimit = 3
      configuration.filter = .images
      let PHPickerViewController = PHPickerViewController(configuration: configuration)
      PHPickerViewController.delegate = self
      present(PHPickerViewController, animated: true)
    }
  }
}

extension GeneralOrderInfoCollectionViewController: PHPickerViewControllerDelegate {
  
  func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
    dismiss(animated: true)
    
    let lock = NSLock()
    var images = [UIImage]()
    let group = DispatchGroup()
    results.forEach {
      group.enter()
      $0.itemProvider.loadObject(ofClass: UIImage.self) { (reading, error) in
        defer { group.leave() }
        guard let image = reading as? UIImage, error == nil else { return }
        lock.lock()
        images.append(image)
        lock.unlock()
      }
    }
    group.notify(queue: .main) {
      var snapshot = self.dateSource.snapshot()
      snapshot.insertItems(images.map { .photo($0) }, beforeItem: snapshot.itemIdentifiers(inSection: .addPhotos).last!)
      snapshot.reloadSections([.addPhotos])
      self.currentSnapshot = snapshot
      self.dateSource.apply(snapshot, animatingDifferences: true)
      self.settedCollectionView.continueButton.isEnabled = true
    }
  }
}

enum GeneralOrderInfoSection: Hashable, CaseIterable {
  case taskDescription
  case addPhotos
}

enum GeneralOrderInfoItem: Hashable {
  case taskDescription
  case photo(UIImage)
  case addPhoto
}
