//
//  EmitterViewController.swift
//  FourSeason
//
//  Created by VTStudio on 2017/9/12.
//  Copyright © 2017年 VTStudio. All rights reserved.
//

import UIKit

class EmitterViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!

    var season: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch season {
        case "Spring":
            self.flowerBlossom()
        case "Summer":
            self.sunThorn()
        case "Autumn":
            self.view.backgroundColor = UIColor.black
            self.fireWork()
        case "Winter":
            self.snowFlutter()
        default: break
        }
    }
    
    func flowerBlossom() {
        
        let flowerLayer = CAEmitterLayer()
        flowerLayer.position = CGPoint(x: self.view.bounds.size.width / 2, y: -30)
        flowerLayer.emitterSize = CGSize(width: self.view.bounds.size.width, height: 0)
        flowerLayer.emitterShape = kCAEmitterLayerLine
        flowerLayer.emitterMode = kCAEmitterLayerOutline
        
        let flowerCell = CAEmitterCell()
        flowerCell.contents = UIImage(named: "Sakura")!.cgImage
        
        flowerCell.scale = 0.3
        flowerCell.scaleRange = 0.1
        
        flowerCell.birthRate = 10
        flowerCell.lifetime = 100
        flowerCell.alphaSpeed = 0
        
        flowerCell.velocity = 80
        flowerCell.velocityRange = 20
        flowerCell.emissionLongitude = CGFloat(Double.pi)
        flowerCell.emissionRange = CGFloat(Double.pi / 2)
        
        flowerCell.spin = CGFloat(Double.pi / 4)
        flowerCell.spinRange = CGFloat(Double.pi / 8)
        
        flowerLayer.shadowOpacity = 1
        flowerLayer.shadowRadius = 5
        flowerLayer.shadowOffset = CGSize(width: 3, height: 3)
        flowerLayer.shadowColor = UIColor.white.cgColor
        
        flowerLayer.emitterCells = [flowerCell]
        self.view.layer.addSublayer(flowerLayer)
    }

    func sunThorn() {
        
        let explosionLayer = CAEmitterLayer()
        explosionLayer.emitterPosition = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.size.height / 2)
        explosionLayer.emitterShape = kCAEmitterLayerCircle
        explosionLayer.emitterMode = kCAEmitterLayerOutline
        explosionLayer.emitterSize = CGSize(width: 100, height: 0)
        explosionLayer.renderMode = kCAEmitterLayerOldestLast
        
        let bubble = CAEmitterCell()
        bubble.contents = UIImage(named: "Particle")!.cgImage
        bubble.scale = 0.25
        bubble.alphaRange = 0.2
        bubble.alphaSpeed = -0.8
        bubble.birthRate = 1000
        bubble.lifetime = 1
        bubble.velocity = 150
        bubble.velocityRange = 10
        bubble.color = UIColor.orange.cgColor
        
        explosionLayer.emitterCells = [bubble]
        self.view.layer.addSublayer(explosionLayer)
    }
    
    func fireWork() {
        
        let star = UIImage(named: "Star")!.cgImage
        
        let fireLayer = CAEmitterLayer()
        fireLayer.emitterPosition = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.size.height)
        fireLayer.emitterSize = CGSize(width: self.view.bounds.size.width / 3, height: 0)
        fireLayer.emitterMode = kCAEmitterLayerOutline
        fireLayer.emitterShape = kCAEmitterLayerLine
        fireLayer.renderMode = kCAEmitterLayerAdditive
        fireLayer.seed = (arc4random()%100)+1
        
        let rocket = CAEmitterCell()
        rocket.birthRate = 1
        rocket.emissionRange = CGFloat(Double.pi / 8)
        rocket.lifetime = 1.04 //Associate with burst.lifeTime -> burst.lifetime + (stop time)
        rocket.velocity = 500
        rocket.velocityRange = 100
        rocket.yAcceleration = 75
        rocket.spin = CGFloat(Double.pi)
        rocket.contents = star
        rocket.color = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.8).cgColor
        rocket.redRange = 1.0
        rocket.greenRange = 1.0
        rocket.blueRange = 1.0
        
        let burst =  CAEmitterCell()
        burst.contents = star
        burst.birthRate = 1.0
        burst.velocity = 0
        burst.scale = 2.5
        burst.redSpeed = -1.5
        burst.blueSpeed = 1.5
        burst.greenSpeed = 1.0
        burst.lifetime = 0.5
        
        let spark = CAEmitterCell()
        spark.scale = 0.5
        spark.contents = star
        spark.birthRate = 200
        spark.emissionRange = CGFloat(Double.pi) * 2
        spark.velocity = 125
        spark.lifetime = 2.0
        spark.alphaSpeed = -0.4
        spark.yAcceleration = 75
        spark.scaleSpeed = -0.1
        
        spark.greenSpeed = -0.1
        spark.redSpeed = 0.4
        spark.blueSpeed = -0.1
        spark.spin = CGFloat(Double.pi) * 2
        spark.spinRange = CGFloat(Double.pi) * 2
        
        burst.emitterCells = [spark]
        rocket.emitterCells = [burst]
        fireLayer.emitterCells = [rocket]
        self.view.layer.addSublayer(fireLayer)
    }
    
    func snowFlutter() {
        
        let snowLayer = CAEmitterLayer()
        snowLayer.position = CGPoint(x: self.view.bounds.size.width / 2, y: -30)
        snowLayer.emitterSize = CGSize(width: self.view.bounds.size.width * 2, height: 0)
        snowLayer.emitterShape = kCAEmitterLayerLine
        snowLayer.emitterMode = kCAEmitterLayerOutline
        
        snowLayer.shadowColor = UIColor.white.cgColor
        snowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        snowLayer.shadowRadius = 0.0
        snowLayer.shadowOpacity = 1.0
        
        let snowCell = CAEmitterCell()
        snowCell.contents = UIImage(named: "Snowflake")!.cgImage
        
        snowCell.scale = 0.7
        snowCell.birthRate = 3.0
        snowCell.lifetime = 120.0
        snowCell.velocity = -10
        snowCell.velocityRange = 10
        snowCell.yAcceleration = 2
        snowCell.emissionRange = CGFloat(Double.pi / 2)
        snowCell.spin = CGFloat(Double.pi / 4)
        snowCell.color = UIColor(red: 0.6, green: 0.658, blue: 0.734, alpha: 1.0).cgColor
        
        snowLayer.emitterCells = [snowCell]
        self.view.layer.addSublayer(snowLayer)
    }
}


