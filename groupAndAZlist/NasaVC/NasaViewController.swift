//
//  NasaViewController.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

class NasaViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    lazy var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        setNasaViewModel()
        setcoustomlayout()
        enableNavigation()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideTheNavigationBar()
    }
    func enableNavigation() {
        NotificationCenter.default.addObserver(self, selector: #selector(enable), name: .enableNavigation, object: nil)
    }
    @objc func enable() {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func hideTheNavigationBar() {
        NotificationCenter.default.addObserver(self, selector: #selector(tapped), name: .navigationHide, object: nil)
    }
    @objc func tapped() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    private func setNasaViewModel() {
        viewModel.items.bind { [weak self] (items)in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    private func setcoustomlayout() {
        let layout = CarouselFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 250)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }

}

extension NasaViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.value?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.CellIdentifire.NasaCellCV, for: indexPath) as? NasaCollectionViewCell else { fatalError()}
        let item = viewModel.items.value![indexPath.row]
        
        cell.join(item)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 250)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = viewModel.items.value![indexPath.row]
        switch (item.action) {
            
        case .NASA_INFO:
            break
        case .TRAVAL:
            break
        case .ROCKETLAUNC:
            break
        case .NASA_PLANETARY:
            guard let vc = storyboard?.instantiateViewController(withIdentifier: String.StoryBoardIdentity.MainVC) as? MainViewController else { fatalError()}
            self.navigationController?.pushViewController(vc, animated: true)
        case .SPACESHIP:
            break
        }
    }
    
    
}
