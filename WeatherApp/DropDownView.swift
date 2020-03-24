//
//  DropDownView.swift
//  WeatherApp
//
//  Created by apple on 3/18/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class DropDownView: UIView {
    @IBOutlet weak var districtTableView:UITableView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        districtTableView.delegate = self
        districtTableView.dataSource = self
    }

}

extension DropDownView:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
