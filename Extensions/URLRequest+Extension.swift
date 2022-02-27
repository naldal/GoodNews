//
//  URLRequest+Extension.swift
//  GoodNews
//
//  Created by 송하민 on 2022/02/27.
//

import RxCocoa
import RxSwift
import UIKit

struct Resource<T: Decodable> {
    let url: URL
}

extension URLRequest {
    static func load<T>(resource: Resource<T>) -> Observable<T?> {
        return Observable.from([resource.url])
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
            }.map { data -> T? in
                return try? JSONDecoder().decode(T.self, from: data)
            }
    }
}
