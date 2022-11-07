//
//  ViewController.swift
//  Nov06
//
//  Created by Kun Niu on 11/6/22.
//


import UIKit

class ViewController: UIViewController, DismissDelegate {
    func dismissViewController(text: String?) {
        
        self.dismiss(animated: true, completion: nil)
    }
    

    var tableView: UITableView?
    
    var data: [String] = ["Ralph", "Buddy", "Violet", "Kevin", "Goleat", "Carlos"]
    var name: [String] = ["ASHE","CAITLYN","EZREAL","GAREN","HECARIM","JAX","JINX","KAISA","KAYLEMKOGMAW","LEBLANC","LUCIAN","MASTERYI","MORDEKAISER","NAMI","NASUS","NOCTURNE","NUNU","OLAF","RAMMUS","RUMBLE","SHACO","TEEMO","TRISTANA","TRUNDLE","TRYNDAMERE","TWITH","VAYNE","VEIGAR","VI","XAYAH"]
    var index : Int?
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.setUpUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setUpUI() {
        self.view.backgroundColor = .systemBlue
        self.title = "Programmatic Example"
        
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemRed
        table.dataSource = self
        table.delegate = self
        // Register Cell
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "SampleCell")
        table.register(ProgrammaticTableViewCell.self, forCellReuseIdentifier: "ProgCell")
        
        // Add View To View Hierarchy
        self.view.addSubview(table)
        
        table.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        table.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        table.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        table.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
//        self.view.trailingAnchor.constraint(equalTo: table.trailingAnchor, constant: 8).isActive = true
//        self.view.bottomAnchor.constraint(equalTo: table.bottomAnchor, constant: 8).isActive = true
        
        
        // Alt Approach
//        let topConstraint = table.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8)
//        let leadingConstraint = table.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8)
//        let trailingConstraint = table.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8)
//        let bottomConstraint = table.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -8)
//        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
        
        
        self.tableView = table
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print("prepare")
//        let detail = segue.destination as?  PlaceHolderDetailViewController
//        detail?.nameString = name[index ?? 0]
//        detail?.delegate = self
//    }

    
    


}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProgCell", for: indexPath) as? ProgrammaticTableViewCell else {
            fatalError("Whoops, something went wrong")
        }
        cell.configure(img: "BlueEyes", top: name[indexPath[1]])
        
        return cell    }

    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        let placeholderVC = PlaceHolderDetailViewController()
//        placeholderVC.nameString = name[index ?? <#default value#>]
        
        self.index = indexPath[1]
        placeholderVC.configure(name: name[index ?? 0])
        self.navigationController?.pushViewController(placeholderVC, animated: true)
    }
    
}

