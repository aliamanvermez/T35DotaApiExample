//
//  HeroDetailsVC.swift
//  T35DotaApiExample
//
//  Created by NeonApps on 23.09.2022.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
        
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class HeroDetailsVC: UIViewController {
    var heroName = UILabel()
    var heroAttribute = UILabel()
    var heroAttack = UILabel()
    var heroLegs = UILabel()
    var heroImg = UIImageView()
    
    var hero : HeroStats?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createHero()
        

    }
    
    
    func createHero() {
        setDefaultSize(view: view)
        heroName.frame = CGRect(x: 0.2 * screenWidth, y: 0.3 * screenHeight, width: 0.6 * screenWidth, height: 50)
        heroAttribute.frame = CGRect(x: 0.2 * screenWidth, y: 0.4 * screenHeight, width: 0.6 * screenWidth, height: 50)
        heroAttack.frame = CGRect(x: 0.2 * screenWidth, y: 0.5 * screenHeight, width: 0.6 * screenWidth, height: 50)
        heroLegs.frame = CGRect(x: 0.2 * screenWidth, y: 0.6 * screenHeight, width: 0.6 * screenWidth, height: 50)
        heroImg.frame = CGRect(x: 0.2 * screenWidth, y: 0.1 * screenHeight, width: 0.6 * screenWidth, height: 100)
        
        
        if let hero = hero {
            heroName.text = hero.localized_name
            heroAttack.text = hero.attack_type
            heroLegs.text = "\(hero.legs)"
            heroAttribute.text = hero.primary_attr
        }
   
        let imgUrl = "https://api.opendota.com" + (hero?.img)!
        heroImg.downloaded(from: imgUrl)
        print(imgUrl)
        
        view.addSubview(heroName)
        view.addSubview(heroAttribute)
        view.addSubview(heroAttack)
        view.addSubview(heroLegs)
        view.addSubview(heroImg)



    }
    

  
}


