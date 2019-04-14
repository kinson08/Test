import UIKit

import Alamofire

Alamofire.request(.GET, "https://httpbin.org/get").responseString {
    response in{
        print(response.result)
    }
}

