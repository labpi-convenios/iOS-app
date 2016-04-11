//
//  ReportTableViewCell.swift
//  PraQue
//
//  Created by Ludimila da Bela Cruz on 4/11/16.
//  Copyright © 2016 Ludimila da Bela Cruz. All rights reserved.
//

import UIKit

class ReportTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var imageReport: UIImageView!
    @IBOutlet weak var textViewReport: UITextView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
