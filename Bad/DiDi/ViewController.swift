//
//  ViewController.swift
//  DiDi
//
//  Created by dengzhiping on 2017/2/13.
//  Copyright © 2017年 DongHui. All rights reserved.
//

import UIKit
private let animDuration : TimeInterval = 0.5
private let width : CGFloat = UIScreen.main.bounds.size.width*0.64
private let iconHeight : CGFloat = 100


class ViewController: UIViewController,UIGestureRecognizerDelegate,UITableViewDataSource, UITableViewDelegate,UINavigationControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    fileprivate lazy var nav : NavView = NavView.navView()
    fileprivate lazy var backgroundView : BackGroundView = BackGroundView.backGroundView()
    fileprivate lazy var userInfo : UserInfoView =  UserInfoView.userInfo()
    fileprivate lazy var collectionCell : CollectionViewCell = CollectionViewCell.cell()
    let dataArr = ["行程","钱包","客服","设置"]
    let dataImage = ["tourist","wallat","server","setting"]
    let collectionDataImage = ["积分商城","推荐有奖","司机招募","堵车险","爱心里程","兑换码","办银行卡","企业版","敬老服务","春节红包"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUpUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: userInfo))! {
            return false
        }
        return true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.none
        cell.textLabel?.text = dataArr[indexPath.row]
        cell.imageView?.image = UIImage.init(named: dataImage[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        print(dataArr[indexPath.row])
        
        let vc1 = PushViewController()
        vc1.title = dataArr[indexPath.row]
        self.navigationController?.pushViewController(vc1, animated: true)
        
    }
    
}

extension ViewController {
    fileprivate func setUpUI(){
        
        
        self.navigationController?.delegate = self
        
        nav.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64)
        view.addSubview(nav)
        nav.leftButton.addTarget(self, action: #selector(leftClick(btn:)), for: .touchUpInside)
        
        backgroundView.frame = CGRect(x: 0 ,
                                      y: 0,
                                      width: UIScreen.main.bounds.size.width,
                                      height: UIScreen.main.bounds.size.height)
        backgroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        view.addSubview(backgroundView)
    
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(tap(tapGes:)))
        tapgesture.delegate = self
        backgroundView.addGestureRecognizer(tapgesture)
        
        
        userInfo.frame = CGRect(x: -width ,
                                y: 0,
                                width: width,
                                height: UIScreen.main.bounds.size.height)
        userInfo.backgroundColor = UIColor.white
        backgroundView.addSubview(userInfo)
        backgroundView.isHidden = true
        
        userInfo.myTableView.delegate = self
        userInfo.myTableView.dataSource = self
        userInfo.myTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        userInfo.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        userInfo.myTableView.tableFooterView = UIView()
        userInfo.myTableView.backgroundColor = UIColor.white
        userInfo.crowButton.addTarget(self, action: #selector(crowClick(btn:)), for: .touchDown)
        
        userInfo.collectionView.dataSource = self
        userInfo.collectionView.delegate = self
        userInfo.collectionView.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCellIdentify")
        
    }

    
    //实现UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return collectionDataImage.count
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell: CollectionViewCell   = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellIdentify", for: indexPath) as! CollectionViewCell
        cell.titleLable.text = collectionDataImage[indexPath.row]
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: width/3, height: 85)
    }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView .deselectItem(at: indexPath, animated: true)
        let vc1 = PushViewController()
        vc1.title = collectionDataImage[indexPath.row]
        self.navigationController?.pushViewController(vc1, animated: true)
        
    }
    
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        if viewController .isKind(of: ViewController.self){
            navigationController .setNavigationBarHidden(true, animated: true)
        }else {
            navigationController .setNavigationBarHidden(false, animated: true)
        }
    }
    
    @objc fileprivate func crowClick(btn: UIButton){
        
        if  userInfo.footViewHeight.constant > 128 {
            
            btn.setImage(UIImage.init(named: "crow"), for: .normal)
            userInfo.didiName.isHidden = false
            userInfo.vipButton.isHidden = false;
            userInfo.iconViewHeight.constant = 200
            userInfo.iconHeight.constant = 80
            userInfo.iconTop.constant = 50
            userInfo.footViewHeight.constant = 128
            UIView.animate(withDuration: 0.3) {
                self.userInfo.layoutIfNeeded()
            }
            
        }else {
            btn.setImage(UIImage.init(named: "crowUp"), for: .normal)
            userInfo.didiName.isHidden = true
            userInfo.vipButton.isHidden = true;
            userInfo.iconViewHeight.constant = 100
            userInfo.iconHeight.constant = 50
            userInfo.iconTop.constant = 30
            userInfo.footViewHeight.constant = UIScreen.main.bounds.size.height - 100 - 22
            
            UIView.animate(withDuration: 0.3) {
                self.userInfo.layoutIfNeeded()
            }
        }
    }
    
    @objc fileprivate func leftClick(btn: UIButton) {
        
        if userInfo.frame.origin.x < 0 {
            backgroundView.isHidden = false
            UIView.animate(withDuration: animDuration) {
                self.userInfo.frame.origin.x = 0
            }
        }
    }

    @objc fileprivate func tap(tapGes: UITapGestureRecognizer) {
        leftHidden()
    }
    
    fileprivate func leftHidden(){
        if userInfo.frame.origin.x >= 0 {
            UIView.animate(withDuration: animDuration, animations: {
                self.userInfo.frame.origin.x = -width
                
            }) { (fished:Bool) in
                if fished {
                    self.backgroundView.isHidden = true
                }
            }
        }
    }
    
    
}

