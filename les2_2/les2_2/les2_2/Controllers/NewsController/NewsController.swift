//
//  NewsController.swift
//  les2_2
//
//  Created by Роман Чикишев on 21.04.2022.
//

import UIKit
import RealmSwift

class NewsController: UITableViewController {
    let news: [News] = []

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
    
    func loadNews(completion: @escaping(Result<Friend, ServiceError>) -> ()){
        let queryItemsNews = [
            URLQueryItem(name: "access_token", value: Storage.share.token),
            URLQueryItem(name: "filters", value: "post"),
            URLQueryItem(name: "count", value: "20"),
            URLQueryItem(name: "v", value: "5.81")]
        UniversalMetod().loadJson(path: "/method/newsfeed.get", queryItems: queryItemsNews)
            let jsonDecoder = JSONDecoder()

            do {
                let result = try jsonDecoder.decode(Friend.self, from: Storage.share.datafile as! Data)
                
                return completion(.success(result))
            } catch {
                completion(.failure(.parseError))
            }

    }

}

private extension NewsController {
    func fetchNewsFriends() {
        loadNews { [weak self] news in
            guard let self = self else { return }
            do {
                let arrayNews = try news.get().response.items
            }
            catch { }
            DispatchQueue.main.async {
                self.tableViewNews.reloadData()
            }
        }
    }
}

