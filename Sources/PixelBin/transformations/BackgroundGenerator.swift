import Foundation



 public class BackgroundGenerator {

    
    
    
    
    /**
     * Focus options: Product, Background
     */
    public enum Focus: String {
        
        case product = "Product"
        
        case background = "Background"
        
    }
    
    
    
    
    
    

    /**
     * Method for AI Background Generator
     * 
     * @param Background prompt custom (Default: YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr)
     
     * @param focus Focus? (Default: Product)
     
     * @param Negative prompt custom (Default: )
     
     * @param seed Int (Default: 123)
     
     * @return TransformationData.
     */
    public func bg(
        
        backgroundprompt: String? = nil,
        
        focus: Focus? = nil,
        
        negativeprompt: String? = nil,
        
        seed: Int? = nil
        
    ) -> TransformationData {
        // Create the values dictionary
        var values = [String: String]()

        
        
        
        if let backgroundprompt = backgroundprompt, !backgroundprompt.isEmpty {
            values["p"] = backgroundprompt
        }
        
        
        
        
        if let focus = focus {
            values["f"] = focus.rawValue
        }
        
        
        
        
        if let negativeprompt = negativeprompt, !negativeprompt.isEmpty {
            values["np"] = negativeprompt
        }
        
        
        
        
        
        if let seed = seed {
            values["s"] = String(describing: seed)
        }
        
        
        

        return TransformationData(
            plugin: "generate",
            name: "bg",
            values: values
        )
    }
}


