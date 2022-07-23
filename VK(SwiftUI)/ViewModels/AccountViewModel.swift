//
//  AccountViewModel.swift
//  VK(SwiftUI)
//
//  Created by Никитка on 08.02.2022.
//

import Foundation
import RealmSwift

class AccountViewModel: ObservableObject {
    
    var realmAccount: Results<Account>?
    var account: Account = Account()
    let api = AccountAPI()
    let realmService = RealmService.shared
    
    let objectWillChange = ObjectWillChangePublisher()
    var token: NotificationToken?
    
    func fetch() {
        api.getAccountInfo { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .failure(let error):
                    self.pairAccountAndRealm()
                    print(error.localizedDescription)
                case .success(let account):
                    self.account = account
                    self.realmService.cacheAccount(account)
                    self.objectWillChange.send()
            }
        }
    }
    
    private func pairAccountAndRealm() {
        guard let realm = self.realmService.realm else { return }
        self.realmAccount = realm.objects(Account.self)
        guard let realmAccount = realmAccount else { return }
        let data = Array(realmAccount)
        if let account = data.first {
            self.account = account
        }
        
        self.token = realmAccount.observe { [weak self] _ in
            guard let self = self else { return }
            self.objectWillChange.send()
        }
    }
    
}
