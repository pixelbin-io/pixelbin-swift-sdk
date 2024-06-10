import Foundation



 public class NumberPlateDetection {

    

    /**
     * Method for Number Plate Detection Plugin
     * 
     * @return TransformationData.
     */
    public func detect(
        
    ) -> TransformationData {
        // Create the values dictionary
        var values = [String: String]()

        

        return TransformationData(
            plugin: "numPlate",
            name: "detect",
            values: values
        )
    }
}


