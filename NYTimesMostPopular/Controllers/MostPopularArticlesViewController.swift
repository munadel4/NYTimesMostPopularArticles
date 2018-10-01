//
//  MostPopularArticlesViewContro.swift
//  NYTimesMostPopular
//
//  Created by Munadel Qubbaj on 9/30/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import UIKit

class MostPopularArticlesViewController: UITableViewController {

    var detailViewController: ArticleDetailViewController? = nil
    let searchController = UISearchController(searchResultsController: nil)

    var articlesToBeFilledIntoArray = [ArticlesResults](){
        didSet {
            tableView.reloadData()
        }
    }
    private let rowHeight: CGFloat = 120

    override func viewDidLoad() {
        super.viewDidLoad()

        definesPresentationContext = true

        tableView.register(ArticlInfoTableViewCell.nib(), forCellReuseIdentifier: ArticlInfoTableViewCell.identifier())

        MostPopularArticlesAPI.getMostPopularArticles { (articles, success) in
            if let articleResults = articles?.results {
                self.articlesToBeFilledIntoArray = articleResults
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let article = articlesToBeFilledIntoArray[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! ArticleDetailViewController
                controller.article = article
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesToBeFilledIntoArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: UITableViewCell = UITableViewCell()
        guard let articlCell = tableView.dequeueReusableCell(withIdentifier: ArticlInfoTableViewCell.identifier(), for: indexPath) as? ArticlInfoTableViewCell else {
            return cell
        }
        let article = articlesToBeFilledIntoArray[indexPath.row]
        articlCell.configure(data: article)
        articlCell.accessoryType = .disclosureIndicator
        return articlCell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }
}
