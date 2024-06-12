import Foundation

class TransformationMap {
    static let hashMap: [String: TransformationData] = {
        var map = [String: TransformationData]()

        map["dbt.detect"] = Transformation.detectbackgroundtype()

        map["af.remove"] = Transformation.artifact()

        map["awsRek.detectLabels"] = Transformation.detectlabels()

        map["awsRek.moderation"] = Transformation.moderation()

        map["generate.bg"] = Transformation.backgroundgenerator()

        map["vg.generate"] = Transformation.variationgenerator()

        map["erase.bg"] = Transformation.erasebg()

        map["googleVis.detectLabels"] = Transformation.googlevisionplugin()

        map["imc.detect"] = Transformation.imagecentering()

        map["ic.crop"] = Transformation.intelligentcrop()

        map["oc.detect"] = Transformation.objectcounter()

        map["nsfw.detect"] = Transformation.nsfwdetection()

        map["numPlate.detect"] = Transformation.numberplatedetection()

        map["od.detect"] = Transformation.objectdetection()

        map["cos.detect"] = Transformation.checkobjectsize()

        map["ocr.extract"] = Transformation.textdetectionandrecognition()

        map["pwr.remove"] = Transformation.pdfwatermarkremoval()

        map["pr.tag"] = Transformation.producttagging()

        map["cpv.detect"] = Transformation.checkproductvisibility()

        map["remove.bg"] = Transformation.removebg()

        map["t.resize"] = Transformation.resize()

        map["t.compress"] = Transformation.compress()

        map["t.extend"] = Transformation.extend()

        map["t.extract"] = Transformation.extract()

        map["t.trim"] = Transformation.trim()

        map["t.rotate"] = Transformation.rotate()

        map["t.flip"] = Transformation.flip()

        map["t.flop"] = Transformation.flop()

        map["t.sharpen"] = Transformation.sharpen()

        map["t.median"] = Transformation.median()

        map["t.blur"] = Transformation.blur()

        map["t.flatten"] = Transformation.flatten()

        map["t.negate"] = Transformation.negate()

        map["t.normalise"] = Transformation.normalise()

        map["t.linear"] = Transformation.linear()

        map["t.modulate"] = Transformation.modulate()

        map["t.grey"] = Transformation.grey()

        map["t.tint"] = Transformation.tint()

        map["t.toFormat"] = Transformation.toformat()

        map["t.density"] = Transformation.density()

        map["t.merge"] = Transformation.merge()

        map["shadow.gen"] = Transformation.softshadowgenerator()

        map["sr.upscale"] = Transformation.superresolution()

        map["wmv.remove"] = Transformation.videowatermarkremoval()

        map["vd.detect"] = Transformation.viewdetection()

        map["wm.remove"] = Transformation.watermarkremoval()

        map["wmc.detect"] = Transformation.watermarkdetection()

        return map
    }()
}
