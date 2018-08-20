import UIKit
var url : String = "http://google.com?test=toto&test2=titi"
var request : NSMutableURLRequest = NSMutableURLRequest()
request.url = NSURL(string: url) as! URL
request.httpMethod = "GET"

NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue(), completionHandler:{ (response:URLResponse!, data: NSData!, error: NSError!) -> Void in
    var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
    let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
    
    if (jsonResult != nil) {
        // process jsonResult
    } else {
        // couldn't load JSON, look at error
    }
    
    
})
