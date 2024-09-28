import UIKit

class CountryController: UIViewController {

    @IBOutlet weak var country: UICollectionView!
    
    let countries = [
        Country(countryName: "Azerbaijan",
                countryImage: "aze",
                cities: [
                    City(cityName: "Baku", cityText: .Baku, cityImage: "baku"),
                    City(cityName: "Mingechaur", cityText: .Mingechaur, cityImage: "ming"),
                    City(cityName: "Ganja", cityText: .Ganja, cityImage: "gence"),
                    City(cityName: "Shusha", cityText: .Shusha, cityImage: "susa")
                ]),
        Country(countryName: "Spain",
                countryImage: "spain",
                cities: [
                    City(cityName: "Madrid", cityText: .Madrid, cityImage: "madrid"),
                    City(cityName: "Barcelona", cityText: .Barcelona, cityImage: "barce"),
                    City(cityName: "Seville", cityText: .Seville, cityImage: "seville"),
                    City(cityName: "Valencia", cityText: .Valencia, cityImage: "valencia")
                ]),
        Country(countryName: "Poland",
                countryImage: "poland",
                cities: [
                    City(cityName: "Warsaw", cityText: .Warsaw, cityImage: "warsaw"),
                    City(cityName: "Krakow", cityText: .Krakow, cityImage: "krakow"),
                    City(cityName: "Poznan", cityText: .Poznan, cityImage: "poznan"),
                    City(cityName: "Wroclaw", cityText: .Wroclaw, cityImage: "wroclaw")
                ]),
        Country(countryName: "Italy",
                countryImage: "italy",
                cities: [
                    City(cityName: "Rome", cityText: .Rome, cityImage: "rome"),
                    City(cityName: "Milan", cityText: .Milan, cityImage: "milan"),
                    City(cityName: "Venice", cityText: .Venice, cityImage: "venice"),
                    City(cityName: "Florence", cityText: .Florence, cityImage: "florence")
                ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        country.dataSource = self
        country.delegate = self
    }
}

extension CountryController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CountryCell", for: indexPath) as? CountryCell else {
            return UICollectionViewCell()
        }
        cell.layer.borderWidth = 1
        cell.azeTitle.text = countries[indexPath.row].countryName
        cell.azeImg.image = UIImage(named: countries[indexPath.row].countryImage ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 10, height: view.frame.width / 2 - 10)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "cityController") as! cityController
        vc.selectedCountry = countries[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
