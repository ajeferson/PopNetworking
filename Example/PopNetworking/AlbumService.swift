//
//  AlbumService.swift
//  PopNetworking_Example
//
//  Created by Alan Jeferson on 23/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import PopNetworking

class AlbumService: Fetcher {
    
    typealias Model = Album
    
    private let disposeBag = DisposeBag()
    
    func fetchAlbums() {
        
//        fetchList()
//            .subscribeOn(Schedulers.io)
//            .observeOn(Schedulers.main)
//            .subscribe(onNext: { albums in
//
//                albums.forEach {
//                    print($0)
//                }
//
//            }, onError: { error in
//
//                debugPrint(error)
//
//            })
//            .disposed(by: disposeBag)
        
//        fetchList(atPath: "top")
//            .subscribeOn(Schedulers.io)
//            .observeOn(Schedulers.main)
//            .subscribe(onNext: { albums in
//
//                albums.forEach {
//                    print($0)
//                }
//
//            }, onError: { error in
//
//                debugPrint(error)
//
//            })
//            .disposed(by: disposeBag)

        let album = Album(id: 1)
        fetchOne(album)
            .subscribeOn(Schedulers.io)
            .observeOn(Schedulers.main)
            .subscribe(onNext: { album in

                print(album)

            }, onError: { error in

                debugPrint(error)

            })
            .disposed(by: disposeBag)
        
    }
    
}
