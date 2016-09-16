//
//  url.swift
//  AlgorithmsApp
//
//  Created by Danya on 15.09.16.
//  Copyright © 2016 Danya. All rights reserved.
//

import Foundation

class Url{
     class func open(url: NSURL) -> String? {
        do {
            return try String(contentsOfURL: url, encoding: NSUTF8StringEncoding)
        } catch let error as NSError {
            print(error.code)
            return nil
        }
    }
}