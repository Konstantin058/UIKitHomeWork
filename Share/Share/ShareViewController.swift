//
//  ViewController.swift
//  Share
//
//  Created by Константин Евсюков on 25.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let titleLebel = UILabel()
    private let titleModelLabel = UILabel()
    
    private var segmentControllerColorModel = UISegmentedControl()
    private var segmentControllerMemoryModel = UISegmentedControl()
    
    private var imageView = UIImageView()
    let imageArray = [UIImage(named: "iPhone13Red"),
                      UIImage(named: "iPhone13White"),
                      UIImage(named: "iphone13Black")]

    private var titleModelColorSegment = ["red", "white", "black"]
    private var titleMemoryModelSegment = ["128GB", "256GB", "512GB"]
    
    private let byuButton = UIButton()
    private let shareButton = UIButton()
    
    var shareModelView: UIActivityViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLabel()
        createImageView()
        createSegmentControl()
        createButtons()
        addSubViews()
        makeConstraints()
        
    }
    
    func createLabel() {
        titleLebel.text = "re:Store"
        titleLebel.font = .boldSystemFont(ofSize: 30)
        titleLebel.textColor = .black
        titleLebel.textAlignment = .center
        titleLebel.layer.shadowOpacity = 5
        titleLebel.layer.shadowColor = UIColor.red.cgColor
        
        titleModelLabel.text = "Apple iPhone 13"
        titleModelLabel.font = .boldSystemFont(ofSize: 17)
        titleModelLabel.textColor = .black
        titleModelLabel.textAlignment = .center
    }
    
    func createImageView() {
        imageView.image = imageArray[0]
    }
    
    func createSegmentControl() {
        segmentControllerColorModel = UISegmentedControl(items: titleModelColorSegment)
        segmentControllerColorModel.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
        
        segmentControllerMemoryModel = UISegmentedControl(items: titleMemoryModelSegment)
        segmentControllerMemoryModel.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
    }
    
    @objc func selectedValue(target: UISegmentedControl) {
        if target == segmentControllerColorModel {
            let segmentIndex = target.selectedSegmentIndex
            imageView.image = imageArray[segmentIndex]
           let pr = target.titleForSegment(at: segmentIndex)
            print(pr ?? "")
        }
        
        if target == segmentControllerMemoryModel {
            let segmentIndex = target.selectedSegmentIndex
           let pr = target.titleForSegment(at: segmentIndex)
            print(pr ?? "")
        }
    }
    
    func createButtons() {
        byuButton.setTitle("Buy", for: .normal)
        byuButton.setTitleColor(.black, for: .normal)
        byuButton.layer.cornerRadius = 5
        byuButton.layer.borderWidth = 1
        byuButton.addTarget(self, action: #selector(confirmOrder), for: .touchUpInside)
        
        shareButton.setTitle("Share", for: .normal)
        shareButton.setTitleColor(.black, for: .normal)
        shareButton.layer.cornerRadius = 5
        shareButton.layer.borderWidth = 1
        shareButton.addTarget(self, action: #selector(shareAction), for: .touchUpInside)
    }
    
    @objc func confirmOrder(sender: UIButton) {
        if sender.isEnabled == true {
            
            let message = "\(titleModelLabel.text!) \(titleModelColorSegment[segmentControllerColorModel.selectedSegmentIndex]) \(titleMemoryModelSegment[segmentControllerMemoryModel.selectedSegmentIndex])"
            let allertController = UIAlertController(title: "Ваш заказ подтвержден", message: message, preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Confirm", style: .default, handler: nil)
            let action2 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            allertController.addAction(action1)
            allertController.addAction(action2)
            
            self.present(allertController, animated: true, completion: nil)
        }
    }
    
    @objc func shareAction(sender: UIButton) {
        let shareContent = ["Write your share content"]
        let activityController = UIActivityViewController(activityItems: shareContent, applicationActivities: nil)
        activityController.excludedActivityTypes = [.postToWeibo, .assignToContact]
        self.present(activityController, animated: true, completion: nil)
    }

}

//MARK - exstension
private extension ViewController {
    
    func addSubViews() {
        [titleLebel, imageView, segmentControllerColorModel, segmentControllerMemoryModel, titleModelLabel, byuButton, shareButton].forEach {
            view.addSubview($0)
        }
    }
    
    func makeConstraints() {
        [titleLebel, imageView, segmentControllerColorModel, segmentControllerMemoryModel, titleModelLabel, byuButton, shareButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLebel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            titleLebel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLebel.widthAnchor.constraint(equalToConstant: 200),
            titleLebel.heightAnchor.constraint(equalToConstant: 30),
            titleLebel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -5),
            
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.bottomAnchor.constraint(equalTo: titleModelLabel.topAnchor, constant: 0),
            
            titleModelLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleModelLabel.widthAnchor.constraint(equalToConstant: 250),
            titleModelLabel.heightAnchor.constraint(equalToConstant: 20),
            titleModelLabel.bottomAnchor.constraint(equalTo: segmentControllerColorModel.topAnchor, constant: -10),
            
            segmentControllerColorModel.widthAnchor.constraint(equalToConstant: 150),
            segmentControllerColorModel.heightAnchor.constraint(equalToConstant: 30),
            segmentControllerColorModel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            segmentControllerColorModel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            segmentControllerColorModel.bottomAnchor.constraint(equalTo: segmentControllerMemoryModel.topAnchor, constant: 0),
            
            segmentControllerMemoryModel.widthAnchor.constraint(equalToConstant: 150),
            segmentControllerMemoryModel.heightAnchor.constraint(equalToConstant: 30),
            segmentControllerMemoryModel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            segmentControllerMemoryModel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            segmentControllerMemoryModel.bottomAnchor.constraint(equalTo: byuButton.topAnchor, constant: -10),
            
            byuButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            byuButton.widthAnchor.constraint(equalToConstant: 100),
            byuButton.heightAnchor.constraint(equalToConstant: 30),
            byuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            
            shareButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            shareButton.widthAnchor.constraint(equalToConstant: 100),
            shareButton.heightAnchor.constraint(equalToConstant: 30),
            shareButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
    
}
