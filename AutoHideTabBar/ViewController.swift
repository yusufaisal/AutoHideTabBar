//
//  ViewController.swift
//  AutoHideTabBar
//
//  Created by iSal on 20/04/20.
//  Copyright © 2020 iSal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell(style: .subtitle, reuseIdentifier: nil)
    }
    

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let translation  = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        self.performScrollHandler(translation: translation)

    }
    
    private func performScrollHandler(translation: CGPoint){
        if translation.y == 0 {return}
        if translation.y > 0 {
            self.tabBarController?.setTabBar(hidden: false)
        } else {
            self.tabBarController?.setTabBar(hidden: true)
        }
    }
}
