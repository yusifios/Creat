import UIKit

class cityController: UIViewController {
    var selectedCountry: Country?
   
    @IBOutlet weak var city: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        city.dataSource = self
        city.delegate = self
      
    }
}

extension cityController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedCountry?.cities?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cityCell", for: indexPath) as? cityCell else {
            return UICollectionViewCell()
        }
        cell.layer.borderWidth = 1
        
        if let city = selectedCountry?.cities![indexPath.row] {
            cell.bakuLabel.text = city.cityName 
            cell.bakuImage.image = UIImage(named: city.cityImage ?? "") 
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 10, height: view.frame.width / 2 - 10)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailController") as! detailController
        vc.selectedcity = selectedCountry?.cities![indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
