//
//  GalleryController.swift
//  les2_2
//
//  Created by Роман Чикишев on 16.01.2022.
//

import UIKit

class GalleryController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuseIdentifierGalleryCell = "reuseIdentifierGalleryCell"
    var fotoArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "GalleryCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifierGalleryCell)

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
}

extension GalleryController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fotoArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierGalleryCell, for: indexPath) as? GalleryCell else {return UICollectionViewCell()}
        cell.configure(fotoPath: fotoArray[indexPath.item])
        return cell
    }
    
    
}

extension GalleryController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 3 - 30
        return CGSize(width: width, height: width)
    }
}

extension GalleryController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        let fotoViewController = FotoViewController()
        fotoViewController.foto = fotoArray[indexPath.item]
        self.navigationController?.pushViewController(fotoViewController, animated: true)
         
    }
}
