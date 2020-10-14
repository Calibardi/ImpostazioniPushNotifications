//
//  ListaReparti.swift
//  ImpostazioniPushNotifications
//
//  Created by Lorenzo Ilardi on 12/10/2020.
//

import UIKit

//MARK: - Controller
class ListaReparti: UITableViewController {
    
//    MARK: - Attributi
    let reparti = dataModel.sharedData.reparti
    var selectedIndex = -1
    var isCollapse = false
    
//    MARK: - Metodi
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorColor = UIColor.clear
        //        tableView.rowHeight = 100.0
        tableView.estimatedRowHeight = 248
        tableView.rowHeight = UITableView.automaticDimension
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reparti.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepartoCell", for: indexPath)
            as! ReusableCustomCell
        
        // Configure the cell...
        cell.nameLabel.text = reparti[indexPath.row].name
        cell.selectionArrow.image = UIImage(systemName: "chevron.down")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Lista Reparti"
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.selectedIndex == indexPath.row && self.isCollapse == true {
            return 112
        } else {
            return 50
        }
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if selectedIndex ==  indexPath.row {
            if self.isCollapse == false {
                self.isCollapse = true
            } else {
                self.isCollapse = false
            }
        } else {
            self.isCollapse = true
        }
        self.selectedIndex = indexPath.row
        tableView.beginUpdates()
        tableView.endUpdates()
//        performSegue(withIdentifier: "showDetailedSettings", sender: self)
    }
    
}
