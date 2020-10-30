//
//  DataController.swift
//  IRDB_SAL
//
//  Created by Sean Logsdon on 10/22/20.
//

import UIKit

class DataController: NSObject {

    let JSONURL = "https://api.jsonbin.io/b/5eb061a247a2266b1472bcf9/1"
    
    var dataModel: MediaDataModel?
    
    func getJSONData(completion: @escaping ( _ dataModel: MediaDataModel) -> ()) {
     
        let  jsonUrl = URL(string: JSONURL)
        
        let dataTask = URLSession.shared.dataTask(with: jsonUrl!) {
        (data, response, error) in
  
            guard let thisData = data else {
                return
            }
        
            do {
                let decoder = JSONDecoder()
                let thisMediaData = try decoder.decode(MediaDataModel.self, from:
                thisData)
                
                self.dataModel = thisMediaData
                print(thisMediaData.franchise[0].entries[0].name)
                
                
                
            } catch let err {
                print("error was: ", err)
            }
                // call back the completionHandler and let them know we are done
                
                // go back to main thread
                DispatchQueue.main.async {
                    //wutever
                    completion(self.dataModel!)
                }
                
            }
            dataTask.resume()
        }
    }
