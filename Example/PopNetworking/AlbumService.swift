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

class AlbumService: Fetchable {
    
    typealias Model = Album
    typealias ModelList = AlbumList
    
    private let disposeBag = DisposeBag()
    
    func fetchAlbums() {
        
        fetchList()
            .subscribeOn(Schedulers.io)
            .observeOn(Schedulers.main)
            .subscribe(onNext: { albumList in

                let albums = albumList.albums
                albums.forEach {
                    print($0)
                }

                }, onError: { error in

                    debugPrint(error)

            })
            .disposed(by: disposeBag)
        
    }
    
}
