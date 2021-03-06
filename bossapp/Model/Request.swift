//
//  Request.swift
//  bossapp
//
//  Created by yagom on 2017
//  Copyright © 2017년 yagom. All rights reserved.
//

import UIKit

// 플레이스 홀더로 사용할 이미지 객체
let placeHolderImage: UIImage? = UIImage(named: "placeholder")

// API 응답으로 받아오는 응답 JSON 모델
struct Response: Codable {
    let orders: [Order]
    
    enum CodingKeys: String, CodingKey {
        case orders = "posts"
    }
}

// API 요청을 담당할 구조체
struct Request {
    // MARK: - Private Properties
    //private static let ordersURL: URL = URL(string: "https://randomuser.me/api/1.1/?inc=name,nat,cell,picture&format=json&results=10&noinfo")!

    //     private static let ordersURL: URL = URL(string: "https://www.cashq.co.kr/ext/dyinfo/get_order3.php?id=B0006797&listsize=1")!

//    let ordersURL: URL = URL(string: "https://img.cashq.co.kr/api/get_order.php")!
    
    // 이미지 다운로드 디스패치 큐
    private static let imageDispatchQueue: DispatchQueue = DispatchQueue(label: "image")
    
    // 이미지 메모리 캐시를 위한 딕셔너리
    private static var cachedImage: [URL: UIImage] = [:]
}

// MARK: - Friends
extension Request {
    // 친구목록 요청
<<<<<<< HEAD
    static func orders(order_status: String, mb_id: String,_ completion: @escaping (_ orders: [Order]?) -> Void) {
        let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
        //let mb_id = "B0084702"
        
        var ordersURL: URL = URL(string: "https://img.cashq.co.kr/api/get_order.php?id=\(mb_id)&status=\(order_status)")!
        //B0084702
=======
    static func orders(order_status: String,_ completion: @escaping (_ orders: [Order]?) -> Void) {
        let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
        var ordersURL: URL = URL(string: "https://img.cashq.co.kr/api/get_order.php?id=B0084702&status="+order_status)!
>>>>>>> ca74339373deaa0e4e179d1f28cb5c95a7cf8c02
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let dataTask: URLSessionDataTask = session.dataTask(with: ordersURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            defer {
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
            
            guard let data = data else {
                print("전달받은 데이터 없음")
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let decoder:JSONDecoder = JSONDecoder()
            do {
                let decodedResponse: Response = try decoder.decode(Response.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedResponse.orders)
                }
                
                session.finishTasksAndInvalidate()
            } catch {
                print("응답 디코딩 실패")
                print(error.localizedDescription)
                dump(error)
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
        
        dataTask.resume()
    }
    
}


// MARK: - Image
extension Request {
    // 이미지 데이터 요청
    static func image(_ url: URL, completion: @escaping (_ image: UIImage?) -> Void) {
        
        if let cachedImage: UIImage = self.cachedImage[url] {
            DispatchQueue.main.async {
                completion(cachedImage)
                return
            }
        }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        imageDispatchQueue.async {
            defer {
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
            
            guard let data: Data = try? Data(contentsOf: url) else {
                print("데이터 - 이미지 변환 실패")
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let image: UIImage? = UIImage(data: data)
            cachedImage[url] = image
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}
