import Foundation



 public class DetectBackgroundType {

    

    /**
     * Method for Classifies the background of a product as plain, clean or busy
     * 
     * @return TransformationData.
     */
    public func detect(
        
    ) -> TransformationData {
        // Create the values dictionary
        var values = [String: String]()

        

        return TransformationData(
            plugin: "dbt",
            name: "detect",
            values: values
        )
    }
}


