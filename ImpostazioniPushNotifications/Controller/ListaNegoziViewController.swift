//
//  ListaNegoziViewController.swift
//  ImpostazioniPushNotifications
//
//  Created by Lorenzo Ilardi on 13/10/2020.
//

import UIKit

class ListaNegoziViewController: UIViewController {
    //MARK: - Attributi
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblView: UITableView!
    
    var searchResults = [String]()
    var hasSearched: Bool = false
    var datas = dataModel.sharedData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.placeholder = "Ricerca negozi..."
        navigationItem.largeTitleDisplayMode = .never
        searchBar.showsCancelButton = true

        self.tblView.delegate = self
        self.tblView.dataSource = self
        self.searchBar.delegate = self
        
        let cellNib = UINib(nibName: "ReusableTableViewCell", bundle: nil)
        tblView.register(cellNib, forCellReuseIdentifier: "reusableTableViewCell")
        // Do any additional setup after loading the view.
    }
}
//MARK: - Estensioni
extension ListaNegoziViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchResults = []
        for i in 0...datas.stores.count - 1{
            if searchBar.text == datas.stores[i].name {
                searchResults.append(String(format: "%@", searchBar.text!))
            }
        }
        self.hasSearched = true
        tblView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchResults.removeAll()
        self.hasSearched = false
        tblView.reloadData()
    }
}

extension ListaNegoziViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !hasSearched {
            return datas.stores.count
        } else if searchResults.count == 0 {
            return 1
        } else {
            return searchResults.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier: String = "reusableTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ReusableTableViewCell
        
        if hasSearched{
            if searchResults.count == 0 {
                cell.nameLabel.text = "Nessun negozio trovato"
            } else {
                cell.nameLabel?.text = searchResults[indexPath.row]
            }
        } else {
            cell.nameLabel?.text = datas.stores[indexPath.row].name
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
