//
//  SpecialTableViewCell.swift
//  TableView
//
//  Created by apple on 2019/7/15.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class SpecialTableViewCell: UITableViewCell
{

    @IBOutlet weak var specialImageView: UIImageView!
    
    
    @IBOutlet weak var spcialLabel: UILabel!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
