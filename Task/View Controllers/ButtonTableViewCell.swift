//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Jason Mandozzi on 6/19/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import UIKit

@IBDesignable

class ButtonTableViewCell: UITableViewCell {
    
    var delegate: ButtonTableViewCellDelegate?

    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        delegate?.buttonCellButtonTapped(self)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    fileprivate func updateButton(_ isComplete: Bool) {
        if isComplete {
        completeButton.setImage(UIImage(named: "complete"), for: .normal)
    } else {
        completeButton.setImage(UIImage(named: "incomplete"), for: .normal)
        }
    }
}

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}

extension ButtonTableViewCell {
    func update(withTask task: Task) {
    primaryLabel.text = task.name
    updateButton(task.isComplete)
        }
}

