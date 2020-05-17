//
//  CbmBasic.swift
//  CbmBasic
//
//  Created by Gregori, Lars on 04.05.20.
//

import Foundation
import Libcbmbasic

@objc(Cbmbasic)
public final class Cbmbasic : NSObject {
    
    @objc public override init() {
    }
    
    public func run() {
        Libcbmbasic.main(1, nil)
    }
    
    public func cmd(command: String) {
        Libcbmbasic.setCommand(command);
    }
    
    public func read() -> String {
        func getChar() -> Character {
            return Character(UnicodeScalar(popChar()))
        }
        
        var buf = "";
        var c = getChar()
        while c != Character(UnicodeScalar(255)) {
            buf += String(c)
            c = getChar()
        }
        return buf;
    }
}
