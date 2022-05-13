//
//  ServiceViewController.swift
//  SB-Santehnik-App
//
//  Created by Daria on 30.11.2021.
//

import UIKit
import SnapKit

class ServiceViewController: UIViewController {
    
    let videosController = ConferenceVideoController()
    private(set) lazy var collectionView = view as! ServiceCollectionView
    var dataSource: UICollectionViewDiffableDataSource<ConferenceVideoController.Section, ConferenceVideoController.Item>!
    var currentSnapshot: NSDiffableDataSourceSnapshot<ConferenceVideoController.Section, ConferenceVideoController.Item>!
    
  
    
    static let titleElementKind = "title-element-kind"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.title = "Центр Бытовых Услуг"

        configureHierarchy()
        configureDataSource()
      collectionView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
//        if let navigationBar = navigationController?.navigationBar {
//            let appearance = UINavigationBarAppearance()
//            appearance.configureWithDefaultBackground()
//            appearance.largeTitleTextAttributes = [.font: UIFont.preferredFont(forTextStyle: .title1)]
//
//            navigationBar.prefersLargeTitles = true
//            navigationBar.standardAppearance = appearance
//        }
    }
    
    
}


extension ServiceViewController {
    func createLayout() -> UICollectionViewLayout {
        let sectionProvider = { [unowned self] (sectionIndex: Int,
                                                layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let section : NSCollectionLayoutSection
            
            if sectionIndex == 0 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(50.0))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                                
                let groupWidth = layoutEnvironment.container.contentSize.width
                    - 2.0 * (view.directionalLayoutMargins.leading + view.directionalLayoutMargins.trailing)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(groupWidth),
                                                       heightDimension: .estimated(50.0))
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = view.directionalLayoutMargins.leading
                section.contentInsets = .init(top: collectionView.stackView.bounds.height + view.directionalLayoutMargins.leading,
                                              leading: view.directionalLayoutMargins.leading,
                                              bottom: view.directionalLayoutMargins.trailing,
                                              trailing: view.directionalLayoutMargins.trailing)
            } else {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(50.0))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                var groupWidth = layoutEnvironment.container.contentSize.width
                    - (view.directionalLayoutMargins.leading + view.directionalLayoutMargins.trailing)
                    - (3.0 * view.directionalLayoutMargins.leading)
                groupWidth /= 2.0
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(groupWidth),
                                                       heightDimension: .estimated(50.0))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .estimated(44))
                
                let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: titleSize,
                                                                                     elementKind: ServiceViewController.titleElementKind,
                                                                                     alignment: .top)
                
                section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.boundarySupplementaryItems = [titleSupplementary]
                section.interGroupSpacing = view.directionalLayoutMargins.leading
                section.contentInsets = .init(top: 0.0,
                                              leading: view.directionalLayoutMargins.leading,
                                              bottom: view.directionalLayoutMargins.trailing,
                                              trailing: view.directionalLayoutMargins.trailing)
            }
            
            return section
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        
        let layout = UICollectionViewCompositionalLayout(
            sectionProvider: sectionProvider, configuration: config)
        return layout
    }
}

extension ServiceViewController {
    
    func configureHierarchy() {
        collectionView.setCollectionViewLayout(createLayout(), animated: false)
    }
    
    func configureDataSource() {
        
        let cellRegistrationType1 = UICollectionView.CellRegistration<ConferenceVideoCell1st, ConferenceVideoController.ItemType1> { (cell, indexPath, item) in
            cell.imageView.image = item.image
        }
        
        let cellRegistrationType2 = UICollectionView.CellRegistration<ConferenceVideoCell, ConferenceVideoController.ItemType2> { (cell, indexPath, item) in
            cell.imageView.image = item.image
            cell.titleLabel.text = item.title
            //cell.categoryLabel.text = item.category
            
        }
        
        dataSource = UICollectionViewDiffableDataSource<ConferenceVideoController.Section, ConferenceVideoController.Item>(collectionView: collectionView) {
            [unowned self] (collectionView, indexPath, item) -> UICollectionViewCell? in
            
            switch currentSnapshot.sectionIdentifiers[indexPath.section] {
            case .type1:
                guard case .type1(let value) = item else { preconditionFailure() }
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistrationType1, for: indexPath, item: value)
                
            case .type2:
                guard case .type2(let value) = item else { preconditionFailure() }
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistrationType2, for: indexPath, item: value)
            }
        }
        
        let supplementaryRegistration = UICollectionView.SupplementaryRegistration<TitleSupplementaryView>(elementKind: ServiceViewController.titleElementKind) {
            [unowned self] (supplementaryView, elementKind, indexPath) in
            
            switch currentSnapshot.sectionIdentifiers[indexPath.section] {
            case .type2(let title):
                supplementaryView.label.text = title
                
            default:
                preconditionFailure()
            }
        }
        
        dataSource.supplementaryViewProvider = {
            (collectionView, elementKind, indexPath) in
            
            return collectionView.dequeueConfiguredReusableSupplementary(using: supplementaryRegistration, for: indexPath)
        }
        
        currentSnapshot = NSDiffableDataSourceSnapshot<ConferenceVideoController.Section, ConferenceVideoController.Item>()
        
        for pair in videosController.pairs {
            currentSnapshot.appendSections([pair.sections])
            currentSnapshot.appendItems(pair.items)
        }
        
        dataSource.apply(currentSnapshot, animatingDifferences: false)
    }
}



// MARK: -
final class ServiceCollectionView: UICollectionView {
    
    let title: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .preferredFont(forTextStyle: .largeTitle)
        $0.text = "Центр Бытовых Услуг"
        $0.textColor = .label
        return $0
    }(UILabel(frame: .zero))
    
    let subtitle: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .preferredFont(forTextStyle: .body)
        $0.text = "Сервис по вызову мастера на дом"
        $0.textColor = .secondaryLabel
        return $0
    }(UILabel(frame: .zero))
    
    private(set) lazy var searchBar: UISearchBar = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.searchBarStyle = .minimal
        $0.placeholder = "Поиск услуги"
        $0.delegate = self
        $0.searchTextField.autocapitalizationType = .none
        $0.searchTextField.autocorrectionType = .no
        $0.searchTextField.returnKeyType = .default
        $0.searchTextField.smartDashesType = .no
        $0.searchTextField.smartInsertDeleteType = .no
        $0.searchTextField.smartQuotesType = .no
        $0.searchTextField.spellCheckingType = .no
        return $0
    }(UISearchBar(frame: .zero))
    
    let separatorImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .separator
        return $0
    }(UIImageView(frame: .zero))
    
    let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.isLayoutMarginsRelativeArrangement = true
        $0.backgroundColor = .systemBackground
        return $0
    }(UIStackView(frame: .zero))
    
    private(set) lazy var searchCancelButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Отмена", for: .normal)
        return $0
    }(UIButton(type: .system))
    
    let hideBackgroundImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemBackground
        return $0
    }(UIImageView(frame: .zero))
    
    override func safeAreaInsetsDidChange() {
        super.safeAreaInsetsDidChange()
        stackView.layoutMargins = .init(top: directionalLayoutMargins.leading,
                                        left: directionalLayoutMargins.leading,
                                        bottom: directionalLayoutMargins.trailing - 10.0,
                                        right: directionalLayoutMargins.trailing)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        bringSubviewToFront(stackView)
        bringSubviewToFront(hideBackgroundImageView)
        
        let stackTransformRange: ClosedRange<CGFloat>
        
        do {
            let lowerBound = -adjustedContentInset.top
            let range = lowerBound...(lowerBound + subtitle.frame.maxY)
            stackTransformRange = range
            
            if contentOffset.y <= range.lowerBound {
                // ...
            } else if contentOffset.y >= range.upperBound {
                stackView.transform = .init(translationX: 0.0, y: contentOffset.y - range.upperBound)
            } else {
                stackView.transform = .identity
            }
        }
        
        do {
            let lowerBound = stackTransformRange.upperBound
            let range = lowerBound...(lowerBound + directionalLayoutMargins.leading)
            
            if contentOffset.y <= range.lowerBound {
                separatorImageView.alpha = 0.0
            } else if contentOffset.y >= range.upperBound {
                separatorImageView.alpha = 1.0
            } else {
                separatorImageView.alpha = 1.0 - (range.upperBound - contentOffset.y) / (range.upperBound - range.lowerBound)
            }
        }
    }
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setupConstraints()
        keyboardDismissMode = .onDrag
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
        keyboardDismissMode = .onDrag
    }
}

extension ServiceCollectionView {
    
    private func setupConstraints() {
        addSubview(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subtitle)
        stackView.addSubview(separatorImageView)
        addSubview(hideBackgroundImageView)
        
        let searchBarContainerView: UIView = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        }(UIView(frame: .zero))
        searchBarContainerView.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: searchBarContainerView.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: searchBarContainerView.leadingAnchor, constant: -8.0),
            searchBarContainerView.trailingAnchor.constraint(greaterThanOrEqualTo: searchBar.trailingAnchor, constant: -8.0),
            searchBarContainerView.bottomAnchor.constraint(equalTo: searchBar.bottomAnchor),
        ])
        stackView.addArrangedSubview(searchBarContainerView)
        
        stackView.setCustomSpacing(5.0, after: title)
        stackView.setCustomSpacing(10.0, after: subtitle)
        
        NSLayoutConstraint.activate([
            hideBackgroundImageView.topAnchor.constraint(equalTo: frameLayoutGuide.topAnchor),
            hideBackgroundImageView.leadingAnchor.constraint(equalTo: frameLayoutGuide.leadingAnchor),
            frameLayoutGuide.trailingAnchor.constraint(equalTo: hideBackgroundImageView.trailingAnchor),
            hideBackgroundImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            
            
            stackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: frameLayoutGuide.leadingAnchor),
            frameLayoutGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            separatorImageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: separatorImageView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: separatorImageView.bottomAnchor),
            separatorImageView.heightAnchor.constraint(equalToConstant: 1.0 / UIScreen.main.scale),
        ])
    }
}

extension ServiceCollectionView: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.25, delay: 0.0) {
//
//        }
    }
}

extension ServiceViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let item = dataSource.itemIdentifier(for: indexPath),
          case .type2(let item2) = item
    else { return }
    
    let navigationController = UINavigationController(rootViewController: GeneralOrderInfoCollectionViewController(title: item2.title))
    navigationController.modalPresentationStyle = .fullScreen
    present(navigationController, animated: true)
  }
}
































/*
 @objc private func buttonClicked(){
 let searchView = SearchView()
 let navVC = UINavigationController(rootViewController: searchView)
 navVC.modalPresentationStyle = .fullScreen
 //    navVC.modalTransitionStyle = .flipHorizontal
 present(navVC, animated: true)
 
 }
 
 let  scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 20))
 scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1200)
 view.addSubview(scrollView)
 
 scrollView.backgroundColor = .white
 
 let contentView = UIView(frame: CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
 scrollView.addSubview(contentView)
 
 let h1 = UILabel(frame: CGRect(x: 20, y: 64, width: 335, height: 28))
 h1.text = "Центр Бытовых Услуг "
 h1.font = UIFont(name:"Gerbera-Bold", size: 24)
 contentView.addSubview(h1)
 
 let h2 = UILabel(frame: CGRect(x: 20, y: 97, width: 335, height: 20))
 h2.text = "Сервис по вызову мастера на дом"
 h2.font = UIFont(name: "Gerbera", size: 17)
 h2.textColor = UIColor.systemGray
 contentView.addSubview(h2)
 
 //MARK: Try add ui search view
 //  let serachVC = UISearchController(searchResultsController: ServiceViewController)
 
 let searchBar = UISearchBar(frame: CGRect(x: 10, y: 137, width: scrollView.frame.size.width - 20, height: 50))
 searchBar.placeholder = "Поиск услуги"
 searchBar.searchBarStyle = .minimal
 contentView.addSubview(searchBar)
 
 // MARK: buttons to searchView
 
 let button = UIButton(type: .system)
 button.setTitle("Все >", for: .normal)
 contentView.addSubview(button)
 button.snp.makeConstraints{ maker in
 maker.right.equalTo(contentView).inset(33)
 maker.left.equalTo(contentView).inset(384)
 }
 button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
 
 let button1 = UIButton(type: .system)
 button1.setTitle("Все >", for: .normal)
 contentView.addSubview(button1)
 button1.snp.makeConstraints{ maker in
 maker.right.equalTo(contentView).inset(33)
 maker.top.equalTo(contentView).inset(587)
 }
 button1.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
 
 let button2 = UIButton(type: .system)
 button2.setTitle("Все >", for: .normal)
 contentView.addSubview(button2)
 button2.snp.makeConstraints{ maker in
 maker.right.equalTo(contentView).inset(33)
 maker.top.equalTo(contentView).inset(793)
 }
 button2.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
 
 let button3 = UIButton(type: .system)
 button3.setTitle("Все >", for: .normal)
 contentView.addSubview(button3)
 button3.snp.makeConstraints{ maker in
 maker.right.equalTo(contentView).inset(33)
 maker.top.equalTo(contentView).inset(999)
 }
 button3.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
 
 */

