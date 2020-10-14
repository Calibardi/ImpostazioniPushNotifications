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
        let cellIdentifier: String = "searchResultCell"
        var cell: UITableViewCell! = tblView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        if hasSearched{
            if searchResults.count == 0 {
                cell.textLabel?.text = "Nessun negozio trovato"
            } else {
                cell.textLabel?.text = searchResults[indexPath.row]
            }
        } else {
            cell.textLabel?.text = datas.stores[indexPath.row].name
        }
        return cell
        
    }
    
    
}
