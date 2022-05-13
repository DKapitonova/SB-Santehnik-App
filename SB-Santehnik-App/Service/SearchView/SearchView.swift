//
//  SearchViewTableViewController.swift
//  SB-Santehnik-App
//
//  Created by Daria on 01.12.2021.
//

import UIKit

class SearchView: UITableViewController {

    
    
    private let services = [ Services(price: "от 3500", service: "Замена душевой кабины"),
                     Services(price: "от 1500", service: "Установка инсталляции Geberit"),
                     Services(price: "от 2500", service: "Замена слива"),
                     Services(price: "от 5300", service: "Замена раковины"),
                     Services(price: "от 5000", service: "Замена мойки"),
                     Services(price: "от 2000", service: "Замена тэна в стиральной машине"),
                     Services(price: "от 2000", service: "Ремонт ванны"),
                     Services(price: "от 5000", service: "Установка инсталляции Geberit"),
                     Services(price: "от 2000", service: "Замена шаровых кранов"),
                     Services(price: "от 3000", service: "Установка мойки"),
                     Services(price: "от 3500", service: "Установка радиаторов отопления"),
                     Services(price: "от 1500", service: "Ремонт радиатора") ]
    
    
    let searchController = UISearchController(searchResultsController: nil)
    private var filteredServices = [Services]()

    
    
    private var searchBarisEmpty: Bool{
        guard let text = searchController.searchBar.text else {return false}
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarisEmpty
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setup the Search Controller
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(backItem))
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        
        

    }
// MARK: TABLE VIEW DATA SOURCE
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredServices.count
        }
        return services.count
    }
    
    /*    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ServiceCell else { return UITableViewCell() }
            
                   let  currentService = services[indexPath.row]
                
                
                cell.titleService.text = currentService.service
                cell.titlePrice.text = currentService.price
                 
                return cell
            } */
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for : indexPath)
        
        
        var service : Services
        
        if isFiltering{
            service = filteredServices[indexPath.row] }
        else {
            service = services[indexPath.row]
        }
        
        cell.textLabel?.text = service.service
        cell.detailTextLabel?.text = service.price
        
        let label = UILabel.init(frame: CGRect(x: 100,y:0,width:100,height:20))
        label.text = service.price
            cell.accessoryView = label
        
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let service: Services
                if isFiltering {
                    service = filteredServices[indexPath.row]
                } else {
                    service = services[indexPath.row]
                }
                let detailVC = segue.destination as! OrderingStep1View
                detailVC.services = services[indexPath.row]
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let ordering = OrderingStep1View()
      navigationController?.pushViewController(ordering, animated: true)
        ordering.modalPresentationStyle = .fullScreen
        ordering.modalTransitionStyle = .flipHorizontal
        
    
    }
            }


extension SearchView : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredServices = services.filter({  (services: Services) -> Bool in
            return services.service.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    @objc  private func backItem() {
        dismiss(animated: true, completion: nil)
    }

    
}
    

    

