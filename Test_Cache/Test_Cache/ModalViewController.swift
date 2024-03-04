//
//  ModalViewController.swift
//  Test_Cache
//
//  Created by 신동오 on 2024/03/04.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var catImageView: UIImageView!
    
    // MARK: Private Property
    
    private let catUrlString = "https://i.kym-cdn.com/entries/icons/facebook/000/046/895/huh_cat.jpg"
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Functions

    @IBAction func bringCatButtonTapped(_ sender: UIButton) {
        loadImage(from: catUrlString, into: catImageView)
    }
    
    func loadImage(from urlString: String, into imageView: UIImageView) {
        guard let url = URL(string: urlString) else {
            print("Failed to create URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Failed to load image: \(error.localizedDescription)")
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("Failed to convert data to image")
                return
            }
            
            DispatchQueue.main.async {
                imageView.image = image
            }
        }.resume()
    }
}
