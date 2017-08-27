//
//  XPathInterface.swift
//  NagBar
//
//  Created by Volen Davidov on 10/25/15.
//  Copyright © 2015 Volen Davidov. All rights reserved.
//

import Foundation

protocol XPathInterface {
    func getXPathHostQuery() -> String
    func getXPathHostQueryStatus() -> String
    func getXPathHostQueryLastCheck() -> String
    func getXPathHostQueryDuration() -> String
    func getXPathHostQueryStatusInformation() -> String
    func getXPathHostQueryItemUrl() -> String
    
    func getXPathServiceQuery() -> String
    func getXPathServiceQueryStatus() -> String
    func getXPathServiceQueryLastCheck() -> String
    func getXPathServiceQueryDuration() -> String
    func getXPathServiceQueryAttempt() -> String
    func getXPathServiceQueryStatusInformation() -> String
    func getXPathServiceQueryItemUrl() -> String
    
    func getXPathHostpageQuery() -> String
}