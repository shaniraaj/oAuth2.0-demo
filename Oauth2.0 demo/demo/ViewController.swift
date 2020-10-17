//
//  ViewController.swift
//  demo
//
//  Created by SalesTrendz on 17/10/20.
//  Copyright © 2020 Demo. All rights reserved.
//

import UIKit
import OAuth2

class ViewController: UIViewController {

    var loader:OAuth2DataLoader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let oauth2 = OAuth2CodeGrant(settings: [
            "client_id": "F3DB9CFF18914FDC8008EC86FE4F0BF5",
            "client_secret": "7Fi1wAlIepWjWW3nKjInOFjRYb2ox-NPzn8bBHBfeUW-K_UP",
            "authorize_uri": "https://login.xero.com/identity/connect/authorize",
            "token_uri": "https://identity.xero.com/connect/token",   // code grant only
            "redirect_uris": ["demoapp://oauth/callback"],   // register your own "myapp" scheme in Info.plist
            "scope": "offline_access accounting.transactions openid profile email accounting.contacts accounting.settings",
            "secret_in_body": true,    // Github needs this
            "keychain": false,         // if you DON'T want keychain integration
        ] as OAuth2JSON)
        
        // Do any additional setup after loading the view.
        
        var dict = [String:Any]()
        dict["client_id"] = "F3DB9CFF18914FDC8008EC86FE4F0BF5"
        dict["client_secret"] = "7Fi1wAlIepWjWW3nKjInOFjRYb2ox-NPzn8bBHBfeUW-K_UP"
        dict["authorize_uri"] = "https://login.xero.com/identity/connect/authorize"
        dict["token_uri"] = "https://identity.xero.com/connect/token"
        dict["redirect_uri"] = "https://"//demoapp://oauth/callback
        dict["scope"] = "offline_access accounting.transactions openid profile email accounting.contacts accounting.settings"
        dict["response_type"] = "authorization_code"
        
        do{
            let url = try oauth2.authorizeURL(params: dict as? OAuth2StringDict)
            try oauth2.authorizer.openAuthorizeURLInBrowser(url)
            
                   oauth2.afterAuthorizeOrFail = { authParameters, error in
                       // inspect error or oauth2.accessToken / authParameters or do something else
                   }
        }
        catch{}
        
       
        
        
        
    }


}

