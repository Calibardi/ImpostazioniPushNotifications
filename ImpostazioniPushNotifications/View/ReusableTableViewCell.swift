//
//  ReusableTableViewCell.swift
//  ImpostazioniPushNotifications
//
//  Created by Lorenzo Ilardi on 14/10/2020.
//

import UIKit

class ReusableTableViewCell: UITableViewCell {
//MARK: - Outlets e Attributi
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tresholdLabel: UILabel!
    @IBOutlet weak var notificationSwitch: UISwitch!
    @IBOutlet weak var tresholdSlider: UISlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func switchChangeVal(_ sender: UISwitch) {
        if self.notificationSwitch.isOn == true {
            print(self.tresholdSlider.value)
            self.tresholdSlider.isEnabled = false
        } else {
            self.tresholdSlider.isEnabled = true
        }
    }
    
    @IBAction func valueChanged(_ sender: UISlider) {
        self.tresholdLabel.text = String(format: "%i",Int(sender.value))
    }

}
