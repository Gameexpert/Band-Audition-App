//
//  audition.swift
//  Band-Audition-App
//
//  Created by VANDER HOEVEN, EVAN on 12/9/16.
//  Copyright © 2016 Copy Pasta Coding. All rights reserved.
//

import Foundation
protocol audition
{
    /*
    This protocol is for confomity in the application's audition forms. 
    It is essential to have the last name and the first name for sorting purposes. 
    All auditions must also contain this information anyway.
    */
    var first_name: String {get set}
    var last_name:String {get set}
    var comments: String {get set}
    var instrument: String {get set}
    var finalScore: Int {get set}
}
