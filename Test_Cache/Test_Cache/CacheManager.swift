//
//  CacheManager.swift
//  Test_Cache
//
//  Created by 강창현 on 3/4/24.
//

import UIKit

final class CacheManager {
    static let shared = CacheManager()
    var cache: NSCache = NSCache<NSString,UIImage>()
    
    private init() { }
    
    func saveCache(image: UIImage, key: NSString) {
        cache.setObject(image, forKey: key)
    }
    
    func loadCacheImage(key: NSString) -> UIImage? {
        return cache.object(forKey: key)
    }
    
    func saveDiskCache(image: UIImage) {
        do {
            guard
                let documentDirectory = FileManager.default.urls(
                    for: .documentDirectory,
                    in: .userDomainMask
                ).first
            else {
                return
            }
            let fileURL = documentDirectory.appendingPathComponent("catImage.jpeg")
            let imageData = image.jpegData(compressionQuality: 1)
            try imageData?.write(to: fileURL)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadDiskCacheImage() -> UIImage? {
        guard
            let documentDirectory = FileManager.default.urls(
                for: .documentDirectory,
                in: .userDomainMask
            ).first
        else {
            return nil
        }
        
        let fileURL = documentDirectory.appendingPathComponent("catImage.jpeg")
        
        guard
            FileManager.default.fileExists(atPath: fileURL.path)
        else {
            return nil
        }
        return UIImage(contentsOfFile: fileURL.path)
    }
}

