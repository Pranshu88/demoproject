//  tabController.swift
//  mailbox
//  Created by apple on 19/05/22.

import UIKit

class tabController: UIViewController {
    
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var tabTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tabTableView.tableFooterView = UIView(frame: .zero)
        tabTableView.register(UINib(nibName: "upperCell", bundle: nil), forCellReuseIdentifier: "upperCell")
        
        tabTableView.register(UINib(nibName: "bottomCell", bundle: nil), forCellReuseIdentifier: "bottomCell")
        
        self.topCollectionView.register(UINib(nibName: "topCollectionCell", bundle: Bundle.main), forCellWithReuseIdentifier: "topCollectionCell")
        
    }
}

//***************** Collection View delegates ***************
extension tabController : UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "topCollectionCell", for: indexPath) as! topCollectionCell
        cell.topimageview.image = UIImage(named: "story")
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80 , height: 80)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        
    }
}

//MARK:- UITableViewDelegate , UITableViewDataSource
extension tabController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "upperCell", for: indexPath as IndexPath) as! upperCell
            cell.selectionStyle = .none
            return cell
            
        }  else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "bottomCell", for: indexPath as IndexPath) as! bottomCell
            cell.bottombtn.layer.borderWidth = 1
            cell.bottombtn.layer.borderColor = UIColor.lightGray.cgColor
            cell.bottombtn.layer.cornerRadius = 8.0
            cell.bottombtn2.layer.borderWidth = 1
            cell.bottombtn2.layer.borderColor = UIColor.lightGray.cgColor
            cell.bottombtn2.layer.cornerRadius = 8.0
            cell.selectionStyle = .none
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return 150
            
        } else {
            return 310
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let hearderView: UIView = UIView()
        hearderView.backgroundColor = UIColor.clear
        return hearderView
        
    }
}
