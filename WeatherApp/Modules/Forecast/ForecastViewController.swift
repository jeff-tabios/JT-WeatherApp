//
//  ForecastViewController.swift
//  Weather
//
//  Created by Jeff Tabios on 9/9/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation
import UIKit

class ForecastViewController: UIViewController {
    
    @IBOutlet weak var weatherTable: UITableView!
    @IBOutlet weak var cityChoices: UISegmentedControl!
    
    var presenter: ForecastPresenter?
    var currentRow = 0
    
    override func viewDidLoad() {
        presenter = ForecastPresenter(view: self)

        navigationItem.title = Constants.liveTitle
        presenter?.didSetSource(source: .live)
        presenter?.didSetCity(.munich)
        presenter?.didGetForecast()
        
    }
    
    @IBAction func switchSource(_ sender: UISwitch) {
        if sender.isOn {
            navigationItem.title = Constants.liveTitle
            presenter?.didSetSource(source: .live)
            presenter?.didGetForecast()
        } else {
            navigationItem.title = Constants.localTitle
            presenter?.didSetSource(source: .local)
            presenter?.didGetForecast()
        }
    }
    
    @IBAction func choseCity(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            presenter?.didSetCity(.munich)
        case 1:
            presenter?.didSetCity(.newyork)
        case 2:
            presenter?.didSetCity(.london)
        default:
            break
        }
        presenter?.didGetForecast()
    }
}

extension ForecastViewController: ForecastViewControllerInterface {
    func showWeatherForecast(weather: Weather) {
        DispatchQueue.main.async { [weak self] in
            self?.weatherTable.reloadData()
        }
    }
    
    func showError(error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.presentAlert(description: error, completion: nil)
            self?.weatherTable.reloadData()
        }
    }
}

extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath) as! DayCell
        currentRow = indexPath.row
        let startIndex = currentRow * 8
        let lastindex = startIndex + 8
        let currentDate = presenter?.weather?.list[currentRow * 8].dtTxt.toDate()
        
        cell.monthLabel.text = currentDate?.getMonth()
        cell.dayLabel.text = currentDate?.getDay()
        
        cell.listItems = presenter?.weather?.list.enumerated().filter{ $0.offset >= startIndex && $0.offset <= lastindex }.map{ $0.element }
        
        cell.reloadHours()
        
        return cell
    }
    
}
