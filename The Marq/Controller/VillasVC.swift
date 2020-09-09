//
//  VillasVC.swift
//  The Marq
//
//  Created by user on 05.07.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import UIKit

class VillasVC: UIViewController {
    
    var projectsArr: [Villas] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Villas"
        getData()
        print("villas CV")
        
    }
    
    func getData() {
        
        let project1 = Villas(name: "Town Villa 185", image: "Town Villa 185", deatImages: ["185", "185b", "185c", "185d", "185e"])
        let project2 = Villas(name: "Town Villa 200", image: "Town Villa 200", deatImages: ["200", "200b", "200c", "185d", "200e"])
        let project3 = Villas(name: "Town Villa 220", image: "Town Villa 220", deatImages: ["220", "185d", "220c", "220d"])
        let project4 = Villas(name: "Town Villa 220 V", image: "Town Villa 220 V", deatImages: ["220v", "220vb", "185d", "220vd-1"])
        let project5 = Villas(name: "Town Villa 230", image: "Town Villa 230", deatImages: ["230", "230b", "230c", "230d"])
        let project6 = Villas(name: "Town Villa 270", image: "Town Villa 270", deatImages: ["270", "270b", "270c", "270d"])
        let project7 = Villas(name: "SIGNATURE VILLAS 225", image: "SIGNATURE VILLAS 225", deatImages: ["225", "225b", "185d", "225d"])
        let project8 = Villas(name: "SIGNATURE VILLAS 370", image: "SIGNATURE VILLAS 370", deatImages: ["370", "185d", "185d", "370d"])
        
        
        projectsArr = [project1, project2, project3, project4, project5, project6, project7, project8]
        
    }
}


extension VillasVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projectsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        let image = UIImage(named: projectsArr[indexPath.row].image)
        cell.projectImageView.image = image
        cell.projectNameLabel.text = projectsArr[indexPath.row].name
        
        
        
        // creat the shadows and modifies the cards
        cell.contentView.layer.cornerRadius = 7.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = true
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        cell.layer.cornerRadius = 8.0
        cell.projectImageView.layer.cornerRadius = 8.0
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let DeatVC = UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: VCs.villasDetailsVC) as! VillasDetailsVC
        
        // look here
        DeatVC.projectsArrNames = projectsArr[indexPath.row].deatImages
        DeatVC.name = projectsArr[indexPath.row].name
        
        
        
        
        self.navigationController?.pushViewController(DeatVC, animated: true)
    }
    
    
}
