import Foundation



 public class CheckObjectSize {

    
    
    

    /**
     * Method for Calculates the percentage of the main object area relative to image dimensions.
     * 
     * @param Object Threshold Percent Int (Default: 50)
     
     * @return TransformationData.
     */
    public func detect(
        
        objectthresholdpercent: Int? = nil
        
    ) -> TransformationData {
        // Create the values dictionary
        var values = [String: String]()

        
        
        
        if let objectthresholdpercent = objectthresholdpercent {
            values["obj_threshold_perc"] = String(describing: objectthresholdpercent)
        }
        
        
        

        return TransformationData(
            plugin: "cos",
            name: "detect",
            values: values
        )
    }
}


