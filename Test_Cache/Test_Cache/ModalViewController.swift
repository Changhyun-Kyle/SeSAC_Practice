//
//  ModalViewController.swift
//  Test_Cache
//
//  Created by 신동오 on 2024/03/04.
//

import UIKit

final class ModalViewController: UIViewController {
    
    @IBOutlet private weak var catImageView: UIImageView!
    @IBOutlet private weak var catDiskImageView: UIImageView!
    @IBOutlet private weak var urlCatImageView: UIImageView!
    
    // MARK: - Private Property
    
    private let catUrlString = "https://i.kym-cdn.com/entries/icons/facebook/000/046/895/huh_cat.jpg"
    private let catDiskUrlString = "https://api.nudge-community.com/attachments/35176"
    private let catUrlCacheString = "https://cdn.metavv.com/prod/uploads/thumbnail/images/10043263/167100535142741_md.png"
    
    private lazy var cacheKey: NSString = NSString(string: catUrlString)
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInMemoryCacheImage()
        setOnDiskCacheImages()
    }
    
    // MARK: - Actions
    
    @IBAction private func bringCatButtonTapped(_ sender: UIButton) {
        loadImage(from: catUrlString, into: catImageView) { image in
            CacheManager.shared.saveCache(image: image, key: self.cacheKey)
        }
    }
    
    @IBAction private func bringURLCatButtonTapped(_ sender: UIButton) {
        loadImage(from: catUrlCacheString, into: urlCatImageView)
    }
    
    @IBAction private func bringDiskCatButtonTapped(_ sender: UIButton) {
        loadImage(from: catDiskUrlString, into: catDiskImageView) { image in
            CacheManager.shared.saveDiskCache(image: image)
        }
    }
}

// MARK: - Private Methods

private extension ModalViewController {
    func setInMemoryCacheImage() {
        guard
            let image = CacheManager.shared.loadCacheImage(key: cacheKey)
        else {
            return
        }
        catImageView.image = image
    }
    
    func setOnDiskCacheImages() {
        guard
            let diskImage = CacheManager.shared.loadDiskCacheImage(),
            let test = URLCache.shared.cachedResponse(for: URLRequest(url: URL(string: catUrlCacheString)!))
        else {
            return
        }
        catDiskImageView.image = diskImage
        urlCatImageView.image = UIImage(data: test.data)
    }
    
    func loadImage(from urlString: String, into imageView: UIImageView, completion: ((UIImage) -> Void)? = nil) {
        guard let url = URL(string: urlString) else {
            print("Failed to create URL")
            return
        }
        var cacheResponse = CachedURLResponse()
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed to load image: \(error.localizedDescription)")
                return
            }
            
            guard
                let data = data,
                let image = UIImage(data: data),
                let response = response
            else {
                print("Failed to convert data to image")
                return
            }
            cacheResponse = CachedURLResponse(response: response, data: data)
            DispatchQueue.main.async {
                imageView.image = image
                completion?(image)
            }
        }
        task.resume()
        URLCache.shared.storeCachedResponse(cacheResponse, for: task)
    }
}
