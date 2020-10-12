//
//  NestedTableViewCell.swift
//  ImpostazioniPushNotifications
//
//  Created by Lorenzo Ilardi on 12/10/2020.
//

import UIKit

class NestedTableViewCell: UITableViewCell {

    @IBOutlet weak var nestedtableViewCell: SettingsFormView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
