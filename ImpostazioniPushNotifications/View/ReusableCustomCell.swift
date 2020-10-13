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
    @IBOutlet weak var tresholdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func switchChangeVal(_ sender: UISwitch) {
        if self.notificationSwitch.isOn == true {
            print(self.treshold.value)
            self.treshold.isEnabled = false
        } else {
            self.treshold.isEnabled = true
        }
    }
    
    @IBAction func valueChanged(_ sender: UISlider) {
        self.tresholdLabel.text = String(format: "%i",Int(sender.value))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
