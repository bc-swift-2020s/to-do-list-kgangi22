//
//  ListTableViewCell.swift
//  ToDo List
//
//  Created by Kyle Gangi on 3/4/20.
//  Copyright © 2020 Kyle Gangi. All rights reserved.
//

import UIKit

protocol ListTableViewCellDelegate: class {
    func checkBoxToggle(sender: ListTableViewCell)
}

class ListTableViewCell: UITableViewCell {
    
    weak var delegate: ListTableViewCellDelegate?
    
    
    
    @IBOutlet weak var checkBoxButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func checkToggled(_ sender: UIButton) {
        
        delegate?.checkBoxToggle(sender: self)
    }
        
        
    }

