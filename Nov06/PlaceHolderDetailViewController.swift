//
//  PlaceHolderDetailViewController.swift
//  Nov06
//
//  Created by Kun Niu on 11/6/22.
//

import UIKit

protocol DismissDelegate: AnyObject {
    func dismissViewController(text: String?)
}

class PlaceHolderDetailViewController: UIViewController {
    
    var nameString : String?
    
    
    var delegate: DismissDelegate?
    
    lazy var progImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGreen
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "question-mark")
//        imageView.heightAnchor.constraint(equalTo: 300).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        return imageView
    }()
    
    lazy var progTopLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemCyan
        label.numberOfLines = 0
        label.text = "Top"
        return label
    }()
    
    lazy var progMidLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemYellow
        label.numberOfLines = 0
        label.text = "Middle"
        return label
    }()

    lazy var progBottomLabel: UIButton = {
        let label = UIButton(frame: .zero)
        label.setTitle("click", for: .normal)
//        let label = UILabel(frame: .zero)
//        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemPink
//        label.numberOfLines = 0
//        label.text = "Bottom"
        return label
    }()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        view.addSubview(progImageView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(progImageView)
        view.addSubview(progTopLabel)
        
//        print(self.nameString ?? "None")
//        self.name.text = self.nameString
//        self.type.text = self.nameString
        // Do any additional setup after loading the view.pr
    }
    func configure(name: String){
        self.progImageView.image = UIImage(named: name)
//        self.progTopLabel.text = name
        self.view.backgroundColor = .systemGray6
        self.progImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.progImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.progImageView.bottomAnchor.constraint(equalTo: self.progTopLabel.topAnchor, constant: -8).isActive = true
        self.progImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        self.progTopLabel.text = name
        self.progTopLabel.topAnchor.constraint(equalTo: self.progImageView.bottomAnchor, constant: 8).isActive = true
        self.progTopLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.progTopLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8).isActive = true
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
