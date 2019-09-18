//
//  FormTableViewCell.swift
//  Exp
//
//  Created by Ernest Gaisie on 12/09/2019.
//  Copyright © 2019 Ernest Gaisie. All rights reserved.
//

import UIKit

class FormTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var mainView: UIView!
 
    @IBOutlet weak var longName: UILabel!
    @IBOutlet weak var shortName: UILabel!
    @IBOutlet weak var buyingPrice: UILabel!
    @IBOutlet weak var sellingPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        imgView.layer.cornerRadius = imgView.frame.size.width/2
        imgView.clipsToBounds = true
        
        ExpandingCell.sharedInstance.viewRounding(radius: 10, view: mainView)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
