//
//  RealmCacheService.swift
//  les2_2
//
//  Created by Роман Чикишев on 07.03.2022.
//

import RealmSwift
import Foundation

final class RealmCacheService {
    
    enum Errors: Error {
        case noRealmObjects(String)
        case noPrimaryKey(String)
        case filedToread(String)
    }
    var realm: Realm
    
    init() {
        do {
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            self.realm = try Realm(configuration: config)
            print(realm.configuration.fileURL ?? "")
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    func create<T: Object>(_ object: T){
        do {
            realm.beginWrite()
            realm.add(object, update: .modified)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    
    func create<T: Object>(objects: [T]){
        do {
            realm.beginWrite()
            realm.add(objects, update: .modified)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    
    func read<T: Object>(object: T.Type) -> Results<T> {
        return realm.objects(T.self)
    }
    
    func read<T: Object>(object: T.Type,
                         key: String,
                         completion: @escaping(Result<T, Error>) -> Void) {
        if let result = realm.object(ofType: T.self, forPrimaryKey: key) {
            completion(.success(result))
        } else {
            completion(.failure(Errors.filedToread("Failed to read objects")))
        }
    }
}
