//
//  DayCell.swift
//  WeatherApp
//
//  Created by Jeff Tabios on 9/11/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation
import UIKit

class DayCell: UITableViewCell {
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var daysView: UICollectionView!
    
    var listItems: [List]?
    
    func reloadHours() {
        DispatchQueue.main.async { [weak self] in
            self?.daysView.reloadData()
        }
    }
}

extension DayCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayWeatherCell", for: indexPath) as! DayWeatherCell
        
        let currentItem = listItems?[indexPath.row]
        if let icon = currentItem?.weather[0].icon {
            let imageUrl = URL(string: "http://openweathermap.org/img/wn/\(icon).png")
            cell.icon.load(url: imageUrl, placeholder: UIImage(named: "10d"))
        }
        
        if let tempAmount = currentItem?.main.temp {
            cell.temperature.text = "\(tempAmount)° C"
        }
        
        if let hour = currentItem?.dtTxt.toDate().getHour() {
            cell.time.text = hour
        }
        
        return cell
    }
    
    
}
