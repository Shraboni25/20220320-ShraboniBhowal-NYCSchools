//
//  NYCSchoolDetailViewController.swift
//  NYCSchools
//
//  Created by Shraboni on 3/19/22.
//

import UIKit

class NYCSchoolDetailViewController: UIViewController {

    @IBOutlet weak var schoolTitle: UILabel!
    @IBOutlet weak var mathScore: UILabel!
    @IBOutlet weak var readingScore: UILabel!
    @IBOutlet weak var writingScore: UILabel!
    
    var school : School!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.schoolTitle.text = school.name
        self.mathScore.text = school.mathScore
        self.readingScore.text = school.readingScore
        self.writingScore.text = school.writingScore
    }

}
