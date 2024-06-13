import Foundation

public class NumberPlateDetection {
    /**
     * Method for Number Plate Detection Plugin
     *
     * @return TransformationData.
     */
    public func detect(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary

        let values = [String: String]()

        return TransformationData(
            plugin: "numPlate",
            name: "detect",
            values: values
        )
    }
}
