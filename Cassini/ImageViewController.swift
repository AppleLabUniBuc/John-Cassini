//
//  ImageViewController.swift
//  Cassini
//
//  Created by LaboratoriOS Cronian Academy on 08/04/2017.
//  Copyright © 2017 John. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var imageURL: URL?{
        didSet{
            image = nil
            fetchImage()
        }
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    private func fetchImage(){
        
        if let url = imageURL{
            spinner?.startAnimating()
            DispatchQueue.global(qos: .userInteractive).async{
                
            let urlContents = try? Data(contentsOf:url)
            if let imageDate = urlContents{
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageDate)
                }
      
                }
            }
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self
            
            scrollView.addSubview(imageView)
            scrollView.contentSize = imageView.frame.size
            
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
        }
    }
    
    fileprivate var imageView = UIImageView()
    
    
    var image: UIImage?{
        get{
            return imageView.image
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            
            scrollView?.contentSize = imageView.frame.size
            
            spinner?.stopAnimating()
        }
    }
    
        
}


extension ImageViewController: UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
