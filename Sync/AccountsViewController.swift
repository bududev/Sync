//
//  AccountsViewController.swift
//  Sync
//
//  Created by JYN on 2019/09/20.
//  Copyright © 2019 bold. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController {
    @IBOutlet weak var lbBadge : UILabel?
    @IBOutlet weak var scrollView : UIScrollView?
    @IBOutlet weak var lbAmount : UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        lbBadge?.layer.cornerRadius = 10.0
        lbBadge?.layer.masksToBounds = true
        lbBadge?.layer.borderColor = UIColor.white.cgColor
        lbBadge?.layer.borderWidth = 1
        
        // Do any additional setup after loading the view.
        
        let attributedString = NSMutableAttributedString(string: "£1,720.21", attributes: [
            .font: UIFont.systemFont(ofSize: 38.0, weight: .semibold),
            .foregroundColor: UIColor(red: 29/255.0, green: 29/255.0, blue: 40/255.0, alpha: 1),
            .kern: 0.0
            ])
        attributedString.addAttributes([
            .font: UIFont.systemFont(ofSize: 30.0, weight: .semibold),
            .kern: -0.21
            ], range: NSRange(location: 0, length: 1))
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 40.0, weight: .semibold), range: NSRange(location: 6, length: 1))
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 34.0, weight: .semibold), range: NSRange(location: 7, length: 2))
        
        lbAmount?.attributedText = attributedString
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
