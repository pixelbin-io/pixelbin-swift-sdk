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

        case object
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
        industryptype: Industrytype? = nil,

        addshadow: Bool? = nil,

        refinpe: Bool? = nil

    ) -> TransformationData {
        // Determine if there are values to add to the dictionary

        var values = [String: String]()

        if let industryptype = industryptype {
            values["i"] = industryptype.rawValue
        }

        if let addshadow = addshadow {
            values["shadow"] = String(describing: addshadow)
        }

        if let refinpe = refinpe {
            values["r"] = String(describing: refinpe)
        }

        return TransformationData(
            plugin: "erase",
            name: "bg",
            values: values
        )
    }
}
