//
//  AlwaysSuccessAccount.swift
//  App
//
//  Created by 翟泉 on 2019/3/29.
//

import Foundation
import CKB

class AlwaysSuccessAccount: Account {
    private let cellHash: H256
    private let scriptOutOpint: OutPoint

    public init(api: APIClient) throws {
        cellHash = try api.alwaysSuccessCellHash()
        scriptOutOpint = try api.alwaysSuccessScriptOutPoint()
        super.init(privateKey: "", api: api)
    }

    override var unlockScript: Script {
        return Script(version: 0, binary: nil, reference: cellHash, signedArgs: [], args: [])
    }

    override var deps: [OutPoint] {
        return [scriptOutOpint]
    }
}
