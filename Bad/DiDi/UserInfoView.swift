//
//  UserInfoView.swift
//  Bad
//
//  Created by dengzhiping on 2017/2/14.
//  Copyright © 2017年 DongHui. All rights reserved.
//

import UIKit

class UserInfoView: UIView{

    @IBOutlet weak var crowView: UIView!
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var crowButton: UIButton!
    @IBOutlet weak var footView: UIView!
    @IBOutlet weak var didiName: UILabel!
    @IBOutlet weak var vipButton: UIButton!
    
    @IBOutlet weak var iconHeight: NSLayoutConstraint!
    
    @IBOutlet weak var iconTop: NSLayoutConstraint!
    @IBOutlet weak var iconViewHeight: NSLayoutConstraint!
    @IBOutlet weak var footViewTop: NSLayoutConstraint!
    @IBOutlet weak var crowViewTop: NSLayoutConstraint!
    @IBOutlet weak var footViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableTop: NSLayoutConstraint!
    @IBOutlet weak var footBottom: NSLayoutConstraint!
    
}

extension UserInfoView{
    class func userInfo() -> UserInfoView {
        return Bundle.main.loadNibNamed("UserInfoView", owner: self, options: nil)?.first as! UserInfoView
    }
    
}
