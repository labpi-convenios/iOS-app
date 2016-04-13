//
//  DetailContractTableViewCell.swift
//  PraQue
//
//  Created by Ludimila da Bela Cruz on 4/12/16.
//  Copyright © 2016 Ludimila da Bela Cruz. All rights reserved.
//

import UIKit

class DetailContractTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var proponentLabel: UILabel!
    @IBOutlet weak var transferValue: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var goalText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
