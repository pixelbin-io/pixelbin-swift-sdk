import Foundation



 public class WatermarkRemoval {

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    /**
     * Method for Watermark Removal Plugin
     * 
     * @param Remove Text Bool (Default: false)
     
     * @param Remove Logo Bool (Default: false)
     
     * @param Box 1 string (Default: 0_0_100_100)
     
     * @param Box 2 string (Default: 0_0_0_0)
     
     * @param Box 3 string (Default: 0_0_0_0)
     
     * @param Box 4 string (Default: 0_0_0_0)
     
     * @param Box 5 string (Default: 0_0_0_0)
     
     * @return TransformationData.
     */
    public func remove(
        
        removetext: Bool? = nil,
        
        removelogo: Bool? = nil,
        
        box1: String? = nil,
        
        box2: String? = nil,
        
        box3: String? = nil,
        
        box4: String? = nil,
        
        box5: String? = nil
        
    ) -> TransformationData {
        // Create the values dictionary
        var values = [String: String]()

        
        
        
        if let removetext = removetext {
            values["rem_text"] = String(describing: removetext)
        }
        
        
        
        
        
        if let removelogo = removelogo {
            values["rem_logo"] = String(describing: removelogo)
        }
        
        
        
        
        
        if let box1 = box1, !box1.isEmpty {
            values["box1"] = box1
        }
        
        
        
        
        
        if let box2 = box2, !box2.isEmpty {
            values["box2"] = box2
        }
        
        
        
        
        
        if let box3 = box3, !box3.isEmpty {
            values["box3"] = box3
        }
        
        
        
        
        
        if let box4 = box4, !box4.isEmpty {
            values["box4"] = box4
        }
        
        
        
        
        
        if let box5 = box5, !box5.isEmpty {
            values["box5"] = box5
        }
        
        
        

        return TransformationData(
            plugin: "wm",
            name: "remove",
            values: values
        )
    }
}


