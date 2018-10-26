//
//  Toast.swift
//  MaSo
//
//  Created by Nikita Beresnev on 10/22/18.
//  Copyright © 2018 Nikita Beresnev. All rights reserved.
//

import Foundation
import UIKit

class Toast: UIView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        Bundle.main.loadNibNamed("Toast", owner: self, options: nil)
        addSubview(contentView)
        contentView.backgroundColor = Colors.tintBrownColor
        contentView.layer.cornerRadius = 10
        self.isHidden = true
    }
    
    func displayToast(message: String) {
        messageLabel.text = message
        animateAppear()
    }

    private func animateAppear() {
        if self.bounds.minY == 0 {
            self.transform = CGAffineTransform(translationX: 0, y: -self.bounds.size.height)
            self.isHidden = false
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.transform = .identity
        }) { [weak self] (_) in
            self?.animateDissapear()
        }
        
    }
    
    private func animateDissapear() {
        UIView.animate(withDuration: 0.5, delay: 2, animations: {
            self.transform = CGAffineTransform(translationX: 0, y: -self.bounds.size.height)
        }) { [weak self] (_) in
            self?.isHidden = true
        }
    }
//    private func update(to height: Toast.Height) {
//        UIView.animate(withDuration: 0.5) { [weak self] in
//            self?.contentViewHeight.constant = height.rawValue
//            self?.layoutIfNeeded()
//        }
//    }
}