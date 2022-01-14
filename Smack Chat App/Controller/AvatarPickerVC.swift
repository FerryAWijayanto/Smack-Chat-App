//
//  AvatarPickerVC.swift
//  Smack Chat App
//
//  Created by Ferry Adi Wijayanto on 14/01/22.
//

import UIKit

class AvatarPickerVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var segementedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var avatarType: AvatarType = .dark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UIHelper.createCollectionViewFlowLayout()
    }

    @IBAction func segmentedChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            avatarType = .dark
        } else {
            avatarType = .light
        }
        collectionView.reloadData()
    }
    @IBAction func dismissBtn(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension AvatarPickerVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as! AvatarCell
        cell.configureCell(withIndex: indexPath.item, type: avatarType)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarType == .dark {
            UserDataService.shared.setAvatarName(name: "dark\(indexPath.item)")
        } else {
            UserDataService.shared.setAvatarName(name: "white\(indexPath.item)")
        }
        
        dismiss(animated: true)
    }
    
}

extension AvatarPickerVC: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        var columns: CGFloat
//
//        if UIScreen.main.bounds.width > 320 {
//            columns = 4
//        } else {
//            columns = 3
//        }
//
//        let spacing: CGFloat = 12
//        let totalHorizontalSpacing: CGFloat = (columns - 1) * spacing
//        let itemWidth = (collectionView.bounds.width - totalHorizontalSpacing) / columns
//
//        return CGSize(width: itemWidth, height: itemWidth)
//    }
}
