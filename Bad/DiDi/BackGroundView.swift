//
//  BackGroundView.swift
//  Bad
//
//  Created by dengzhiping on 2017/2/13.
//  Copyright © 2017年 DongHui. All rights reserved.
//

import UIKit

class BackGroundView: UIView {

}

extension BackGroundView{
  class  func backGroundView() -> BackGroundView {
        
        return Bundle.main.loadNibNamed("BackGroundView", owner: self, options: nil)?.first as! BackGroundView
    }
}
