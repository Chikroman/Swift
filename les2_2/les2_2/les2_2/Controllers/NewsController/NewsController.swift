//
//  NewsController.swift
//  les2_2
//
//  Created by Роман Чикишев on 21.04.2022.
//

import UIKit

class NewsController: UITableViewController {
    let news = NewsArray.iNeedNews()
    

    @IBOutlet weak var tableViewNews: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewNews.rowHeight = UITableView.automaticDimension
        tableViewNews.estimatedRowHeight = 600
        tableViewNews.sectionHeaderTopPadding = 0
        tableViewNews.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewNews.dequeueReusableCell(withIdentifier: "NewsCellMain", for: indexPath) as? NewsMainViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: news[indexPath.section])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let header = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1))
        header.backgroundColor = .gray
        return header
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        5.0
    }

}

class NewsArray {
    static func iNeedNews() -> [NewsCellModel] {
        return [NewsCellModel(nameFriend: FriendModel(name: "Дес",
                                                              image: "Des1",
                                                              friendsPhoto: []),
                                      postDate: "23.10.2021",
                                      postText: "Всем привет)))",
                                      newsImageNames: ["Des1", "Des2"]),
                NewsCellModel(nameFriend: FriendModel(name: "Сидр",
                                                                      image: "Sidor1",
                                                                      friendsPhoto: []),
                                              postDate: "24.10.2021",
                                              postText: "Сидим учим)))",
                                              newsImageNames: ["Sidor1", "Sidor2"])]
                }
                
}
