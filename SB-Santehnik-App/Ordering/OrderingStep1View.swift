//
//  OrderingStep1View.swift
//  SB-Santehnik-App
//
//  Created by Daria on 01.12.2021.
//
import Photos
import PhotosUI
import UIKit
import Foundation
import QuartzCore


class MyCell: UICollectionViewCell {
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame =  bounds
    }
}

class OrderingStep1View: UIViewController, UITextFieldDelegate, PHPickerViewControllerDelegate, UICollectionViewDataSource, UITextViewDelegate

{

    
    
    //MARK: Collection
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 120)
        let c = UICollectionView(frame: .zero, collectionViewLayout: layout)
        c.register(MyCell.self, forCellWithReuseIdentifier: "cell")
        
        return c
    }()
    
    /* init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .white
        delegate = self
        dataSource = self
        register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: CarouselCollectionViewCell.reuseID)
        
        translatesAutoresizingMaskIntoConstraints = false
    } */
    
    var services : Services!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        view.backgroundColor = .white
        view.addSubview(collectionView)
        

       collectionView.snp.makeConstraints{maker in
           maker.left.right.equalToSuperview()
           maker.top.equalToSuperview().inset(430)
           collectionView.heightAnchor.constraint(equalToConstant:120).isActive = true
           
       }
        collectionView.dataSource = self
        collectionView.frame = view.bounds
        collectionView.layer.cornerRadius = 15
    
     //   let contentView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
    //    view.addSubview(contentView)
        
        let h1 = UILabel()
        h1.text = "Общие данные заказа"
        h1.font = UIFont (name:"Gerbera-Medium", size: 24)
            view.addSubview(h1)
            h1.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(20)
            maker.top.equalToSuperview().inset(122)
            }
        let h2 = UILabel()
        h2.text = "Опишите задачу"
        h2.font = UIFont(name: "Gerbera", size: 16)
                view.addSubview(h2)
                h2.snp.makeConstraints{ maker in
                    maker.left.equalToSuperview().inset(20)
                    maker.top.equalToSuperview().inset(170)
                }
                
        let h3 = UILabel()
        h3.text = "Фотографии"
        h3.font = UIFont(name: "Gerbera", size: 16)
                view.addSubview(h3)
                h3.snp.makeConstraints{ maker in
                    maker.left.equalToSuperview().inset(20)
                    maker.top.equalToSuperview().inset(378)
                }
        
        let photoCountLabel = UILabel()
                photoCountLabel.text = "0/10"
                photoCountLabel.font = UIFont(name: "Gerbera", size: 16)
                photoCountLabel.textColor = .lightGray
                view.addSubview(photoCountLabel)
                photoCountLabel.snp.makeConstraints{ maker in
                    maker.left.equalToSuperview().inset(120)
                    maker.top.equalToSuperview().inset(378)
                }
                
        let h4 = UILabel()
        h4.text = "Фото нужны для более точной предварительной оценки стоимости"
        h4.font = UIFont(name: "Gerbera", size: 16)
                h4.textColor = .lightGray
                view.addSubview(h4)
                h3.snp.makeConstraints{ maker in
                maker.left.equalToSuperview().inset(20)
                maker.top.equalToSuperview().inset(521)
                        }
                
                let addButton = UIButton(type: .system)
                addButton.setTitle("Добавить фотографии", for: .normal)
                view.addSubview(addButton)
                addButton.snp.makeConstraints{ maker in
                    maker.left.equalToSuperview().inset(20)
                    maker.top.equalToSuperview().inset(398)
                }
                addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
   
                
        
                
        let orderDescriptionTextField = UITextView()
              //  orderDescriptionTextField.placeholder = "Чем точнее описание - тем быстрее мы сможем обработать заявку"
                orderDescriptionTextField.font = UIFont(name: "Gerbera", size: 16)
                orderDescriptionTextField.textColor = .gray
              //  orderDescriptionTextField.borderStyle = .roundedRect
                orderDescriptionTextField.backgroundColor = .systemGray3
       //         orderDescriptionTextField.clearButtonMode = UITextField.ViewMode.whileEditing
                orderDescriptionTextField.delegate = self
                orderDescriptionTextField.layer.borderColor = UIColor.lightGray.cgColor
                orderDescriptionTextField.layer.borderWidth = 1
                orderDescriptionTextField.layer.cornerRadius = 15
                orderDescriptionTextField.layer.backgroundColor = UIColor.systemGray4.cgColor
                orderDescriptionTextField.backgroundColor = .lightText
                orderDescriptionTextField.maximumContentSizeCategory = nil
                orderDescriptionTextField.isHidden = !orderDescriptionTextField.text.isEmpty
                
                func textViewDidChange(_ textView: UITextView) {
                    
                        orderDescriptionTextField.isHidden = !orderDescriptionTextField.text.isEmpty
                    }
                
                view.addSubview(orderDescriptionTextField)
                orderDescriptionTextField.snp.makeConstraints{ maker in
                    maker.left.equalToSuperview().inset(20)
                    maker.top.equalToSuperview().inset(198)
                    maker.width.equalTo(335)
                    maker.height.equalTo(150)
                    
                }
                
        
        let button = UIButton(type: .system)
        button.setTitle("Выбрать адрес", for: .normal)
        view.addSubview(button)
        button.snp.makeConstraints{ maker in
            maker.left.equalToSuperview().inset(20)
            maker.top.equalToSuperview().inset(652)
        }
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }

    @objc private func buttonClicked(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "Step2") as! UIViewController
        
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
           //     orderDescriptionTextField.text = "Здраствуйте, "
            //    orderDescriptionTextField.textColor = UIColor.lightGray

               
           
        
    
    }
    

    // MARK: - Table view data source

    @objc private func addButtonClicked() {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 3
        config.filter = .images
        let vc = PHPickerViewController(configuration: config)
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        
        let group = DispatchGroup()
        results.forEach { result in
            group.enter()
            result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] reading, error in
                defer {
                    group.leave()
                }
                guard let image = reading as? UIImage, error == nil else {
                    return
                }
                self?.images.append(image)
            }
        }
        group.notify(queue: .main) {
            print(self.images.count)
            self.collectionView.reloadData()

        }
     
    }
    
    private var images = [UIImage]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MyCell else {fatalError()
        
        }
        
        cell.imageView.image = images[indexPath.row]
        
        
        return cell
        
    }

    
    
}


