//  ViewController.swift
//  mailbox
//  Created by apple on 19/05/22.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var homeArray = [" Item1 "," Item2 "," Item3 "," Item4 "," Item5 "," Item6 "," Item7 "," Item8 "," Item9 "]
    
    var filteredArray = [""]
    var searchActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        filteredArray = homeArray
        homeTableView.register(UINib(nibName: "homeTableCell", bundle: nil), forCellReuseIdentifier: "homeTableCell")
        
        searchBar.searchTextField.leftView?.tintColor = .black
        let textFieldInsideSearchBar = self.searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = UIColor.black
        
    }
}

//MARK:- UITableViewDelegate , UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return searchActive ? filteredArray.count : homeArray.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeTableCell", for: indexPath as IndexPath) as! homeTableCell
        let modelObj = searchActive == true ? filteredArray[indexPath.section] : homeArray[indexPath.section]
        cell.homeText.text = modelObj
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.selectionStyle = .none
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let hearderView: UIView = UIView()
        hearderView.backgroundColor = UIColor.clear
        return hearderView
        
    }
}


//********** Search Bar ****************
extension ViewController:  UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
        searchBar.showsCancelButton = false
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchActive = false;
        if filteredArray.count > 0 {
           // noResultsLabel.isHidden = true
            
        } else {
           // noResultsLabel.isHidden = false
            searchBar.text = nil
        }
        
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //noResultsLabel.isHidden = true
    
        filteredArray = searchText.isEmpty ? homeArray : homeArray.filter({ (friendObj) -> Bool in
            return friendObj.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        self.homeTableView.reloadData()
    }
}
