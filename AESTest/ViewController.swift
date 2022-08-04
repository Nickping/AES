//
//  ViewController.swift
//  AESTest
//
//  Created by Euijoon Jung on 2022/08/01.
//

import UIKit
import CryptoSwift


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        version1()
      
    }
    
    func version1() {
        let defaultKey: String = "ckswnfbsghks"
        
        let dictionay: [String: Any?] = [
            "fcmToken" : "fSBjDYpNzkytnKsrpv9EKl:APA91bEHgXp7gS5suGRqNWm9TkKDg7hM6TOxv5YCpouysccYVgCXbfJHhoS_zxkBeI9Ttu55CseeLY8Il_RWeWWEfx1aVJalxAqoFsM9agGrZ5riO_DmSLNn7t57jWYGGVgAceawcPeo",
            "model" : "iPhone 8plus",
            "groupId" : nil,
            "date":"2022-08-04 16:22:44"
        ]
        
        
//        {
//            "fcmToken":"f2azPqJbTgS9dDezM4716H:APA91bFgBZ-jZ_7b84yBjWRli6q1pOicStQGl1pLl4BMndP1He4HHefgXRYDI03Q2wVplbLpZE2lirJ5Yac4KE3S6a6Tldow2NV278Nbg4sSN5_xFiqjHT1TKpX5Wev5uqbwjozlvtTJ",
//            "model":"SM-A530N",
//            "groupId":null,
//            "date":"2022-07-27 10:58:44"
//        }
        
//        {
//            "fcmToken":"dKe6KU0AvUI3jhZXggiobu:APA91bHeTlX4gb1P2EykzqlynjMS4KOkqYBHSu64WYCK401IwV_KFFLU0uP4zjOCbElkhSBOg0erbhtoSiU_eh7ZTJa0uiSGCMdnMor9415DGLhQ5yYAEEUj72fTqP5YjWl4n996woXg",
//            "model":"iPhone 8plus",
//            "groupId":null,
//            "date":"2022-08-01 01:10:44"
//        }
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: dictionay),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
            
            let encrypted = AES256Util.encrypt(string: jsonString)
            
            print(encrypted)
            
            print(AES256Util.decrypt(encoded: encrypted))
        }
        
        
        print("dKe6KU0AvUI3jhZXggiobu:APA91bHeTlX4gb1P2EykzqlynjMS4KOkqYBHSu64WYCK401IwV_KFFLU0uP4zjOCbElkhSBOg0erbhtoSiU_eh7ZTJa0uiSGCMdnMor9415DGLhQ5yYAEEUj72fTqP5YjWl4n996woXg".count)
        
        print("f2azPqJbTgS9dDezM4716H:APA91bFgBZ-jZ_7b84yBjWRli6q1pOicStQGl1pLl4BMndP1He4HHefgXRYDI03Q2wVplbLpZE2lirJ5Yac4KE3S6a6Tldow2NV278Nbg4sSN5_xFiqjHT1TKpX5Wev5uqbwjozlvtTJ".count)
        
    }
    
    func version2() {
        let defaultKey: String = "ckswnfbsghks"
        let string =
"""
{
    "fcmToken":"fSBjDYpNzkytnKsrpv9EKl:APA91bEHgXp7gS5suGRqNWm9TkKDg7hM6TOxv5YCpouysccYVgCXbfJHhoS_zxkBeI9Ttu55CseeLY8Il_RWeWWEfx1aVJalxAqoFsM9agGrZ5riO_DmSLNn7t57jWYGGVgAceawcPeo",
    "model":"iPhone 8plus",
    "groupId":null,
    "date":"2022-08-04 17:09:44"
}
"""

//        let string = """
//{"fcmToken":"fSBjDYpNzkytnKsrpv9EKl:APA91bEHgXp7gS5suGRqNWm9TkKDg7hM6TOxv5YCpouysccYVgCXbfJHhoS_zxkBeI9Ttu55CseeLY8Il_RWeWWEfx1aVJalxAqoFsM9agGrZ5riO_DmSLNn7t57jWYGGVgAceawcPeo","model":"iPhone8Plus","groupId":null,"date":"2022-08-04 16:59:44"
//}
//"""
//
        

        
            
            let encrypted = AES256Util.encrypt(string: string)
            
            print(encrypted)
            
            print(AES256Util.decrypt(encoded: encrypted))
        
        
        print("dKe6KU0AvUI3jhZXggiobu:APA91bHeTlX4gb1P2EykzqlynjMS4KOkqYBHSu64WYCK401IwV_KFFLU0uP4zjOCbElkhSBOg0erbhtoSiU_eh7ZTJa0uiSGCMdnMor9415DGLhQ5yYAEEUj72fTqP5YjWl4n996woXg".count)
        
        print("f2azPqJbTgS9dDezM4716H:APA91bFgBZ-jZ_7b84yBjWRli6q1pOicStQGl1pLl4BMndP1He4HHefgXRYDI03Q2wVplbLpZE2lirJ5Yac4KE3S6a6Tldow2NV278Nbg4sSN5_xFiqjHT1TKpX5Wev5uqbwjozlvtTJ".count)
        
    }


}



 
//라이브러리 : https://github.com/krzyzanowskim/CryptoSwift
//pod 'CryptoSwift', '~> 1.3.8'
class AES256Util {
    //키값 32바이트: AES256(24bytes: AES192, 16bytes: AES128)
    private static let SECRET_KEY = "ckswnfbsghks"
    private static let IV = "1234123443214321"
 
    static func encrypt(string: String) -> String {
        guard !string.isEmpty else { return "" }
        return try! getAESObject().encrypt(string.bytes).toBase64() ?? ""
    }
 
    static func decrypt(encoded: String) -> String {
        let datas = Data(base64Encoded: encoded)
 
        guard datas != nil else {
            return ""
        }
 
        let bytes = datas!.bytes
        let decode = try! getAESObject().decrypt(bytes)
 
        return String(bytes: decode, encoding: .utf8) ?? ""
    }
 
    private static func getAESObject() -> AES {
        let keyDecodes : Array<UInt8> = Array(SECRET_KEY.bytes.sha256())
        let ivDecodes : Array<UInt8> = Array(IV.utf8)
        let aesObject = try! AES(key: keyDecodes, blockMode: CBC(iv: ivDecodes), padding: .pkcs5)
//
//        let aesObject = try! AES(key: SECRET_KEY, iv: IV)
        return aesObject
    }
}
