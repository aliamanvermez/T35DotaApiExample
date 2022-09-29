//
//  ViewController.swift
//  T35DotaApiExample
//
//  Created by NeonApps on 23.09.2022.
//

import UIKit

class ViewController: UIViewController {
    var heroTableView = UITableView()
    var heroes = [HeroStats]()
    var hero : HeroStats?
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultSize(view: view)
        view.backgroundColor = .white


        downloadJSON {
            self.createTableView()
           self.heroTableView.reloadData()
            print("succes")
        }
    }
    
   func createTableView(){
       heroTableView.delegate = self
       heroTableView.dataSource = self
       heroTableView.frame = CGRect(x: 0, y: 0 * screenHeight, width: 1 * screenWidth, height: 1*screenHeight)
       view.addSubview(heroTableView)
       
    }
    
    @objc func reloadCollections(){
        
    }
    

}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let hero = heroes[indexPath.row]
        let iconUrlstr = "https://api.opendota.com" + hero.icon
        cell.imageView!.downloaded(from: iconUrlstr)
        cell.textLabel?.text = hero.localized_name.capitalized
        cell.detailTextLabel?.text = hero.primary_attr.capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        let destinationVC = HeroDetailsVC()
        destinationVC.hero = heroes[indexPath.row]
        present(destinationVC, animated: true)
      
    }
    
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        
        URLSession.shared.dataTask(with: url!) { data, response, err in
            
            if err == nil {
                
                do {
                    self.heroes = try JSONDecoder().decode([HeroStats].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }
                catch {
                    print("error fetching data from api")
                }
            }
        }.resume()
    }
}
        

