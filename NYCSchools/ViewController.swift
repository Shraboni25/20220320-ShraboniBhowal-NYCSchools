//
//  ViewController.swift
//  NYCSchools
//
//  Created by Shraboni on 3/18/22.
//

import UIKit

class TableViewController: UITableViewController {
    
    let dataLoader = DataLoader.shared
    //Activity indicator
    var activityView = UIActivityIndicatorView(style: .medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
        dataLoader.load { [weak self] in
            
            if $0 {
                DispatchQueue.main.async {
                    self?.activityView.stopAnimating()
                    self?.activityView.removeFromSuperview()
                    self?.tableView.reloadData()
                }
                
            } else {
                DispatchQueue.main.async {
                    self?.presentAlert("Something went Wrong", message: "Failed fetching data")
                    self?.activityView.stopAnimating()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "default_cell") else {
                return UITableViewCell(style: .default, reuseIdentifier: "default_cell")
            }
            var config = cell.defaultContentConfiguration()
            config.text = dataLoader.schools[indexPath.row].name
            cell.contentConfiguration = config
            return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleSelection(indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
            return dataLoader.schools.count
    }
    
    
    func handleSelection(indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "NYCSchoolDetailViewController") as? NYCSchoolDetailViewController else {
            presentAlert("Oops..", message: "Something Went Wrong")
            return
        }
        vc.school = dataLoader.schools[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

