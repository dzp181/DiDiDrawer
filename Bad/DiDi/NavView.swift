//
//  NavView.swift
//  Bad
//
//  Created by dengzhiping on 2017/2/13.
//  Copyright © 2017年 DongHui. All rights reserved.
//

import UIKit

class NavView: UIView{

    @IBOutlet weak var leftButton: UIButton!
}

extension NavView{
    
    
   class func navView() -> NavView {
        return Bundle.main.loadNibNamed("NavView", owner: self, options: nil)?.first as! NavView
    }
}
