//
//  Onboarding.swift
//  SB-Santehnik-App
//
//  Created by Daria on 19.01.2022.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!

    var slides:  [OnboardingSlide] = [ ]
    var currentPage = 0 {
        didSet {
          
            pageControl.currentPage = currentPage
            if  currentPage == slides.count -  1 {
                nextButton.setTitle("Поехали!", for: .normal)
            }  else  { nextButton.setTitle("Далее", for: .normal)
                
            }
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // collectionView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        

       
        
        
        slides = [
            OnboardingSlide(title: "Центр Бытовых Услуг", description: "Сервис помощи по вопросам сантехники,\n засоров,  электрики и мелкого ремонта", image: UIImage(named: "onboarding1")!),
            OnboardingSlide(title: "Быстро и удобно", description: "Бесплатный приезд и оценка стоимости \n мастером в течение 45 минут", image: UIImage(named: "onboarding2")!),
                   OnboardingSlide(title: "Проверено", description: "Более 9 лет опыта работы в сфере \n сантехники", image: UIImage(named: "onboarding3")!),
                   OnboardingSlide(title: "Надежно", description: "Предоставляем гарантию на все виды \n услуг до 3 лет", image: UIImage(named: "onboarding4")!)
                   
                   
        ]
         
        
        nextButton.layer.cornerRadius = 30
        
    }
    
    
    @IBAction func nextButtonClicked(_ sender: UIButton)
    {
        
        
        
        if currentPage == slides.count - 1 {
            
//            let vc  = ServiceViewController()
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true, completion: nil)
            
            
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") else {
                preconditionFailure()
            }
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
            /*    let controller = storyboard?.instantiateViewController(withIdentifier: "Auth") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
            
            */ //Потом обязательно вернуть этот блок - переход на авторизацию
            
            
            
        }  else {
            currentPage += 1
            collectionView.setContentOffset(.init(x: currentPage * Int(collectionView.bounds.width), y: 0), animated: true)
        }
       
        
    }
    
    }
extension OnboardingViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    //MARK: size
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  collectionView .frame.size.width , height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x/width)
        pageControl.currentPage = currentPage
    }
    

    
    
    
}

/*  let button2 = UIButton(type: .system)
 button2.setTitle("Все >", for: .normal)
 contentView.addSubview(button2)
 button2.snp.makeConstraints{ maker in
     maker.right.equalTo(contentView).inset(33)
     maker.top.equalTo(contentView).inset(793)
 }
 
  let h6 = UILabel(frame: CGRect(x: 20, y: 999, width: 335, height: 28))
  h6.text = "Мастер на час"
  h6.font = UIFont(name: "Gerbera-Bold", size: 24)
  contentView.addSubview(h6)
 */
