import Foundation



 public class WatermarkDetection {

    
    
    

    /**
     * Method for Watermark Detection Plugin
     * 
     * @param Detect Text Bool (Default: false)
     
     * @return TransformationData.
     */
    public func detect(
        
        detecttext: Bool? = nil
        
    ) -> TransformationData {
        // Create the values dictionary
        var values = [String: String]()

        
        
        
        if let detecttext = detecttext {
            values["detect_text"] = String(describing: detecttext)
        }
        
        
        

        return TransformationData(
            plugin: "wmc",
            name: "detect",
            values: values
        )
    }
}


