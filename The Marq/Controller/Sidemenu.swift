//
//  Sidemenu.swift
//  The Marq
//
//  Created by user on 05.07.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import UIKit

protocol MenuListControllerDelegate {
    func didSelectMenuItem(named: String)
}

class MenuListController: UITableViewController {
    

    public var delegate: MenuListControllerDelegate?
    
    
   private let menueItems: [String]
    
    init(with menuItems: [String]) {
        self.menueItems = menuItems
        super.init(nibName: nil, bundle: nil)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .lightGray
        view.backgroundColor = #colorLiteral(red: 0.1970336354, green: 0.1970336354, blue: 0.1970336354, alpha: 1)
        tableView.separatorStyle = .none
        
        
    }
    
   
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menueItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menueItems[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        // Relay to delegate about menu utem selection
        let selectedItem = menueItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
        
    }
    
}

