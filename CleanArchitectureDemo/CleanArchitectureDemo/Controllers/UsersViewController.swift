//
//  UsersViewController.swift
//  CleanArchitectureDemo
//
//  Created by Tien Le P. VN.Danang on 3/12/24.
//

import UIKit

class UsersViewController: UIViewController, UsersView {
    
    @IBOutlet weak var tableview: UITableView!
    var users: [UserViewModel] = []

    var usersPresenter: UsersPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        // View config
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.delegate = self
        tableview.dataSource = self
        
        self.title = "List"
        
        // Get Users List
        usersPresenter?.loadUsers()

    }
    
    // MARK: UsersView
    func displayUsers(_ users: [UserViewModel]) {
        print(users)
        self.users = users
        tableview.reloadData()
    }
    
    func displayError(_ message: String) {
        
    }
    
}

// MARK: UITableView Delegate & DataSource
extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier")
    
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CellIdentifier")
        }
        
        let user = users[indexPath.row]
        cell?.textLabel?.text = user.name
        cell?.detailTextLabel?.text = user.email
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        print("did select row at index: \(indexPath.row)")
        usersPresenter?.didSelectUser(users[indexPath.row])
    }
}
