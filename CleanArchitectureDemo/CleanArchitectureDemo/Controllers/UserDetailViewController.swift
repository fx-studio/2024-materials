//
//  UserDetailViewController.swift
//  CleanArchitectureDemo
//
//  Created by Tien Le P. VN.Danang on 3/12/24.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Detail"
        
        if let user = user {
            nameLabel.text = user.name
            emailLabel.text = user.email
        }
    }

}
