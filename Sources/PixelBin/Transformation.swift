import Foundation

public class Transformation {
    // DetectBackgroundType
    /**
     * Classifies the background of a product as plain, clean or busy
     *
     * @return The generated TransformationData.
     */
    public static func dbtDetect(
    ) -> TransformationData {
        // Call the generated class method
        return DetectBackgroundType().detect(
        )
    }

    // Basic
    /**
     * Basic Transformations
     *
     * @param height Height (Default: 0)
     * @param width Width (Default: 0)
     * @param fit Fit (Default: cover)
     * @param background Background (Default: 000000)
     * @param position Position (Default: center)
     * @param algorithm Algorithm (Default: lanczos3)
     * @param dpr Dpr (Default: 1)
     * @return The generated TransformationData.
     */
    public static func tResize(
        height: Int? = 0,
        width: Int? = 0,
        fit: Resize.Fit? = Resize.Fit.cover,
        background: String? = "000000",
        position: Resize.Position? = Resize.Position.center,
        algorithm: Resize.Algorithm? = Resize.Algorithm.lanczos3,
        dpr: Float? = 1
    ) -> TransformationData {
        // Call the generated class method
        return Resize().resize(
            height: height,
            width: width,
            fit: fit,
            background: background,
            position: position,
            algorithm: algorithm,
            dpr: dpr
        )
    }

    /**
     * Basic Transformations
     *
     * @param quality Quality (Default: 80)
     * @return The generated TransformationData.
     */
    public static func tCompress(
        quality: Int? = 80
    ) -> TransformationData {
        // Call the generated class method
        return Compress().compress(
            quality: quality
        )
    }

    /**
     * Basic Transformations
     *
     * @param top Top (Default: 10)
     * @param left Left (Default: 10)
     * @param bottom Bottom (Default: 10)
     * @param right Right (Default: 10)
     * @param background Background (Default: 000000)
     * @param bordertype Border type (Default: constant)
     * @param dpr Dpr (Default: 1)
     * @return The generated TransformationData.
     */
    public static func tExtend(
        top: Int? = 10,
        left: Int? = 10,
        bottom: Int? = 10,
        right: Int? = 10,
        background: String? = "000000",
        bordertype: Extend.Bordertype? = Extend.Bordertype.constant,
        dpr: Float? = 1
    ) -> TransformationData {
        // Call the generated class method
        return Extend().extend(
            top: top,
            left: left,
            bottom: bottom,
            right: right,
            background: background,
            bordertype: bordertype,
            dpr: dpr
        )
    }

    /**
     * Basic Transformations
     *
     * @param top Top (Default: 10)
     * @param left Left (Default: 10)
     * @param height Height (Default: 50)
     * @param width Width (Default: 20)
     * @param boundingbox Bounding box
     * @return The generated TransformationData.
     */
    public static func tExtract(
        top: Int? = 10,
        left: Int? = 10,
        height: Int? = 50,
        width: Int? = 20,
        boundingbox: String? = nil
    ) -> TransformationData {
        // Call the generated class method
        return Extract().extract(
            top: top,
            left: left,
            height: height,
            width: width,
            boundingbox: boundingbox
        )
    }

    /**
     * Basic Transformations
     *
     * @param threshold Threshold (Default: 10)
     * @return The generated TransformationData.
     */
    public static func tTrim(
        threshold: Int? = 10
    ) -> TransformationData {
        // Call the generated class method
        return Trim().trim(
            threshold: threshold
        )
    }

    /**
     * Basic Transformations
     *
     * @param angle Angle (Default: 0)
     * @param background Background (Default: 000000)
     * @return The generated TransformationData.
     */
    public static func tRotate(
        angle: Int? = 0,
        background: String? = "000000"
    ) -> TransformationData {
        // Call the generated class method
        return Rotate().rotate(
            angle: angle,
            background: background
        )
    }

    /**
     * Basic Transformations
     *
     * @return The generated TransformationData.
     */
    public static func tFlip(
    ) -> TransformationData {
        // Call the generated class method
        return Flip().flip(
        )
    }

    /**
     * Basic Transformations
     *
     * @return The generated TransformationData.
     */
    public static func tFlop(
    ) -> TransformationData {
        // Call the generated class method
        return Flop().flop(
        )
    }

    /**
     * Basic Transformations
     *
     * @param sigma Sigma (Default: 1.5)
     * @return The generated TransformationData.
     */
    public static func tSharpen(
        sigma: Float? = 1.5
    ) -> TransformationData {
        // Call the generated class method
        return Sharpen().sharpen(
            sigma: sigma
        )
    }

    /**
     * Basic Transformations
     *
     * @param size Size (Default: 3)
     * @return The generated TransformationData.
     */
    public static func tMedian(
        size: Int? = 3
    ) -> TransformationData {
        // Call the generated class method
        return Median().median(
            size: size
        )
    }

    /**
     * Basic Transformations
     *
     * @param sigma Sigma (Default: 0.3)
     * @param dpr Dpr (Default: 1)
     * @return The generated TransformationData.
     */
    public static func tBlur(
        sigma: Float? = 0.3,
        dpr: Float? = 1
    ) -> TransformationData {
        // Call the generated class method
        return Blur().blur(
            sigma: sigma,
            dpr: dpr
        )
    }

    /**
     * Basic Transformations
     *
     * @param background Background (Default: 000000)
     * @return The generated TransformationData.
     */
    public static func tFlatten(
        background: String? = "000000"
    ) -> TransformationData {
        // Call the generated class method
        return Flatten().flatten(
            background: background
        )
    }

    /**
     * Basic Transformations
     *
     * @return The generated TransformationData.
     */
    public static func tNegate(
    ) -> TransformationData {
        // Call the generated class method
        return Negate().negate(
        )
    }

    /**
     * Basic Transformations
     *
     * @return The generated TransformationData.
     */
    public static func tNormalise(
    ) -> TransformationData {
        // Call the generated class method
        return Normalise().normalise(
        )
    }

    /**
     * Basic Transformations
     *
     * @param a A (Default: 1)
     * @param b B (Default: 0)
     * @return The generated TransformationData.
     */
    public static func tLinear(
        a: Int? = 1,
        b: Int? = 0
    ) -> TransformationData {
        // Call the generated class method
        return Linear().linear(
            a: a,
            b: b
        )
    }

    /**
     * Basic Transformations
     *
     * @param brightness Brightness (Default: 1)
     * @param saturation Saturation (Default: 1)
     * @param hue Hue (Default: 90)
     * @return The generated TransformationData.
     */
    public static func tModulate(
        brightness: Float? = 1,
        saturation: Float? = 1,
        hue: Int? = 90
    ) -> TransformationData {
        // Call the generated class method
        return Modulate().modulate(
            brightness: brightness,
            saturation: saturation,
            hue: hue
        )
    }

    /**
     * Basic Transformations
     *
     * @return The generated TransformationData.
     */
    public static func tGrey(
    ) -> TransformationData {
        // Call the generated class method
        return Grey().grey(
        )
    }

    /**
     * Basic Transformations
     *
     * @param color Color (Default: 000000)
     * @return The generated TransformationData.
     */
    public static func tTint(
        color: String? = "000000"
    ) -> TransformationData {
        // Call the generated class method
        return Tint().tint(
            color: color
        )
    }

    /**
     * Basic Transformations
     *
     * @param format Format (Default: jpeg)
     * @param quality Quality (Default: 75)
     * @return The generated TransformationData.
     */
    public static func tToformat(
        format: Toformat.Format? = Toformat.Format.jpeg,
        quality: Toformat.Quality? = Toformat.Quality._75
    ) -> TransformationData {
        // Call the generated class method
        return Toformat().toFormat(
            format: format,
            quality: quality
        )
    }

    /**
     * Basic Transformations
     *
     * @param density Density (Default: 300)
     * @return The generated TransformationData.
     */
    public static func tDensity(
        density: Int? = 300
    ) -> TransformationData {
        // Call the generated class method
        return Density().density(
            density: density
        )
    }

    /**
     * Basic Transformations
     *
     * @param mode Mode (Default: overlay)
     * @param image Image (Default: )
     * @param transformation Transformation (Default: )
     * @param background Background (Default: 00000000)
     * @param height Height (Default: 0)
     * @param width Width (Default: 0)
     * @param top Top (Default: 0)
     * @param left Left (Default: 0)
     * @param gravity Gravity (Default: center)
     * @param blend Blend (Default: over)
     * @param tile Tile (Default: false)
     * @param listofbboxes List of bboxes
     * @param listofpolygons List of polygons
     * @return The generated TransformationData.
     */
    public static func tMerge(
        mode: Merge.Mode? = Merge.Mode.overlay,
        image: String? = "",
        transformation: String? = "",
        background: String? = "00000000",
        height: Int? = 0,
        width: Int? = 0,
        top: Int? = 0,
        left: Int? = 0,
        gravity: Merge.Gravity? = Merge.Gravity.center,
        blend: Merge.Blend? = Merge.Blend.over,
        tile: Bool? = false,
        listofbboxes: String? = nil,
        listofpolygons: String? = nil
    ) -> TransformationData {
        // Call the generated class method
        return Merge().merge(
            mode: mode,
            image: image,
            transformation: transformation,
            background: background,
            height: height,
            width: width,
            top: top,
            left: left,
            gravity: gravity,
            blend: blend,
            tile: tile,
            listofbboxes: listofbboxes,
            listofpolygons: listofpolygons
        )
    }

    // Artifact
    /**
     * Artifact Removal Plugin
     *
     * @return The generated TransformationData.
     */
    public static func afRemove(
    ) -> TransformationData {
        // Call the generated class method
        return Artifact().remove(
        )
    }

    // AWSRekognitionPlugin
    /**
     * Detect objects and text in images
     *
     * @param maximumlabels Maximum labels (Default: 5)
     * @param minimumconfidence Minimum confidence (Default: 55)
     * @return The generated TransformationData.
     */
    public static func awsrekDetectlabels(
        maximumlabels: Int? = 5,
        minimumconfidence: Int? = 55
    ) -> TransformationData {
        // Call the generated class method
        return Detectlabels().detectLabels(
            maximumlabels: maximumlabels,
            minimumconfidence: minimumconfidence
        )
    }

    /**
     * Detect objects and text in images
     *
     * @param minimumconfidence Minimum confidence (Default: 55)
     * @return The generated TransformationData.
     */
    public static func awsrekModeration(
        minimumconfidence: Int? = 55
    ) -> TransformationData {
        // Call the generated class method
        return Moderation().moderation(
            minimumconfidence: minimumconfidence
        )
    }

    // BackgroundGenerator
    /**
     * AI Background Generator
     *
     * @param backgroundprompt Background prompt (Default: YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr)
     * @param focus Focus (Default: Product)
     * @param negativeprompt Negative prompt (Default: )
     * @param seed Seed (Default: 123)
     * @return The generated TransformationData.
     */
    public static func generateBg(
        backgroundprompt: String? = "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr",
        focus: BackgroundGenerator.Focus? = BackgroundGenerator.Focus.product,
        negativeprompt: String? = "",
        seed: Int? = 123
    ) -> TransformationData {
        // Call the generated class method
        return BackgroundGenerator().bg(
            backgroundprompt: backgroundprompt,
            focus: focus,
            negativeprompt: negativeprompt,
            seed: seed
        )
    }

    // ImageExtender
    /**
     * AI Image Extender
     *
     * @param boundingbox Bounding Box
     * @param prompt Prompt (Default: )
     * @param negativeprompt Negative Prompt (Default: )
     * @param strength Strength (Default: 0.999)
     * @param guidancescale Guidance Scale (Default: 8)
     * @param numberofinferencesteps Number of inference steps (Default: 10)
     * @param coloradjust Color Adjust (Default: false)
     * @param seed Seed (Default: 123)
     * @return The generated TransformationData.
     */
    public static func bgExtend(
        boundingbox: String? = nil,
        prompt: String? = "",
        negativeprompt: String? = "",
        strength: Float? = 0.999,
        guidancescale: Int? = 8,
        numberofinferencesteps: Int? = 10,
        coloradjust: Bool? = false,
        seed: Int? = 123
    ) -> TransformationData {
        // Call the generated class method
        return ImageExtender().extend(
            boundingbox: boundingbox,
            prompt: prompt,
            negativeprompt: negativeprompt,
            strength: strength,
            guidancescale: guidancescale,
            numberofinferencesteps: numberofinferencesteps,
            coloradjust: coloradjust,
            seed: seed
        )
    }

    // VariationGenerator
    /**
     * AI Variation Generator
     *
     * @param generatevariationprompt Generate variation prompt (Default: )
     * @param noofvariations No. of variations (Default: 1)
     * @param seed Seed (Default: 0)
     * @param autoscale Autoscale input if it exceeds maximum resolution (Default: true)
     * @return The generated TransformationData.
     */
    public static func vgGenerate(
        generatevariationprompt: String? = "",
        noofvariations: Int? = 1,
        seed: Int? = 0,
        autoscale: Bool? = true
    ) -> TransformationData {
        // Call the generated class method
        return VariationGenerator().generate(
            generatevariationprompt: generatevariationprompt,
            noofvariations: noofvariations,
            seed: seed,
            autoscale: autoscale
        )
    }

    // EraseBG
    /**
     * EraseBG Background Removal Module
     *
     * @param industrytype Foreground Type (Default: general)
     * @param addshadow Add Shadow (cars only) (Default: false)
     * @param refine Refine Output (Default: true)
     * @return The generated TransformationData.
     */
    public static func eraseBg(
        industrytype: EraseBG.Industrytype? = EraseBG.Industrytype.general,
        addshadow: Bool? = false,
        refine: Bool? = true
    ) -> TransformationData {
        // Call the generated class method
        return EraseBG().bg(
            industrytype: industrytype,
            addshadow: addshadow,
            refine: refine
        )
    }

    // GoogleVisionPlugin
    /**
     * Detect content and text in images
     *
     * @param maximumlabels Maximum labels (Default: 5)
     * @return The generated TransformationData.
     */
    public static func googlevisDetectlabels(
        maximumlabels: Int? = 5
    ) -> TransformationData {
        // Call the generated class method
        return GoogleVisionPlugin().detectLabels(
            maximumlabels: maximumlabels
        )
    }

    // ImageCentering
    /**
     * Image Centering Module
     *
     * @param distancepercentage Distance percentage (Default: 10)
     * @return The generated TransformationData.
     */
    public static func imcDetect(
        distancepercentage: Int? = 10
    ) -> TransformationData {
        // Call the generated class method
        return ImageCentering().detect(
            distancepercentage: distancepercentage
        )
    }

    // IntelligentCrop
    /**
     * Intelligent Crop Plugin
     *
     * @param requiredwidth Required width (Default: 0)
     * @param requiredheight Required height (Default: 0)
     * @param paddingpercentage Padding percentage (Default: 0)
     * @param maintainoriginalaspect Maintain original aspect (Default: false)
     * @param aspectratio Aspect Ratio (16_9 or 2 or 0.25) (Default: )
     * @param gravitytowards Gravity towards (Default: none)
     * @param preferreddirection Preferred direction (Default: center)
     * @param objecttype Object Type (if Gravity is object) (Default: person)
     * @return The generated TransformationData.
     */
    public static func icCrop(
        requiredwidth: Int? = 0,
        requiredheight: Int? = 0,
        paddingpercentage: Int? = 0,
        maintainoriginalaspect: Bool? = false,
        aspectratio: String? = "",
        gravitytowards: IntelligentCrop.Gravitytowards? = IntelligentCrop.Gravitytowards.none,
        preferreddirection: IntelligentCrop.Preferreddirection? = IntelligentCrop.Preferreddirection.center,
        objecttype: IntelligentCrop.Objecttype? = IntelligentCrop.Objecttype.person
    ) -> TransformationData {
        // Call the generated class method
        return IntelligentCrop().crop(
            requiredwidth: requiredwidth,
            requiredheight: requiredheight,
            paddingpercentage: paddingpercentage,
            maintainoriginalaspect: maintainoriginalaspect,
            aspectratio: aspectratio,
            gravitytowards: gravitytowards,
            preferreddirection: preferreddirection,
            objecttype: objecttype
        )
    }

    // IntelligentMasking
    /**
     * Intelligent Masking
     *
     * @param replacementimage Replacement image (Default: )
     * @param detector Detector (Default: number_plate)
     * @param masktype Mask type (Default: fill_black)
     * @return The generated TransformationData.
     */
    public static func imMask(
        replacementimage: String? = "",
        detector: IntelligentMasking.Detector? = IntelligentMasking.Detector.number_plate,
        masktype: IntelligentMasking.Masktype? = IntelligentMasking.Masktype.fill_black
    ) -> TransformationData {
        // Call the generated class method
        return IntelligentMasking().mask(
            replacementimage: replacementimage,
            detector: detector,
            masktype: masktype
        )
    }

    // ObjectCounter
    /**
     * Classifies whether objects in the image are single or multiple
     *
     * @return The generated TransformationData.
     */
    public static func ocDetect(
    ) -> TransformationData {
        // Call the generated class method
        return ObjectCounter().detect(
        )
    }

    // NSFWDetection
    /**
     * Detect NSFW content in images
     *
     * @param minimumconfidence Minimum confidence (Default: 0.5)
     * @return The generated TransformationData.
     */
    public static func nsfwDetect(
        minimumconfidence: Float? = 0.5
    ) -> TransformationData {
        // Call the generated class method
        return NSFWDetection().detect(
            minimumconfidence: minimumconfidence
        )
    }

    // NumberPlateDetection
    /**
     * Number Plate Detection Plugin
     *
     * @return The generated TransformationData.
     */
    public static func numplateDetect(
    ) -> TransformationData {
        // Call the generated class method
        return NumberPlateDetection().detect(
        )
    }

    // ObjectDetection
    /**
     * Detect bounding boxes of objects in the image
     *
     * @return The generated TransformationData.
     */
    public static func odDetect(
    ) -> TransformationData {
        // Call the generated class method
        return ObjectDetection().detect(
        )
    }

    // CheckObjectSize
    /**
     * Calculates the percentage of the main object area relative to image dimensions.
     *
     * @param objectthresholdpercent Object threshold percent (Default: 50)
     * @return The generated TransformationData.
     */
    public static func cosDetect(
        objectthresholdpercent: Int? = 50
    ) -> TransformationData {
        // Call the generated class method
        return CheckObjectSize().detect(
            objectthresholdpercent: objectthresholdpercent
        )
    }

    // TextDetectionandRecognition
    /**
     * OCR Module
     *
     * @param detectonly Detect only (Default: false)
     * @return The generated TransformationData.
     */
    public static func ocrExtract(
        detectonly: Bool? = false
    ) -> TransformationData {
        // Call the generated class method
        return TextDetectionandRecognition().extract(
            detectonly: detectonly
        )
    }

    // PdfWatermarkRemoval
    /**
     * PDF Watermark Removal Plugin
     *
     * @return The generated TransformationData.
     */
    public static func pwrRemove(
    ) -> TransformationData {
        // Call the generated class method
        return PdfWatermarkRemoval().remove(
        )
    }

    // ProductTagging
    /**
     * AI Product Tagging
     *
     * @return The generated TransformationData.
     */
    public static func prTag(
    ) -> TransformationData {
        // Call the generated class method
        return ProductTagging().tag(
        )
    }

    // CheckProductVisibility
    /**
     * Classifies whether the product in the image is completely visible or not
     *
     * @return The generated TransformationData.
     */
    public static func cpvDetect(
    ) -> TransformationData {
        // Call the generated class method
        return CheckProductVisibility().detect(
        )
    }

    // QRCode
    /**
     * QRCode Plugin
     *
     * @param width Width (Default: 300)
     * @param height Height (Default: 300)
     * @param image Logo URL (Default: )
     * @param margin Margin around QR (Default: 0)
     * @param qrtypenumber QR Type Number (Default: 0)
     * @param qrerrorcorrectionlevel QR Error Correction Level (Default: Q)
     * @param imagesize Logo Size (Default: 0.4)
     * @param imagemargin Margin around Logo (Default: 0)
     * @param dotscolor Dots Color (Default: 000000)
     * @param dotstype Dots Type (Default: square)
     * @param dotsbgcolor Dots Background Color (Default: ffffff)
     * @param cornersquarecolor Corner Square Color (Default: 000000)
     * @param cornersquaretype Corner Square Type (Default: square)
     * @param cornerdotscolor Corner Dots Color (Default: 000000)
     * @param cornerdotstype Corner Dots Type (Default: dot)
     * @return The generated TransformationData.
     */
    public static func qrGenerate(
        width: Int? = 300,
        height: Int? = 300,
        image: String? = "",
        margin: Int? = 0,
        qrtypenumber: Int? = 0,
        qrerrorcorrectionlevel: Generate.Qrerrorcorrectionlevel? = Generate.Qrerrorcorrectionlevel.q,
        imagesize: Float? = 0.4,
        imagemargin: Int? = 0,
        dotscolor: String? = "000000",
        dotstype: Generate.Dotstype? = Generate.Dotstype.square,
        dotsbgcolor: String? = "ffffff",
        cornersquarecolor: String? = "000000",
        cornersquaretype: Generate.Cornersquaretype? = Generate.Cornersquaretype.square,
        cornerdotscolor: String? = "000000",
        cornerdotstype: Generate.Cornerdotstype? = Generate.Cornerdotstype.dot
    ) -> TransformationData {
        // Call the generated class method
        return Generate().generate(
            width: width,
            height: height,
            image: image,
            margin: margin,
            qrtypenumber: qrtypenumber,
            qrerrorcorrectionlevel: qrerrorcorrectionlevel,
            imagesize: imagesize,
            imagemargin: imagemargin,
            dotscolor: dotscolor,
            dotstype: dotstype,
            dotsbgcolor: dotsbgcolor,
            cornersquarecolor: cornersquarecolor,
            cornersquaretype: cornersquaretype,
            cornerdotscolor: cornerdotscolor,
            cornerdotstype: cornerdotstype
        )
    }

    /**
     * QRCode Plugin
     *
     * @return The generated TransformationData.
     */
    public static func qrScan(
    ) -> TransformationData {
        // Call the generated class method
        return Scan().scan(
        )
    }

    // RemoveBG
    /**
     * Remove background from any image
     *
     * @return The generated TransformationData.
     */
    public static func removeBg(
    ) -> TransformationData {
        // Call the generated class method
        return RemoveBG().bg(
        )
    }

    // SoftShadowGenerator
    /**
     * AI Soft Shadow Generator
     *
     * @param backgroundimage Background image
     * @param backgroundcolor Background color (Default: ffffff)
     * @param shadowangle Shadow angle (Default: 120)
     * @param shadowintensity Shadow intensity (Default: 0.5)
     * @return The generated TransformationData.
     */
    public static func shadowGen(
        backgroundimage: String? = nil,
        backgroundcolor: String? = "ffffff",
        shadowangle: Float? = 120,
        shadowintensity: Float? = 0.5
    ) -> TransformationData {
        // Call the generated class method
        return SoftShadowGenerator().gen(
            backgroundimage: backgroundimage,
            backgroundcolor: backgroundcolor,
            shadowangle: shadowangle,
            shadowintensity: shadowintensity
        )
    }

    // SuperResolution
    /**
     * Super Resolution Module
     *
     * @param type0 Type (Default: 2x)
     * @param enhanceface Enhance face (Default: false)
     * @param model Model (Default: Picasso)
     * @param enhancequality Enhance quality (Default: false)
     * @return The generated TransformationData.
     */
    public static func srUpscale(
        type0: SuperResolution.Type0? = SuperResolution.Type0._2x,
        enhanceface: Bool? = false,
        model: SuperResolution.Model? = SuperResolution.Model.picasso,
        enhancequality: Bool? = false
    ) -> TransformationData {
        // Call the generated class method
        return SuperResolution().upscale(
            type0: type0,
            enhanceface: enhanceface,
            model: model,
            enhancequality: enhancequality
        )
    }

    // VertexAI
    /**
     * Vertex AI based transformations
     *
     * @param backgroundprompt Background prompt (Default: YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr)
     * @param negativeprompt Negative prompt (Default: )
     * @param seed Seed (Default: 22)
     * @param guidancescale Guidance Scale (controls how much the model adheres to the text prompt) (Default: 60)
     * @return The generated TransformationData.
     */
    public static func vertexaiGeneratebg(
        backgroundprompt: String? = "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr",
        negativeprompt: String? = "",
        seed: Int? = 22,
        guidancescale: Int? = 60
    ) -> TransformationData {
        // Call the generated class method
        return Generatebg().generateBG(
            backgroundprompt: backgroundprompt,
            negativeprompt: negativeprompt,
            seed: seed,
            guidancescale: guidancescale
        )
    }

    /**
     * Vertex AI based transformations
     *
     * @return The generated TransformationData.
     */
    public static func vertexaiRemovebg(
    ) -> TransformationData {
        // Call the generated class method
        return Removebg().removeBG(
        )
    }

    /**
     * Vertex AI based transformations
     *
     * @param type0 Type (Default: x2)
     * @return The generated TransformationData.
     */
    public static func vertexaiUpscale(
        type0: Upscale.Type0? = Upscale.Type0.x2
    ) -> TransformationData {
        // Call the generated class method
        return Upscale().upscale(
            type0: type0
        )
    }

    // VideoWatermarkRemoval
    /**
     * Video Watermark Removal Plugin
     *
     * @return The generated TransformationData.
     */
    public static func wmvRemove(
    ) -> TransformationData {
        // Call the generated class method
        return VideoWatermarkRemoval().remove(
        )
    }

    // VideoUpscalerPlugin
    /**
     * Video Upscaler Plugin
     *
     * @return The generated TransformationData.
     */
    public static func vsrUpscale(
    ) -> TransformationData {
        // Call the generated class method
        return VideoUpscalerPlugin().upscale(
        )
    }

    // ViewDetection
    /**
     * Classifies wear type and view type of products in the image
     *
     * @return The generated TransformationData.
     */
    public static func vdDetect(
    ) -> TransformationData {
        // Call the generated class method
        return ViewDetection().detect(
        )
    }

    // WatermarkRemoval
    /**
     * Watermark Removal Plugin
     *
     * @param removetext Remove text (Default: false)
     * @param removelogo Remove logo (Default: false)
     * @param box1 Box 1 (Default: 0_0_100_100)
     * @param box2 Box 2 (Default: 0_0_0_0)
     * @param box3 Box 3 (Default: 0_0_0_0)
     * @param box4 Box 4 (Default: 0_0_0_0)
     * @param box5 Box 5 (Default: 0_0_0_0)
     * @return The generated TransformationData.
     */
    public static func wmRemove(
        removetext: Bool? = false,
        removelogo: Bool? = false,
        box1: String? = "0_0_100_100",
        box2: String? = "0_0_0_0",
        box3: String? = "0_0_0_0",
        box4: String? = "0_0_0_0",
        box5: String? = "0_0_0_0"
    ) -> TransformationData {
        // Call the generated class method
        return WatermarkRemoval().remove(
            removetext: removetext,
            removelogo: removelogo,
            box1: box1,
            box2: box2,
            box3: box3,
            box4: box4,
            box5: box5
        )
    }

    // WatermarkDetection
    /**
     * Watermark Detection Plugin
     *
     * @param detecttext Detect text (Default: false)
     * @return The generated TransformationData.
     */
    public static func wmcDetect(
        detecttext: Bool? = false
    ) -> TransformationData {
        // Call the generated class method
        return WatermarkDetection().detect(
            detecttext: detecttext
        )
    }
}
