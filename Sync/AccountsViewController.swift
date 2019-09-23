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
        
        var request = URLRequest(url: URL(string: "https://reqres.in/api/users")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                if let total = json["total"]?.doubleValue {
                    DispatchQueue.main.async {
                        self.showAmount(amount: total)
                    }

                } else {
                    print("Parsing Issue")
                }
                print(json)

            } catch {
                print("error")
            }
        })
        
        task.resume()
    }


    func showAmount(amount : Double){

        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        let formattedNumber = numberFormatter.string(from: NSNumber(value:amount))!
        
        let symbol = NSMutableAttributedString(string: "£", attributes: [
            .font: UIFont.systemFont(ofSize: 30.0, weight: .semibold),
            .foregroundColor: UIColor(red: 29/255.0, green: 29/255.0, blue: 40/255.0, alpha: 1),
            .kern: -0.21
            ])
        
        let attributedString = NSMutableAttributedString(string: formattedNumber, attributes: [
            .font: UIFont.systemFont(ofSize: 38.0, weight: .semibold),
            .foregroundColor: UIColor(red: 29/255.0, green: 29/255.0, blue: 40/255.0, alpha: 1),
            .kern: 0.0
            ])
        let length = formattedNumber.count
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 40.0, weight: .semibold), range: NSRange(location: length - 3, length: 1))
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 34.0, weight: .semibold), range: NSRange(location: length - 2, length: 2))
        symbol.append(attributedString)
        self.lbAmount?.attributedText = symbol
    }

}
