//
//  HexagonalControlView.swift
//  HoneyComb
//
//  Created by Admin on 4/13/18.
//  Copyright © 2018 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class HexagonalControlView: UIView, UIGestureRecognizerDelegate {
    
    let effectView: UIView = UIView()
    var settingButton: UIView = UIView()
    var circleViewInsideButton: UIView = UIView()
    var expandIconImageView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.extraLight))
    fileprivate var lastPointY: CGFloat = 0
    fileprivate var isMoveTop: Bool = false
    fileprivate var isDrag: Bool = false
    var previousLocation: CGPoint = CGPoint.zero
    var hideCenterY: CGFloat = 0
    
    var colorIconImageView: UIImageView = UIImageView()
    let hueColorPickerView:  SwiftHUEColorPicker = SwiftHUEColorPicker()
    let backColorButton: UIButton = UIButton()
    let cỉrcleColorButton: UIButton = UIButton()
    let sunImageView: UIImageView = UIImageView()
    let sliderView: UISlider = UISlider()
    let switchOnButton: UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.addSubview(effectView)
        effectView.translatesAutoresizingMaskIntoConstraints = false
        visual("H:|-0-[v]-0-|", views: ["v": effectView])
        visual("V:|-10-[v]-0-|", views: ["v": effectView])
        effectView.backgroundColor = UIColor(hex: "#1a1a1a")
        
        self.addSubview(settingButton)
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        visual("H:|-0-[v]-0-|", views: ["v": settingButton])
        visual("V:|-10-[v(50)]", views: ["v": settingButton])
        settingButton.layer.masksToBounds = true
        
        settingButton.addSubview(circleViewInsideButton)
        circleViewInsideButton.translatesAutoresizingMaskIntoConstraints = false
        circleViewInsideButton.visualCenterX(settingButton)
        circleViewInsideButton.visualWidth(100)
        settingButton.visual("V:|-0-[v(100)]", views: ["v": circleViewInsideButton])
        
        circleViewInsideButton.addSubview(expandIconImageView)
        expandIconImageView.translatesAutoresizingMaskIntoConstraints = false
        expandIconImageView.visualCenterX(circleViewInsideButton)
        expandIconImageView.visualWidth(50)
        circleViewInsideButton.visual("V:|-8-[v(6)]", views: ["v": expandIconImageView])
        
        expandIconImageView.contentMode = .scaleAspectFit
        expandIconImageView.backgroundColor = UIColor(hex: "051E54").alpha(0.5)
        expandIconImageView.layer.cornerRadius = 3
        expandIconImageView.layer.masksToBounds = true
        
        self.effectView.layer.masksToBounds = true
        self.layer.masksToBounds = true
        
        self.addSubview(colorIconImageView)
        colorIconImageView.contentMode = .scaleAspectFit
        colorIconImageView.image = UIImage(named: "device-detail-color")
        self.colorIconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backColorButton)
        backColorButton.translatesAutoresizingMaskIntoConstraints = false
        backColorButton.setImage(UIImage(named: "device-detail-color-circle"), for: .normal)
        
        self.addSubview(cỉrcleColorButton)
        cỉrcleColorButton.translatesAutoresizingMaskIntoConstraints = false
        cỉrcleColorButton.setImage(UIImage(named: "device-detail-back-color"), for: .normal)
        
        self.addSubview(hueColorPickerView)
        self.hueColorPickerView.delegate = self
        self.hueColorPickerView.translatesAutoresizingMaskIntoConstraints = false
        self.visual("H:|-[v(40)]-[v1]-16-[v2(50)]-16-[v3(50)]-|", views: ["v": colorIconImageView,
                                                           "v1": hueColorPickerView,
                                                           "v2": cỉrcleColorButton,
                                                           "v3": backColorButton])
        self.visual("V:|-50-[v(30)]", views: ["v": colorIconImageView])
        self.visual("V:|-50-[v(30)]", views: ["v": hueColorPickerView])
        self.visual("V:|-40-[v(50)]", views: ["v": backColorButton])
        self.visual("V:|-40-[v(50)]", views: ["v": cỉrcleColorButton])
        
        
        self.addSubview(sunImageView)
        self.addSubview(sliderView)
        self.addSubview(switchOnButton)
        
        sunImageView.image = UIImage(named: "device-detail-sun")
        switchOnButton.setImage(UIImage(named: "device-detail-turn-on"), for: .normal)
        sunImageView.translatesAutoresizingMaskIntoConstraints = false
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        switchOnButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.visual("V:|-[v]-38-[v1(40)]", views: ["v": colorIconImageView, "v1": sunImageView])
        self.visual("V:|-[v]-40-[v1(30)]", views: ["v": colorIconImageView, "v1": sliderView])
        self.visual("V:|-[v]-34-[v1(50)]", views: ["v": colorIconImageView, "v1": switchOnButton])
        self.visual("H:|-[v(40)]-[v1]-16-[v2(50)]-|", views: ["v": sunImageView, "v1": sliderView, "v2": switchOnButton])

        
        backColorButton.addTarget(self, action: #selector(baclColorButtonTap), for: .touchUpInside)
        
        let swipeDown = UIPanGestureRecognizer(target: self, action: #selector(pan))
        swipeDown.delegate = self
        swipeDown.maximumNumberOfTouches = 1
        swipeDown.minimumNumberOfTouches = 1
        swipeDown.delegate = self
        self.addGestureRecognizer(swipeDown)
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.hideCenterY = self.center.y
        self.previousLocation = self.center
        
        
    }
    
    @objc func baclColorButtonTap() {
        print("LJFSHLJFGHSGFKHJGSFKHJSGFKHJGSFKHJSFGKFHJSGKHJSFGKFHJSG")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ASADHJJFGAJDG:", touches.compactMap({ (e) -> UIView? in
            return e.view
        }))
        self.previousLocation = self.center
        guard touches.first?.view === effectView || touches.first?.view === circleViewInsideButton || touches.first?.view === settingButton else {
            self.isDrag = false
            return
        }
        self.isDrag = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isDrag = false
    }
    
    @objc func pan(gesture:UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            let point = gesture.location(in: self.superview)
            let translation = gesture.translation(in: self.superview!)
            self.center.y = previousLocation.y + translation.y
            self.isMoveTop = point.y < lastPointY
            self.lastPointY = point.y
        case .ended:
            if isMoveTop || self.center.y < self.hideCenterY - self.frame.height + 100 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.center.y = self.hideCenterY - self.frame.height + 100
                    self.previousLocation = self.center
                })
                self.isDrag = false
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.center.y = self.hideCenterY
                    self.previousLocation = self.center
                }
                self.isDrag = false
            }
        default: break
        }
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.isDrag
    }
}

extension HexagonalControlView: SwiftHUEColorPickerDelegate {
    
    func valuePickedEndDrag(_ color: UIColor, type: SwiftHUEColorPicker.PickerType) {
        self.isDrag = true
    }
    
    func valuePicked(_ color: UIColor, type: SwiftHUEColorPicker.PickerType) {
        self.isDrag = false
    }
}
