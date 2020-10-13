//
//  SettingsViewController.swift
//  ImpostazioniPushNotifications
//
//  Created by Lorenzo Ilardi on 13/10/2020.
//

import UIKit

//MARK: - Custom Cell
class tempCustomCell: UITableViewCell {
    @IBOutlet weak var selectionArrow: UIImageView!
}
//MARK: - Controller
class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    MARK: - Proprietà
    @IBOutlet weak var tableViewSemplice: UITableView!
//    MARK: - Metodi
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewSemplice.delegate = self
        self.tableViewSemplice.dataSource = self
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tempCustomCella", for: indexPath)
            as! tempCustomCell
        
        cell.selectionArrow.image = UIImage(systemName: "chevron.right")
        cell.selectionArrow.tintColor = UIColor.gray
        cell.textLabel?.text = "Impostazioni di notifica"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewSemplice.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
