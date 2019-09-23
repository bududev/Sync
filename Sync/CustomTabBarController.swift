//
//  CustomTabBarController.swift
//  Sync
//
//  Created by JYN on 2019/09/20.
//  Copyright © 2019 bold. All rights reserved.
//

import UIKit


class SemiCirleView: UIView {
    
    var semiCirleLayer: CAShapeLayer!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if semiCirleLayer == nil {
            let circleRadius = bounds.size.width * 2.5
            let arcCenter = CGPoint(x: bounds.size.width / 2, y: circleRadius - 20)
            let circlePath = UIBezierPath(arcCenter: arcCenter, radius: circleRadius, startAngle: CGFloat.pi, endAngle: CGFloat.pi * 2, clockwise: true)
            
            semiCirleLayer = CAShapeLayer()
            semiCirleLayer.path = circlePath.cgPath
            semiCirleLayer.fillColor = UIColor.white.cgColor
            layer.addSublayer(semiCirleLayer)
            
            // Make the view color transparent
            backgroundColor = UIColor.clear
            
            semiCirleLayer.shadowColor = UIColor.black.cgColor
            semiCirleLayer.shadowOpacity = 0.1
            semiCirleLayer.shadowOffset = .zero
            semiCirleLayer.shadowRadius = 4
        }
    }
}

class CustomTabBarController: UITabBarController {

    let kBarHeightOffset : CGFloat = 30
    var qrButton : UIButton!
    var bFirst : Bool = true
    var semiCircle : SemiCirleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        semiCircle = SemiCirleView(frame: CGRect.init())
        self.tabBar.addSubview(semiCircle)
        self.tabBar.sendSubviewToBack(semiCircle)
        self.tabBar.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        addCenterButton()
        
//        self.tabBar.clipsToBounds = true
        UITabBar.appearance().tintColor = UIColor(red: 29/255.0, green: 29/255.0, blue: 40/255.0, alpha: 1)
        UITabBar.appearance().backgroundImage = UIImage.init()
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -25)

        let array = self.customizableViewControllers
        for controller in array! {
            controller.tabBarItem.imageInsets = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
        }
    }
    
    func addCenterButton(){
        let button = UIButton.init(type: .custom)
        button.setBackgroundImage(UIImage.init(named: "iconQrCode"), for: .normal)
        button.frame = CGRect.init(x: 0, y: 0, width: 54, height: 54)
        button.center = self.tabBar.center
        self.view.addSubview(button)
        
        qrButton = button
        
    }
    
    override func viewWillLayoutSubviews() {
        if (bFirst){
            var bottomPadding  : CGFloat = 0
            if #available(iOS 11.0, *) {
                bottomPadding = view.safeAreaInsets.bottom
            }
            
            bFirst = false
            var tabFrame = self.tabBar.frame
            tabFrame.size.height = tabFrame.size.height + kBarHeightOffset
            tabFrame.origin.y = self.view.frame.size.height - tabFrame.size.height
            self.tabBar.frame = tabFrame
            qrButton.center = CGPoint.init(x: self.tabBar.center.x, y: self.tabBar.center.y - 10 - bottomPadding/2)

            semiCircle.frame = self.tabBar.bounds
        }
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
