//
//  ViewController.swift
//  Cassini
//
//  Created by LaboratoriOS Cronian Academy on 08/04/2017.
//  Copyright © 2017 John. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let destinationvc = segue.destination as? ImageViewController {
            destinationvc.imageURL = CassiniURL.NASAImage(named: segue.identifier)
            destinationvc.title = (sender as? UIButton)?.currentTitle
        }
    }
}


