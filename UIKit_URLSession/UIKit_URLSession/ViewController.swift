//
//  ViewController.swift
//  UIKit_URLSession
//
//  Created by 강창현 on 2/7/24.
//

import UIKit
import WebKit

final class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var images: [Int:UIImage] = [:]
    private let urls: [Int:String] = [
        0:"https://wallpaperaccess.com/download/europe-4k-1369012",
        1:"https://wallpaperaccess.com/download/europe-4k-1318341",
        2:"https://wallpaperaccess.com/download/europe-4k-1379801",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        for (index,url) in urls {
            self.loadImage(urlString: url, row: index)
        }
    }
}

private extension ViewController {
    func loadImage(urlString: String, row: Int) {
       let url = URL(string: urlString)!
       let task = URLSession.shared.dataTask(with: url) { data, response, error in
           if let error = error {
               print(error)
           }
           guard
               let httpResponse = response as? HTTPURLResponse,
               (200...299).contains(httpResponse.statusCode)
           else {
               return
           }
           guard
               let data = data,
               let image = UIImage(data: data)
           else {
               return
           }
           DispatchQueue.main.async {
               self.images.updateValue(image, forKey: row)
               self.tableView.reloadData()
           }
       }
       task.resume()
   }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section + 2)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard 
            let cell = tableView.dequeueReusableCell(withIdentifier: MyCell.identifier) as? MyCell
        else {
            return MyCell()
        }
        let image = self.images[indexPath.row]
        cell.configureCell(indexPath: indexPath, image: image)
        return cell
    }
}

class MyCell: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.reset()
    }
    
    func configureCell(indexPath: IndexPath, image: UIImage?) {
        if indexPath.section <= 4 {
            self.textLabel?.text = "(\(indexPath.section), \(indexPath.row))"
        } else {
            self.textLabel?.text = ""
        }
        
        if indexPath.row == 3 {
            self.backgroundColor = .red
        }
        
        guard let image else { return }
        self.imageView?.image = image
    }
}

private extension MyCell {
    func reset() {
        self.backgroundColor = .white
        self.textLabel?.text = ""
        self.imageView?.image = nil
    }
}
