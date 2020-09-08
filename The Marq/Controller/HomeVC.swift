//
//  ViewController.swift
//  The Marq
//
//  Created by user on 05.07.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import UIKit
import SideMenu


class HomeVC: UIViewController, MenuListControllerDelegate {

    var sidemenu: SideMenuNavigationController?
    
    var home: UIViewController!
        var villasVC: UIViewController!
        var aboutUsVC: UIViewController!
        var interestedVC: UIViewController!
        var visitUsVC: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildControllers()
        configureMenu()
    }
    
    
    private func configureMenu() {
        
        let menu = MenuListController(with: ["","","HOME", "VILLAS", "ABOUT US", "VISIT US", "INTERESTED"])
        menu.delegate       = self
        sidemenu            = SideMenuNavigationController(rootViewController: menu)
        sidemenu?.leftSide  = true
        sidemenu?.setNavigationBarHidden(true, animated: false)
        sidemenu?.statusBarEndAlpha = 0
        
        SideMenuManager.default.leftMenuNavigationController = sidemenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
    }
    
    
    private func addChildControllers() {
        
        villasVC     = storyboard?.instantiateViewController(withIdentifier: VCs.villasVC)
        aboutUsVC    = storyboard?.instantiateViewController(withIdentifier: VCs.aboutUsVC)
        interestedVC = storyboard?.instantiateViewController(withIdentifier: VCs.registerVC)
        visitUsVC    = storyboard?.instantiateViewController(withIdentifier: VCs.visitUsVC)

        addChild(villasVC)
        addChild(aboutUsVC)
        addChild(interestedVC)
        addChild(visitUsVC)
        
        view.addSubview(villasVC.view)
        view.addSubview(aboutUsVC.view)
        view.addSubview(interestedVC.view)
        view.addSubview(visitUsVC.view)
        
        villasVC.view.frame = view.bounds
        aboutUsVC.view.frame = view.bounds
        interestedVC.view.frame = view.bounds
        visitUsVC.view.frame = view.bounds
        
        villasVC.didMove(toParent: self)
        aboutUsVC.didMove(toParent: self)
        interestedVC.didMove(toParent: self)
        visitUsVC.didMove(toParent: self)
        
        villasVC.view.isHidden = true
        aboutUsVC.view.isHidden = true
        interestedVC.view.isHidden = true
        visitUsVC.view.isHidden = true
    }
    
    
    func didSelectMenuItem(named: String) {
        sidemenu?.dismiss(animated: true, completion: { [weak self] in
            
            self?.title = named
            
            if named == "HOME" {
                self?.villasVC.view.isHidden     = true
                self?.aboutUsVC.view.isHidden    = true
                self?.interestedVC.view.isHidden = true
                self?.visitUsVC.view.isHidden    = true
                self?.title = " "
            }
            
            if named == "VILLAS" {
                self?.villasVC.view.isHidden     = false
                self?.aboutUsVC.view.isHidden    = true
                self?.interestedVC.view.isHidden = true
                self?.visitUsVC.view.isHidden    = true
                
                
            }
            
            if named == "INTERESTED" {
                self?.villasVC.view.isHidden     = true
                self?.aboutUsVC.view.isHidden    = true
                self?.interestedVC.view.isHidden = false
                self?.visitUsVC.view.isHidden    = true
                
            }
            
            if named == "ABOUT US" {
               self?.villasVC.view.isHidden      = true
               self?.aboutUsVC.view.isHidden     = false
               self?.interestedVC.view.isHidden  = true
               self?.visitUsVC.view.isHidden     = true
            }
            
            if named == "VISIT US" {
                self?.villasVC.view.isHidden     = true
                self?.aboutUsVC.view.isHidden    = true
                self?.interestedVC.view.isHidden = true
                self?.visitUsVC.view.isHidden    = false
           }
        })
    }
    
    
    @IBAction func didTapMenu() {
        present(sidemenu!, animated: true)
    }
 

    private func goToInterestedVC() {
        let registerVC = UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: VCs.registerVC)  as! InterestedVC
        
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    
    private func goVillasVC() {
        let villasVC = UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: VCs.villasVC)  as! VillasVC
        self.navigationController?.pushViewController(villasVC, animated: true)
    }

    
    @IBAction func registerBtnPressed(_ sender: UIButton) {
        goToInterestedVC()
    }
    
    
    @IBAction func laterBtnPressed(_ sender: UIButton) {
        goVillasVC()
    }
}





