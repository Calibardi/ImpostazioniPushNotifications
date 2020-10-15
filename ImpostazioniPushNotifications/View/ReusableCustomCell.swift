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
    var id: Int = Int()
    var datas = dataModel.sharedData
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func switchChangeVal(_ sender: UISwitch) {
        if self.notificationSwitch.isOn == true {
            print(self.treshold.value)
            self.treshold.isEnabled = false
            for i in 0...datas.reparti.count-1 {
                if datas.reparti[i].id == self.id {
                    datas.reparti[i].onNotifications = true
                    datas.reparti[i].treshold = Int(self.treshold.value)
                    break
                }
            }
        } else {
            self.treshold.isEnabled = true
            for i in 0...datas.reparti.count-1 {
                if datas.reparti[i].id == self.id {
                    datas.reparti[i].onNotifications = false
                    datas.reparti[i].treshold = 1
                    break
                }
            }
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
