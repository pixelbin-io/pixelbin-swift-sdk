//
//  Trasformation.swift
//  SDKExample
//
//  Created by Dipendra Sharma on 07/06/24.
//

import Foundation

class Transformation {
    var plugin: String
    var name: String
    var values: [String: Any]
    
    init(plugin: String, name: String, values: [String: Any] = [String: Any]()) {
        self.plugin = plugin
        self.name = name
        self.values = values
    }
    
    func encode() -> String {
        let parametersString = values.map { key, value in
            "\(key):\(String(describing: value))"
        }.joined(separator: ",")
        
        if parametersString.isEmpty {
            return "\(plugin).\(name)()"
        } else {
            return "\(plugin).\(name)(\(parametersString))"
        }
    }
}

extension Array where Element: Transformation {
    func encode() -> String {
        var finalString = ""
        for (index, item) in self.enumerated() {
            let itemString = item.encode()
            if self.count == 1 || index == 0 {
                finalString = itemString
            } else {
                finalString += "~" + itemString
            }
        }
        return finalString
    }
}


extension String {
    func decode() -> [Transformation] {
        var transformations = [Transformation]()
        let transformationStrings = self.split(separator: "~")
        
        for transformationString in transformationStrings {
            // Split the plugin and name part
            let mainComponents = transformationString.split(separator: "(", maxSplits: 1, omittingEmptySubsequences: true)
            guard mainComponents.count == 2 else { continue }
            
            // Extract plugin and name
            let pluginAndName = mainComponents[0].split(separator: ".")
            guard pluginAndName.count == 2 else { continue }
            
            let plugin = String(pluginAndName[0])
            let name = String(pluginAndName[1])
            
            // Extract values
            var values = [String: Any]()
            let parametersPart = mainComponents[1].dropLast() // remove the trailing ')'
            let parameterPairs = parametersPart.split(separator: ",")
            
            for parameterPair in parameterPairs {
                let keyValue = parameterPair.split(separator: ":", maxSplits: 1)
                if keyValue.count == 2 {
                    let key = String(keyValue[0])
                    let value = String(keyValue[1])
                    values[key] = value
                }
            }
            
            // Create and append the transformation
            let transformation = Transformation(plugin: plugin, name: name, values: values)
            transformations.append(transformation)
        }
        
        return transformations
    }
    
    func hasTransformation() -> Bool {
        let pattern = #"([a-z]+\.[a-z]+\([^)]*\)(~[a-z]+\.[a-z]+\([^)]*\))*)"#
        let regex = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: self.utf16.count)
        return regex.firstMatch(in: self, options: [], range: range) != nil
    }
}

//
//class NSFWDetection : Transformation {
//    let minimulConfidence: Int
//    
//    init(minimulConfidence: Int) {
//        super.init(name: "nsfw", values: ["m": minimulConfidence], plugin: "detect")
//    }
//}
