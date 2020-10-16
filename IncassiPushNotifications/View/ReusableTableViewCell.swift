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
    
    var id: Int = Int()
    var datas = dataModel.sharedData
    
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
            for i in 0...datas.stores.count-1 {
                if datas.stores[i].id == self.id {
                    datas.stores[i].onNotifications = true
                    datas.stores[i].treshold = Int(self.tresholdSlider.value)
                    break
                }
            }
        } else {
            self.tresholdSlider.isEnabled = true
            for i in 0...datas.stores.count-1 {
                if datas.stores[i].id == self.id {
                    datas.stores[i].onNotifications = false
                    datas.stores[i].treshold = 1
                    break
                }
            }

        }
    }
    
    @IBAction func valueChanged(_ sender: UISlider) {
        self.tresholdLabel.text = String(format: "%i",Int(sender.value))
    }

}
