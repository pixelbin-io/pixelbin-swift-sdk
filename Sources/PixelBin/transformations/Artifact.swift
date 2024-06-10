import Foundation



 public class Artifact {

    

    /**
     * Method for Artifact Removal Plugin
     * 
     * @return TransformationData.
     */
    public func remove(
        
    ) -> TransformationData {
        // Create the values dictionary
        var values = [String: String]()

        

        return TransformationData(
            plugin: "af",
            name: "remove",
            values: values
        )
    }
}


