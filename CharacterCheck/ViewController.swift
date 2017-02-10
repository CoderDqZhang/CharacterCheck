//
//  ViewController.swift
//  characterCheck
//
//  Created by Zhang on 10/02/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit


class ResultCharacte: NSObject {
    var str:String!
    var range:NSRange!
    init(str:String, range:NSRange) {
        self.str = str
        self.range = range
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        label.text = "测试请看控制台\n please check at console"
        label.textAlignment = .center
        label.numberOfLines = 0
        self.view.addSubview(label)
        
        super.viewDidLoad()
        let testStr_en = "hello , I love you very much, love love "
        let str_en = "l"
        let result_en = self.logResult(with: str_en, str: testStr_en)
        self.testPrintResult(result: result_en)
        
        print("===========================")
        
        let testStr_ch = "我来测试一个特别牛逼的东西"
        let str_ch = "东西"
        let result_ch = self.logResult(with: str_ch, str: testStr_ch)
        self.testPrintResult(result: result_ch)
        print("===========================")
        let testStr_emoji = "我来😢测试一个特别😢牛逼的😂东西"
        let str_emoji = "😂"
        let result_emoji = self.logResult(with: str_emoji, str: testStr_emoji)
        self.testPrintResult(result: result_emoji)
        print("===========================")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func logResult(with regexRule:String, str:String) -> NSArray {
        let regex = try! NSRegularExpression(pattern: regexRule, options: .caseInsensitive)
        let results = regex.matches(in: (str as NSString) as String, options: .withTransparentBounds, range: NSRange.init(location: 0, length: str.length))
        let resultArray = NSMutableArray.init(capacity: results.count)
        for result in results {
            resultArray.add(ResultCharacte.init(str: regexRule, range: result.range))
        }
        return resultArray
    }
    
    func testPrintResult(result:NSArray) {
        for item in result {
            let characte = item as! ResultCharacte
            print("testStr \((characte.str)!), with range is NSRange(\(characte.range.location), \(characte.range.length))" )
        }
    }

}

extension String {
    var length: Int { return self.characters.count }
}

