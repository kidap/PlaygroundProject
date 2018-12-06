//
//  CachedImageView.swift
//  Reusables
//
//  Created by Karlo Pagtakhan on 10/22/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit


class CachedImageView: UIImageView {

    let cache = NSCache<NSString, UIImage>()

    func loadImage(fromURL urlString: String) {

        guard let url = URL(string: urlString) else { return }

        let urlString = NSString(string: urlString)
        checkCache(for: urlString)

        let urlRequest = URLRequest(url: url)


        let dataTask = URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, response, error) in

            guard let self = self else { return }

            print("data task called")

            guard let data = data else { return }

            guard let downloadedImage = UIImage(data: data) else { return }

            print("Getting image for url: \(urlString)")


            DispatchQueue.main.async {
                self.image = downloadedImage
            }

            print("Updating cache")
            self.cache.setObject(downloadedImage, forKey: urlString)

        }

        dataTask.resume()

    }

    func checkCache(for urlString: NSString) {
        let urlString = NSString(string: urlString)
        guard let cachedImage = cache.object(forKey: urlString) else { return }

        DispatchQueue.main.async {
            self.image = cachedImage
        }

        print("Getting image from cache for url: \(urlString)")
    }

}
