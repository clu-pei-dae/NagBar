//
//  NagBarTabController.swift
//  NagBar
//
//  Created by Volen Davidov on 14.01.16.
//  Copyright © 2016 Volen Davidov. All rights reserved.
//

import Foundation
import Cocoa

protocol InterfaceAction {
    func performAction()
}

class DefaultButton : NSButton, InterfaceAction {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        guard let identifier = self.identifier else {
            NSLog("Button identifier not defined")
            return
        }
        
        if Settings().boolForKey(identifier) {
            self.state = NSOnState
        } else {
            self.state = NSOffState
        }
    }
    
    override func mouseDown(with theEvent: NSEvent) {
        super.mouseDown(with: theEvent)
        self.performAction()
    }
    
    func performAction() {
        guard let identifier = self.identifier else {
            NSLog("Button identifier not defined")
            return
        }
        
        Settings().setBool(Bool(self.state), forKey: identifier)
    }
}

class DefaultPopUpButton : NSPopUpButton {
    
    var popUpButtons: Dictionary <String, Dictionary<Int, String>> {
        return [
            "flashStatusBarType": [1: "Shake", 2: "Flash", 3: "Bright Flash"],
            "statusInformationLength": [100: "100", 200: "200", 300: "300", 400: "400", 500: "500", 600: "600", 700: "700"],
            "sortColumn": [0: "None", 1: "Host", 2: "Service", 3: "Status", 4: "Last Check", 5: "Attempt", 6: "Duration"],
            "sortOrder": [1: "Ascending", 2: "Descending"]
        ]
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        guard let identifier = self.identifier else {
            NSLog("Button identifier not defined")
            return
        }
        
        guard let popUpButtonDict = self.popUpButtons[identifier] else {
            NSLog("Button identifier " + identifier + " not found in dictionary")
            return
        }
        
        for i in popUpButtonDict {
            if (Settings().integerForKey(identifier) == i.0) {
                self.selectItem(withTitle: i.1)
            }
        }
    }
    
    override func mouseDown(with theEvent: NSEvent) {
        super.mouseDown(with: theEvent)
        self.performAction()
    }
    
    func performAction() {
        guard let identifier = self.identifier else {
            NSLog("Button identifier not defined")
            return
        }
        
        for (popUpButton, values) in self.popUpButtons {
            if identifier != popUpButton {
                continue
            }
            
            for (id, text) in values {
                if self.titleOfSelectedItem == text {
                    Settings().setInteger(id, forKey: popUpButton)
                }
            }
        }
    }
}