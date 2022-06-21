//
//  ViewController.swift
//  iosBuoi_08
//
//  Created by Toản Bùi on 16/06/2022.
//

import UIKit



class ViewController: UIViewController {

    let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    } ()
    let blackView : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    let greenView : UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    var timerRotate: Timer!
    var timer1: Timer!
    var timer2: Timer!
    var timer3: Timer!
    var timer4: Timer!
    
    var rotateAngle: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
        setupUI()
        timerRotate = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: {_ in self.blackView.transform = CGAffineTransform(rotationAngle: -.pi * self.rotateAngle/360)
            
        })
        leftToright()
    }
    func leftToright() {
        timer1 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _ in self.containerView.frame.origin.x += 0.05
            if self.containerView.frame.maxX >= self.view.frame.maxX {
            self.timer1.invalidate()
        }
        })
    }
    
    func downBall() {
        timer2 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _ in self.containerView.frame.origin.y += 0.05
            if self.containerView.frame.maxY >= self.view.frame.maxY {
                self.timer2.invalidate()
            }
        })
    }
    func rightToLeft() {
        timer3 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _ in self.containerView.frame.origin.x -= 0.05
            if self.containerView.frame.minX <= self.view.frame.minX {
                self.timer3.invalidate()
                self.upBall()
            }
            })
    }
    
    func upBall(){
        timer4 = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true, block: { _ in self.containerView.frame.origin.y -= 0.05
            if self.containerView.frame.minY <= self.view.frame.minY {
                self.timer4.invalidate()
                self.upBall()
            }
            })
    }
                                      
    func setupUI () {
        view.addSubview(containerView)
        containerView.frame = .init(x: 0, y: 0, width: 60, height: 60)
        
        containerView.addSubview(blackView)
        blackView.frame = containerView.bounds
        blackView.layer.cornerRadius = 30
        blackView.clipsToBounds = true
        
        blackView.addSubview(greenView)
        greenView.frame = .init(x: 0, y: 0, width: 20, height: 20)
        
    }

}

