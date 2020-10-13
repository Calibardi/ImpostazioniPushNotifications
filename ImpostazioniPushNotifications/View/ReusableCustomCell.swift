//
//  ReusableCustomCell.swift
//  ImpostazioniPushNotifications
//
//  Created by Lorenzo Ilardi on 13/10/2020.
//

import UIKit

class ReusableCustomCell: UITableViewCell {

    @IBOutlet weak var treshold: UISlider!
    @IBOutlet weak var notificationSwitch: UISwitch!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var selectionArrow: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
