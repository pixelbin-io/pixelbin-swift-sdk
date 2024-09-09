import Foundation

public class Generate {
    /**
     * QR Error Correction Level options: L, M, Q, H
     */
    public enum Qrerrorcorrectionlevel: String {
        case l = "L"

        case m = "M"

        case q = "Q"

        case h = "H"
    }

    /**
     * Dots Type options: rounded, dots, classy, classy-rounded, square, extra-rounded
     */
    public enum Dotstype: String {
        case rounded

        case dots

        case classy

        case classy_rounded = "classy-rounded"

        case square

        case extra_rounded = "extra-rounded"
    }

    /**
     * Corner Square Type options: dot, square, extra-rounded
     */
    public enum Cornersquaretype: String {
        case dot

        case square

        case extra_rounded = "extra-rounded"
    }

    /**
     * Corner Dots Type options: dot, square
     */
    public enum Cornerdotstype: String {
        case dot

        case square
    }

    /**
     * Method for QRCode Plugin
     *
     * @param width Int (Default: 300)

     * @param height Int (Default: 300)

     * @param image custom (Default: )

     * @param margin Int (Default: 0)

     * @param qRTypeNumber Int (Default: 0)

     * @param qrErrorCorrectionLevel Qrerrorcorrectionlevel? (Default: Q)

     * @param imageSize Float (Default: 0.4)

     * @param imageMargin Int (Default: 0)

     * @param dotsColor String (Default: "000000")

     * @param dotsType Dotstype? (Default: square)

     * @param dotsBgColor String (Default: "ffffff")

     * @param cornerSquareColor String (Default: "000000")

     * @param cornerSquareType Cornersquaretype? (Default: square)

     * @param cornerDotsColor String (Default: "000000")

     * @param cornerDotsType Cornerdotstype? (Default: dot)

     * @return TransformationData.
     */
    public func generate(
        width: Int? = nil,

        height: Int? = nil,

        image: String? = nil,

        marginp: Int? = nil,

        qrptypenumber: Int? = nil,

        qrerrorcorrectionlevel: Qrerrorcorrectionlevel? = nil,

        imagesize: Float? = nil,

        imagemarginp: Int? = nil,

        dotscolor: String? = nil,

        dotsptype: Dotstype? = nil,

        dotsbgcolor: String? = nil,

        cornersquarecolor: String? = nil,

        cornersquareptype: Cornersquaretype? = nil,

        cornerdotscolor: String? = nil,

        cornerdotsptype: Cornerdotstype? = nil

    ) -> TransformationData {
        // Determine if there are values to add to the dictionary

        var values = [String: String]()

        if let width = width {
            values["w"] = String(describing: width)
        }

        if let height = height {
            values["h"] = String(describing: height)
        }

        if let image = image, !image.isEmpty {
            values["i"] = image
        }

        if let marginp = marginp {
            values["m"] = String(describing: marginp)
        }

        if let qrptypenumber = qrptypenumber {
            values["qt"] = String(describing: qrptypenumber)
        }

        if let qrerrorcorrectionlevel = qrerrorcorrectionlevel {
            values["qe"] = qrerrorcorrectionlevel.rawValue
        }

        if let imagesize = imagesize {
            values["is"] = String(describing: imagesize)
        }

        if let imagemarginp = imagemarginp {
            values["im"] = String(describing: imagemarginp)
        }

        if let dotscolor = dotscolor, !dotscolor.isEmpty {
            values["ds"] = dotscolor
        }

        if let dotsptype = dotsptype {
            values["dt"] = dotsptype.rawValue
        }

        if let dotsbgcolor = dotsbgcolor, !dotsbgcolor.isEmpty {
            values["bg"] = dotsbgcolor
        }

        if let cornersquarecolor = cornersquarecolor, !cornersquarecolor.isEmpty {
            values["csc"] = cornersquarecolor
        }

        if let cornersquareptype = cornersquareptype {
            values["cst"] = cornersquareptype.rawValue
        }

        if let cornerdotscolor = cornerdotscolor, !cornerdotscolor.isEmpty {
            values["cdc"] = cornerdotscolor
        }

        if let cornerdotsptype = cornerdotsptype {
            values["cdt"] = cornerdotsptype.rawValue
        }

        return TransformationData(
            plugin: "qr",
            name: "generate",
            values: values
        )
    }
}

public class Scan {
    /**
     * Method for QRCode Plugin
     *
     * @return TransformationData.
     */
    public func scan(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary

        let values = [String: String]()

        return TransformationData(
            plugin: "qr",
            name: "scan",
            values: values
        )
    }
}
