import Foundation

public class EraseBG {
    /**
     * Foreground Type options: general, ecommerce, car, human, object
     */
    public enum Industrytype: String {
        case general
        case ecommerce
        case car
        case human
        case object0 = "object"
    }

    /**
     * Method for EraseBG Background Removal Module
     *
     * @param Industry Type Industry type? (Default: general)
     * @param Add Shadow Bool (Default: false)
     * @param Refine Bool (Default: true)
     * @return TransformationData.
     */
    public func bg(
        industrytype: Industrytype? = nil,
        addshadow: Bool? = nil,
        refine: Bool? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let industrytype = industrytype {
            values["i"] = industrytype.rawValue
        }
        if let addshadow = addshadow {
            values["shadow"] = String(describing: addshadow)
        }
        if let refine = refine {
            values["r"] = String(describing: refine)
        }
        return TransformationData(
            plugin: "erase",
            name: "bg",
            values: values
        )
    }
}
