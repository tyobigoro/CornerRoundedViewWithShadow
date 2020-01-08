//
//  ViewController.swift
//  CornerRoundedViewWithShadow
//
//  Created by tyobigoro_i on 2020/01/08.
//  Copyright © 2020 tyobigoro_i. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

class CornerRoundedViewWithShadow: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 5.0
        clipsToBounds = true
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //drawMark()
        drawCircle()
        
    }
    
    func drawCircle() {
        
        let circleSize: CGFloat = self.bounds.size.width / 2
        let center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        
        let lineWidth: CGFloat = 10.0
        let lineColor: UIColor = UIColor.white
        let fillColor: UIColor = UIColor.green
        
        
        
        let ctxFill: CGContext? = UIGraphicsGetCurrentContext()
        ctxFill?.setLineWidth(lineWidth)
        ctxFill?.setStrokeColor(lineColor.cgColor)
        ctxFill?.setFillColor(fillColor.cgColor)
        ctxFill?.addArc(center: center, radius: circleSize * 0.5, startAngle: 0.0, endAngle: CGFloat(.pi * 2.0), clockwise: false)
        ctxFill?.setLineWidth(lineWidth)
        
        ctxFill?.fillPath()
        
        
        let ctxLine: CGContext? = UIGraphicsGetCurrentContext()
        ctxLine?.setLineWidth(lineWidth)
        ctxLine?.setStrokeColor(lineColor.cgColor)
        ctxLine?.setFillColor(fillColor.cgColor)
        ctxLine?.addArc(center: center, radius: circleSize * 0.5, startAngle: 0.0, endAngle: CGFloat(.pi * 2.0), clockwise: false)
        ctxLine?.setLineWidth(lineWidth)
        
        ctxLine?.strokePath()
    }
    
    
    func drawMark() {
        
        let lineWidth: CGFloat = 4.0
        let margin   : CGFloat = 5.0
        let scale    : CGFloat = 40.0
        let lineColor: UIColor = UIColor.white
        let fillColor: UIColor = UIColor.green
        
        let MaxRadius: CGFloat = layer.cornerRadius
        let minRasiua: CGFloat = 0.2
        
        let ctx: CGContext? = UIGraphicsGetCurrentContext()
        ctx?.setLineWidth(lineWidth)
        ctx?.setStrokeColor(lineColor.cgColor)
        ctx?.setFillColor(fillColor.cgColor)
        
        ctx?.move(to: CGPoint(x: self.frame.width - margin, y: self.frame.height - (scale + margin)/2))
        ctx?.addArc(tangent1End: CGPoint(x: self.frame.width -  margin, y: self.frame.height -  margin),
                    tangent2End: CGPoint(x: self.frame.width - (scale + margin), y: self.frame.height -  margin), radius: MaxRadius)
        ctx?.addArc(tangent1End: CGPoint(x: self.frame.width - (scale + margin), y: self.frame.height -  margin),
                    tangent2End: CGPoint(x: self.frame.width -  margin, y: self.frame.height - (scale + margin)), radius: minRasiua)
        ctx?.addArc(tangent1End: CGPoint(x: self.frame.width -  margin, y: self.frame.height - (scale + margin)),
                    tangent2End: CGPoint(x: self.frame.width -  margin, y: self.frame.height - (scale + margin)/2), radius: minRasiua)
        ctx?.closePath()
        ctx?.fillPath()
        ctx?.strokePath()
        
    }
    
}


class CornerRoundedBtn: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 5.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 4
        
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let borderWidth: CGFloat = 1.0
        let borderColor: UIColor = UIColor.red
        let cornerRadius: CGFloat = layer.cornerRadius
        
        let halfWidth: CGFloat = borderWidth / 2
        
        let context: CGContext? = UIGraphicsGetCurrentContext()
        
        context?.setLineWidth(borderWidth)
        context?.setStrokeColor(borderColor.cgColor)
        
        context?.move(to: CGPoint(x: self.frame.width - 2 - halfWidth, y: self.frame.height - 6 ))
        context?.addArc(tangent1End: CGPoint(x: self.frame.width - 2 - halfWidth, y: self.frame.height - 2 - halfWidth),
                        tangent2End: CGPoint(x: self.frame.midX, y: self.frame.height - 2 - halfWidth),
                        radius: cornerRadius
        )
        context?.addArc(tangent1End: CGPoint(x: 0 + halfWidth, y: self.frame.height - halfWidth),
                        tangent2End: CGPoint(x: 0 + halfWidth, y: 0),
                        radius: cornerRadius
        )
        context?.addLine(to: CGPoint(x: rect.minX + halfWidth, y: rect.minY))
        context?.strokePath()
        
    }
    
}
