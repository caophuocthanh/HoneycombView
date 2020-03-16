//
//  ViewController.swift
//  HoneyComb
//
//  Created by Admin on 3/28/18.
//  Copyright © 2018 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class HoneyCombDetailViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var paperView: HexagonalPaperView!
    var controlView: HexagonalControlView = HexagonalControlView()
    
    var canDrag: Bool = true
    
    //var button: UIButton = UIButton()
    //var textField: UITextField = UITextField()
    var previousLocation: CGPoint = CGPoint.zero
        
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.black
        
        self.paperView = HexagonalPaperView(frame: CGRect(x: -self.view.bounds.height, y: -self.view.bounds.height, width: self.view.bounds.height*3, height: self.view.bounds.height*3))
        self.paperView.center = self.view.center
        self.paperView.delegate = self
        self.view.addSubview(paperView)
        
        
        self.view.addSubview(self.controlView)
        self.controlView.translatesAutoresizingMaskIntoConstraints = false
        self.view.visual("H:|-0-[v]-0-|", views: ["v": controlView])
        self.view.visual("V:[v(400)]-(-300)-|", views: ["v": controlView])
        

//        self.menuView.addSubview(button)
//        self.menuView.addSubview(textField)
//
//        self.button.backgroundColor = UIColor.red
//        self.button.layer.cornerRadius = 6
//        self.button.layer.masksToBounds = true
//        self.button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
//        self.button.translatesAutoresizingMaskIntoConstraints = false
//        self.button.setTitle("+", for: .normal)
//
//
//        self.menuView.visual("H:|-[v]-[v1(100)]-|", views: ["v": textField,
//                                                        "v1": button])
//
//        self.textField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
//        self.textField.layer.cornerRadius = 6
//        self.textField.layer.masksToBounds = true
//        self.textField.translatesAutoresizingMaskIntoConstraints = false
//        self.menuView.visual("V:|-16-[v(40)]", views: ["v": button])
//        self.menuView.visual("V:|-16-[v(40)]", views: ["v": textField])
        

        
        
        //let strings = "1;0072ff:12;ff0000"
        let strings = "1;0072ff:12;ff0000:11;ffe100:121;ffaf20:1212;012343:12121;fe3243:121212;fe3243:1212121;fe3243:12121213;fe3243:121212132;fe3243:1212121322;fe3243:12121213221;fe3243"
        self.paperView.drawHexagonalViews(strings, radius: 100, color: .red)
//        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
//            let hex = self.paperView.calculateAddressCenter()
//            let _center = hex.center
//            print("JSHKJFDKJSHFG:", _center, self.paperView.center, hex.address)
//            UIView.animate(withDuration: 2, animations: {
//                self.paperView.center.x = _center.x/3 - self.view.bounds.width
//                //self.paperView.center.y = _center.y/3 - self.view.bounds.height
//            })
//        }

        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(randoomUpdateColor), userInfo: nil, repeats: true)
    }
    

    @objc func randoomUpdateColor() {
        for _ in 0...4 {
            let random: Int = Int(arc4random_uniform(UInt32(self.paperView.hexagonalViews.count - 1)))
            let _view = self.paperView.hexagonalViews[random]
            if _view.address != -1 && _view.address != -1 {
                self.paperView.hexagonalViews[random].updateColor(UIColor.random())
            }
        }
    }
    
    
//    @objc func tapButton() {
//        guard let text = self.textField.text else { return }
//        print("Draw text:", text)
//        let arrText = text.components(separatedBy: ";")
//        if arrText.count < 3 {
//            self.paperView.drawHexagonalView(text, hub: 0)
//        }
//        if arrText.count == 3 {
//            self.paperView.drawHexagonalView("\(arrText[1]);\(arrText[2])", hub: Int(arrText.first!) ?? 0)
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension HoneyCombDetailViewController: HexagonalPaperViewDelegate {
    
    func hexagonalPaperView(view: HexagonalPaperView, touchBegan touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    func hexagonalPaperView(view: HexagonalPaperView, hexagonalView: HexagonalView, touchBegan touches: Set<UITouch>, with event: UIEvent?) {
    }
}
