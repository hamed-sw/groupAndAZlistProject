//
//  DetailViewController.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var toolbar: UIToolbar!
    lazy var viewModel = DetailViewModel()
    var id: String = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getImageforCollection(id: id)
        print(viewModel.arrayCollection)
        viewModel.getDetail(id: id)
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()

    }
    
    func custoninit(id:String) {
        self.id = id
        }
    
    func registerCell() {
        tableView.register(UINib(nibName: String.CellIdentifire.detailImageCell, bundle: nil), forCellReuseIdentifier: String.CellIdentifire.detailImageCell)
        tableView.register(UINib(nibName: String.CellIdentifire.detailExplanationCell, bundle: nil), forCellReuseIdentifier: String.CellIdentifire.detailExplanationCell)

    }

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String.CellIdentifire.detailImageCell, for: indexPath) as? DetailImageTableViewCell else {fatalError() }
            cell.nasaImages = viewModel.arrayCollection
            return cell
        } else  {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String.CellIdentifire.detailExplanationCell, for: indexPath) as? DetailExplanationTableViewCell else {fatalError() }
            cell.explanationLabel.text = "Explanation"
            cell.detailLabel.text = viewModel.inforArray[indexPath.row].explanation
            
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellHeight:CGFloat = CGFloat()

        if indexPath.section == 0 {
               cellHeight = 500
           }
           else  {
               cellHeight = 300
           }
           return cellHeight
        
    }
    
}
