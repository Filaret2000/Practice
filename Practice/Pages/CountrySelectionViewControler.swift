//
//  CountrySelectionViewControler.swift
//  Practice
//
//  Created by Practica on 01.08.2022.
//

import UIKit

struct Country {
    let name: String
    let flagImage: UIImage
}

class CountrySelectionViewControler: UIViewController {

    // outlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var countryListPopView: UIView!
    @IBOutlet weak var tableView: UITableView!

    private var countryList: [(name: String, flag: String)] = [
        ("Germania", "country_de"),
        ("Romania", "country_ro"),
        ("Belgia", "country_be")
    ]
    private lazy var countryResultsList: [(name: String, flag: String)] = countryList

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {

    }
}

extension CountrySelectionViewControler: UITableViewDelegate {

    // MARK: - TableView delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchBar.resignFirstResponder()

        let selectedCountry = countryResultsList[indexPath.row].name
        print(selectedCountry)

        dismiss(animated: true, completion: nil)
    }
}

extension CountrySelectionViewControler: UITableViewDataSource {

    // MARK: - TableView datasource

    func tableView(_ tableView: UITableView, numberOfRowsInSection _: Int) -> Int {
        countryResultsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell

        let tuple = countryResultsList[indexPath.row]
        cell.nameLabel.text = tuple.name
        cell.countryImageView.image = UIImage(named: tuple.flag)

        return cell
    }

}

extension CountrySelectionViewControler: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            countryResultsList = countryList
        } else {
            countryResultsList = countryList.filter { $0.name.contains(searchText) }
        }
        tableView.reloadData()
    }
}

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
}


protocol Seat {
    func getPossition() -> Float?
}

class AutomaticalSeat: Seat {

    var seatPossitionSensor: Any?

    func getPossition() -> Float? {
        return /* seatPossitionSensor.getSensorValue() */ 10
    }
}


final class Seat2 {
    func getPossition() -> Float? {
        return 0
    }
}

protocol ArmPossitionProtocol {
    func getArmrestPossition() -> Float
}

extension Seat2: ArmPossitionProtocol {
    func getArmrestPossition() -> Float {
        getPossition() ?? 0
    }
}


class ManualSeat {

    func getArmrestPossition() -> Float {
        0
    }
}

//extension ManualSeat: Seat {
//
//    func getPossition() -> Float? {
//        nil
//    }
//}

class SteeringWheel {

    func getAngle() -> Float {
        0
    }
}

class Car {
    let steeringWheel: SteeringWheel
    let driverSeat: ArmPossitionProtocol

    init(steeringWheel: SteeringWheel, driverSeat: ArmPossitionProtocol) {
        self.steeringWheel = steeringWheel
        self.driverSeat = driverSeat
        let _ = steeringWheel.getAngle()
    }

    func ceva() {

        let car = Car(steeringWheel: SteeringWheel(),
                      driverSeat: Seat2())
        (car.driverSeat as? ManualSeat)?.getArmrestPossition()
        let manualSeat = ManualSeat()
        manualSeat.getArmrestPossition()
    }
}


