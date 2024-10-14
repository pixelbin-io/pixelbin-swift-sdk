# Pixelbin

Pixelbin Swift library helps you integrate Pixelbin with your iOS Application.

## Usage

### Installing using Swift Package Manager

1. **Open Your Xcode Project:**
   - Launch Xcode and open your existing project or create a new one.
1. **Open the Swift Packages Tab:**
   - In the project navigator, select your project file to open the project settings.
   - Select the target you want to add the package to.
   - Click on the `Swift Packages` tab.
1. **Add a Swift Package:**
   - Click the `+` button at the bottom left of the `Swift Packages` tab.
   - In the search bar, enter the URL of the repository: `https://github.com/pixelbin-io/pixelbin-kotlin-sdk.git`
1. **Specify Version Rules:**
   - Choose the version rule that fits your needs. You can select from:
     - **Branch:** Specify a branch like `main` or `master`.
     - **Exact Version:** Specify an exact version number.
     - **Range:** Define a version range.
1. **Add the Package:**
   - Click `Next` to fetch the repository and validate the package.
   - After validation, select the package products you need and the target to which they should be added.
   - Click `Finish` to add the package to your project.

### Installing using Cocoapods

- Add the dependency to your `Podfile`:

```ruby
pod 'Pixelbin', '~> 1.0.0'
```

- Install the dependency:

```sh
pod install
```

- To add the Pixelbin Swift SDK as a Swift Package Manager (SPM) dependency to your iOS project using the provided URL, follow these steps:

### Creating Image from URL or Cloud details

```swift
import PixelbinSwift
guard let imageFromUrl = PixelBin.shared.image(url: "https://cdn.pixelbin.io/v2/dummy-cloudname/erase.bg(shadow:false,r:true,i:general)~af.remove()~t.blur(s:0.3,dpr:1.0)/__playground/playground-default.jpeg") else {
    return
}
print(imageFromUrl.encoded)
// Create Image url from cloud, zone and other details
let imageFromDetails = PixelBin.shared.image(imagePath: imageFromUrl.imagePath, cloud: imageFromUrl.cloudName, transformations: imageFromUrl.transformations, version: imageFromUrl.version)
print(imageFromDetails.encoded)
```

______________________________________________________________________

### Applying Transformations and Getting Transformations

```swift
import PixelbinSwift
// Create Image url from cloud, zone and imagePath on cloud (Not local path)
let image = PixelBin.shared.image(imagePath: "example/logo/apple.jpg", cloud: "apple_cloud", zone: "south_asia")
print(imageFromDetails.encoded) // https://cdn.pixelbin.io/v2/apple_cloud/south_asia/original/example/logo/apple.jpg
let eraseTransformation = Transformation.erasebg() // Creating Erasebg Transformation
let resizeTransformation = Transformation.resize(height: 100, width: 100) // Creating Resize Transformation
image.addTransformation(eraseTransformation, resizeTransformation) // Applying transformation (as varargs, just keep passing all transformations)
let outputUrl = image.encoded // https://cdn.pixelbin.io/v2/apple_cloud/south_asia/erase.bg()~t.resize(h:100,w:100)/example/logo/apple.jpg
```

### Uploading Image and getting url object

```swift
// Signed Url and Field can be generated via using Backed SDK for pixelbin or API to generate signed url for upload
// Assume imagePath: "example/logo/apple.jpg", cloud: "apple_cloud", zone: "south_asia" & generate details
let signUrl = "SIGNED_URL"
let fields = [] // META_DATA in value
let signedDetails = SignedDetails(url: signUrl, fields: fields)
// Url is local file path, other fields chunkSize: Int = 1024, concurrency: Int = 1
PixelBin.shared.upload(file: url, signedDetails: signedDetails) { result in
    switch result {
    case let .success(response):
        if let image = response.0 {
            print("Uploaded Image Url: \(image.encoded)")  // https://cdn.pixelbin.io/v2/apple_cloud/south_asia/original/example/logo/apple.jpg
            let eraseTransformation = Transformation.erasebg() // Creating Erasebg Transformation
            let resizeTransformation = Transformation.tResize(height: 100, width: 100) // Creating Resize Transformation
            image.addTransformation(eraseTransformation, resizeTransformation) // Applying transformation (as varargs, just keep passing all transformations)
            print("Transformed Image Url: \(image.encoded)")  // https://cdn.pixelbin.io/v2/apple_cloud/south_asia/erase.bg()~t.resize(h:100,w:100)/example/logo/apple.jpg
        }
    case let .failure(error):
        print("Error: \(error.localizedDescription)")
    }
}
```

| Parameter                                                                | Type    | Description                                                 |
| ------------------------------------------------------------------------ | ------- | ----------------------------------------------------------- |
| file ([File](https://developer.apple.com/documentation/foundation/file)) | File    | File to upload to Pixelbin                                  |
| signedDetails (SignedDetails)                                            | Object  | Signed details generated with the Pixelbin Backend SDK      |
| chunkSize (Int)                                                          | Integer | Size of chunks to be uploaded in KB (default value is 1024) |
| concurrency (Int)                                                        | Integer | Number of chunks to be uploaded in parallel API calls       |

- Resolves with Image object on success.
- Rejects with error on failure.

## List of Supported Transformations

### DetectBackgroundType

#### 1. dbtDetect()

Classifies the background of a product as plain, clean or busy

```swift
let t = Transformation.dbtDetect(
)
```

### Basic

#### 1. tResize(height, width, fit, background, position, algorithm, DPR)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| height | integer |  0 |
| width | integer |  0 |
| fit | enum: `cover`, `contain`, `fill`, `inside`, `outside` |  Resize.Fit.cover |
| background | color |  "000000" |
| position | enum: `top`, `bottom`, `left`, `right`, `right_top`, `right_bottom`, `left_top`, `left_bottom`, `center` |  Resize.Position.center |
| algorithm | enum: `nearest`, `cubic`, `mitchell`, `lanczos2`, `lanczos3` |  Resize.Algorithm.lanczos3 |
| dpr | float |  1 |

```swift
let t = Transformation.tResize(
    height: 0, 
    width: 0, 
    fit: Resize.Fit.cover, 
    background: "000000", 
    position: Resize.Position.center, 
    algorithm: Resize.Algorithm.lanczos3, 
    dpr: 1
)
```

#### 2. tCompress(quality)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| quality | integer |  80 |

```swift
let t = Transformation.tCompress(
    quality: 80
)
```

#### 3. tExtend(top, left, bottom, right, background, Border Type, DPR)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| top | integer |  10 |
| left | integer |  10 |
| bottom | integer |  10 |
| right | integer |  10 |
| background | color |  "000000" |
| bordertype | enum: `constant`, `replicate`, `reflect`, `wrap` |  Extend.Bordertype.constant |
| dpr | float |  1 |

```swift
let t = Transformation.tExtend(
    top: 10, 
    left: 10, 
    bottom: 10, 
    right: 10, 
    background: "000000", 
    bordertype: Extend.Bordertype.constant, 
    dpr: 1
)
```

#### 4. tExtract(top, left, height, width, Bounding Box)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| top | integer |  10 |
| left | integer |  10 |
| height | integer |  50 |
| width | integer |  20 |
| boundingbox | bbox |  |

```swift
let t = Transformation.tExtract(
    top: 10, 
    left: 10, 
    height: 50, 
    width: 20, 
    boundingbox:
)
```

#### 5. tTrim(threshold)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| threshold | integer |  10 |

```swift
let t = Transformation.tTrim(
    threshold: 10
)
```

#### 6. tRotate(angle, background)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| angle | integer |  0 |
| background | color |  "000000" |

```swift
let t = Transformation.tRotate(
    angle: 0, 
    background: "000000"
)
```

#### 7. tFlip()

Basic Transformations

```swift
let t = Transformation.tFlip(
)
```

#### 8. tFlop()

Basic Transformations

```swift
let t = Transformation.tFlop(
)
```

#### 9. tSharpen(sigma)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| sigma | float |  1.5 |

```swift
let t = Transformation.tSharpen(
    sigma: 1.5
)
```

#### 10. tMedian(size)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| size | integer |  3 |

```swift
let t = Transformation.tMedian(
    size: 3
)
```

#### 11. tBlur(sigma, DPR)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| sigma | float |  0.3 |
| dpr | float |  1 |

```swift
let t = Transformation.tBlur(
    sigma: 0.3, 
    dpr: 1
)
```

#### 12. tFlatten(background)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| background | color |  "000000" |

```swift
let t = Transformation.tFlatten(
    background: "000000"
)
```

#### 13. tNegate()

Basic Transformations

```swift
let t = Transformation.tNegate(
)
```

#### 14. tNormalise()

Basic Transformations

```swift
let t = Transformation.tNormalise(
)
```

#### 15. tLinear(a, b)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| a | integer |  1 |
| b | integer |  0 |

```swift
let t = Transformation.tLinear(
    a: 1, 
    b: 0
)
```

#### 16. tModulate(brightness, saturation, hue)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| brightness | float |  1 |
| saturation | float |  1 |
| hue | integer |  90 |

```swift
let t = Transformation.tModulate(
    brightness: 1, 
    saturation: 1, 
    hue: 90
)
```

#### 17. tGrey()

Basic Transformations

```swift
let t = Transformation.tGrey(
)
```

#### 18. tTint(color)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| color | color |  "000000" |

```swift
let t = Transformation.tTint(
    color: "000000"
)
```

#### 19. tToformat(format, quality)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| format | enum: `jpeg`, `png`, `webp`, `tiff`, `avif`, `bmp`, `heif` |  Toformat.Format.jpeg |
| quality | enum: `100`, `95`, `90`, `85`, `80`, `75`, `70`, `60`, `50`, `40`, `30`, `20`, `10`, `best`, `good`, `eco`, `low` |  Toformat.Quality.\_75 |

```swift
let t = Transformation.tToformat(
    format: Toformat.Format.jpeg, 
    quality: Toformat.Quality._75
)
```

#### 20. tDensity(density)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| density | integer |  300 |

```swift
let t = Transformation.tDensity(
    density: 300
)
```

#### 21. tMerge(mode, image, transformation, background, height, width, top, left, gravity, blend, tile, List of bboxes, List of Polygons)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| mode | enum: `overlay`, `underlay`, `wrap` |  Merge.Mode.overlay |
| image | file |  "" |
| transformation | custom |  "" |
| background | color |  "00000000" |
| height | integer |  0 |
| width | integer |  0 |
| top | integer |  0 |
| left | integer |  0 |
| gravity | enum: `northwest`, `north`, `northeast`, `east`, `center`, `west`, `southwest`, `south`, `southeast`, `custom` |  Merge.Gravity.center |
| blend | enum: `over`, `in`, `out`, `atop`, `dest`, `dest-over`, `dest-in`, `dest-out`, `dest-atop`, `xor`, `add`, `saturate`, `multiply`, `screen`, `overlay`, `darken`, `lighten`, `colour-dodge`, `color-dodge`, `colour-burn`, `color-burn`, `hard-light`, `soft-light`, `difference`, `exclusion` |  Merge.Blend.over |
| tile | boolean |  false |
| listofbboxes | bboxList |  |
| listofpolygons | polygonList |  |

```swift
let t = Transformation.tMerge(
    mode: Merge.Mode.overlay, 
    image: "", 
    transformation: "", 
    background: "00000000", 
    height: 0, 
    width: 0, 
    top: 0, 
    left: 0, 
    gravity: Merge.Gravity.center, 
    blend: Merge.Blend.over, 
    tile: false, 
    listofbboxes:, 
    listofpolygons:
)
```

### Artifact

#### 1. afRemove()

Artifact Removal Plugin

```swift
let t = Transformation.afRemove(
)
```

### AWSRekognitionPlugin

#### 1. awsrekDetectlabels(Maximum Labels, Minimum Confidence)

Detect objects and text in images
| Parameter | Type | Default |
|-----------|------|---------|
| maximumlabels | integer |  5 |
| minimumconfidence | integer |  55 |

```swift
let t = Transformation.awsrekDetectlabels(
    maximumlabels: 5, 
    minimumconfidence: 55
)
```

#### 2. awsrekModeration(Minimum Confidence)

Detect objects and text in images
| Parameter | Type | Default |
|-----------|------|---------|
| minimumconfidence | integer |  55 |

```swift
let t = Transformation.awsrekModeration(
    minimumconfidence: 55
)
```

### BackgroundGenerator

#### 1. generateBg(Background prompt, focus, Negative prompt, seed)

AI Background Generator
| Parameter | Type | Default |
|-----------|------|---------|
| backgroundprompt | custom |  "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr" |
| focus | enum: `Product`, `Background` |  BackgroundGenerator.Focus.product |
| negativeprompt | custom |  "" |
| seed | integer |  123 |

```swift
let t = Transformation.generateBg(
    backgroundprompt: "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr", 
    focus: BackgroundGenerator.Focus.product, 
    negativeprompt: "", 
    seed: 123
)
```

### ImageExtender

#### 1. bgExtend(Bounding Box, Prompt, Negative Prompt, Strength, Guidance Scale, Number of inference steps, Color Adjust, seed)

AI Image Extender
| Parameter | Type | Default |
|-----------|------|---------|
| boundingbox | bbox |  |
| prompt | custom |  "" |
| negativeprompt | custom |  "" |
| strength | float |  0.999 |
| guidancescale | integer |  8 |
| numberofinferencesteps | integer |  10 |
| coloradjust | boolean |  false |
| seed | integer |  123 |

```swift
let t = Transformation.bgExtend(
    boundingbox:, 
    prompt: "", 
    negativeprompt: "", 
    strength: 0.999, 
    guidancescale: 8, 
    numberofinferencesteps: 10, 
    coloradjust: false, 
    seed: 123
)
```

### VariationGenerator

#### 1. vgGenerate(Generate variation prompt, No. of Variations, Seed, Autoscale)

AI Variation Generator
| Parameter | Type | Default |
|-----------|------|---------|
| generatevariationprompt | custom |  "" |
| noofvariations | integer |  1 |
| seed | integer |  0 |
| autoscale | boolean |  true |

```swift
let t = Transformation.vgGenerate(
    generatevariationprompt: "", 
    noofvariations: 1, 
    seed: 0, 
    autoscale: true
)
```

### EraseBG

#### 1. eraseBg(Industry Type, Add Shadow, Refine)

EraseBG Background Removal Module
| Parameter | Type | Default |
|-----------|------|---------|
| industrytype | enum: `general`, `ecommerce`, `car`, `human`, `object` |  EraseBG.Industrytype.general |
| addshadow | boolean |  false |
| refine | boolean |  true |

```swift
let t = Transformation.eraseBg(
    industrytype: EraseBG.Industrytype.general, 
    addshadow: false, 
    refine: true
)
```

### GoogleVisionPlugin

#### 1. googlevisDetectlabels(Maximum Labels)

Detect content and text in images
| Parameter | Type | Default |
|-----------|------|---------|
| maximumlabels | integer |  5 |

```swift
let t = Transformation.googlevisDetectlabels(
    maximumlabels: 5
)
```

### ImageCentering

#### 1. imcDetect(Distance percentage)

Image Centering Module
| Parameter | Type | Default |
|-----------|------|---------|
| distancepercentage | integer |  10 |

```swift
let t = Transformation.imcDetect(
    distancepercentage: 10
)
```

### IntelligentCrop

#### 1. icCrop(Required Width, Required Height, Padding Percentage, Maintain Original Aspect, Aspect Ratio, Gravity Towards, Preferred Direction, Object Type)

Intelligent Crop Plugin
| Parameter | Type | Default |
|-----------|------|---------|
| requiredwidth | integer |  0 |
| requiredheight | integer |  0 |
| paddingpercentage | integer |  0 |
| maintainoriginalaspect | boolean |  false |
| aspectratio | string |  "" |
| gravitytowards | enum: `object`, `foreground`, `face`, `none` |  IntelligentCrop.Gravitytowards.none |
| preferreddirection | enum: `north_west`, `north`, `north_east`, `west`, `center`, `east`, `south_west`, `south`, `south_east` |  IntelligentCrop.Preferreddirection.center |
| objecttype | enum: `airplane`, `apple`, `backpack`, `banana`, `baseball_bat`, `baseball_glove`, `bear`, `bed`, `bench`, `bicycle`, `bird`, `boat`, `book`, `bottle`, `bowl`, `broccoli`, `bus`, `cake`, `car`, `carrot`, `cat`, `cell_phone`, `chair`, `clock`, `couch`, `cow`, `cup`, `dining_table`, `dog`, `donut`, `elephant`, `fire_hydrant`, `fork`, `frisbee`, `giraffe`, `hair_drier`, `handbag`, `horse`, `hot_dog`, `keyboard`, `kite`, `knife`, `laptop`, `microwave`, `motorcycle`, `mouse`, `orange`, `oven`, `parking_meter`, `person`, `pizza`, `potted_plant`, `refrigerator`, `remote`, `sandwich`, `scissors`, `sheep`, `sink`, `skateboard`, `skis`, `snowboard`, `spoon`, `sports_ball`, `stop_sign`, `suitcase`, `surfboard`, `teddy_bear`, `tennis_racket`, `tie`, `toaster`, `toilet`, `toothbrush`, `traffic_light`, `train`, `truck`, `tv`, `umbrella`, `vase`, `wine_glass`, `zebra` |  IntelligentCrop.Objecttype.person |

```swift
let t = Transformation.icCrop(
    requiredwidth: 0, 
    requiredheight: 0, 
    paddingpercentage: 0, 
    maintainoriginalaspect: false, 
    aspectratio: "", 
    gravitytowards: IntelligentCrop.Gravitytowards.none, 
    preferreddirection: IntelligentCrop.Preferreddirection.center, 
    objecttype: IntelligentCrop.Objecttype.person
)
```

### IntelligentMasking

#### 1. imMask(Replacement Image, Detector, Mask Type)

Intelligent Masking
| Parameter | Type | Default |
|-----------|------|---------|
| replacementimage | file |  "" |
| detector | enum: `face`, `text`, `number_plate` |  IntelligentMasking.Detector.number_plate |
| masktype | enum: `fill_black`, `pixelate`, `blur` |  IntelligentMasking.Masktype.fill_black |

```swift
let t = Transformation.imMask(
    replacementimage: "", 
    detector: IntelligentMasking.Detector.number_plate, 
    masktype: IntelligentMasking.Masktype.fill_black
)
```

### ObjectCounter

#### 1. ocDetect()

Classifies whether objects in the image are single or multiple

```swift
let t = Transformation.ocDetect(
)
```

### NSFWDetection

#### 1. nsfwDetect(Minimum Confidence)

Detect NSFW content in images
| Parameter | Type | Default |
|-----------|------|---------|
| minimumconfidence | float |  0.5 |

```swift
let t = Transformation.nsfwDetect(
    minimumconfidence: 0.5
)
```

### NumberPlateDetection

#### 1. numplateDetect()

Number Plate Detection Plugin

```swift
let t = Transformation.numplateDetect(
)
```

### ObjectDetection

#### 1. odDetect()

Detect bounding boxes of objects in the image

```swift
let t = Transformation.odDetect(
)
```

### CheckObjectSize

#### 1. cosDetect(Object Threshold Percent)

Calculates the percentage of the main object area relative to image dimensions.
| Parameter | Type | Default |
|-----------|------|---------|
| objectthresholdpercent | integer |  50 |

```swift
let t = Transformation.cosDetect(
    objectthresholdpercent: 50
)
```

### TextDetectionandRecognition

#### 1. ocrExtract(Detect Only)

OCR Module
| Parameter | Type | Default |
|-----------|------|---------|
| detectonly | boolean |  false |

```swift
let t = Transformation.ocrExtract(
    detectonly: false
)
```

### PdfWatermarkRemoval

#### 1. pwrRemove()

PDF Watermark Removal Plugin

```swift
let t = Transformation.pwrRemove(
)
```

### ProductTagging

#### 1. prTag()

AI Product Tagging

```swift
let t = Transformation.prTag(
)
```

### CheckProductVisibility

#### 1. cpvDetect()

Classifies whether the product in the image is completely visible or not

```swift
let t = Transformation.cpvDetect(
)
```

### QRCode

#### 1. qrGenerate(width, height, image, margin, qRTypeNumber, qrErrorCorrectionLevel, imageSize, imageMargin, dotsColor, dotsType, dotsBgColor, cornerSquareColor, cornerSquareType, cornerDotsColor, cornerDotsType)

QRCode Plugin
| Parameter | Type | Default |
|-----------|------|---------|
| width | integer |  300 |
| height | integer |  300 |
| image | custom |  "" |
| margin | integer |  0 |
| qrtypenumber | integer |  0 |
| qrerrorcorrectionlevel | enum: `L`, `M`, `Q`, `H` |  Generate.Qrerrorcorrectionlevel.q |
| imagesize | float |  0.4 |
| imagemargin | integer |  0 |
| dotscolor | color |  "000000" |
| dotstype | enum: `rounded`, `dots`, `classy`, `classy-rounded`, `square`, `extra-rounded` |  Generate.Dotstype.square |
| dotsbgcolor | color |  "ffffff" |
| cornersquarecolor | color |  "000000" |
| cornersquaretype | enum: `dot`, `square`, `extra-rounded` |  Generate.Cornersquaretype.square |
| cornerdotscolor | color |  "000000" |
| cornerdotstype | enum: `dot`, `square` |  Generate.Cornerdotstype.dot |

```swift
let t = Transformation.qrGenerate(
    width: 300, 
    height: 300, 
    image: "", 
    margin: 0, 
    qrtypenumber: 0, 
    qrerrorcorrectionlevel: Generate.Qrerrorcorrectionlevel.q, 
    imagesize: 0.4, 
    imagemargin: 0, 
    dotscolor: "000000", 
    dotstype: Generate.Dotstype.square, 
    dotsbgcolor: "ffffff", 
    cornersquarecolor: "000000", 
    cornersquaretype: Generate.Cornersquaretype.square, 
    cornerdotscolor: "000000", 
    cornerdotstype: Generate.Cornerdotstype.dot
)
```

#### 2. qrScan()

QRCode Plugin

```swift
let t = Transformation.qrScan(
)
```

### RemoveBG

#### 1. removeBg()

Remove background from any image

```swift
let t = Transformation.removeBg(
)
```

### SoftShadowGenerator

#### 1. shadowGen(Background Image, Background Color, Shadow Angle, Shadow Intensity)

AI Soft Shadow Generator
| Parameter | Type | Default |
|-----------|------|---------|
| backgroundimage | file |  |
| backgroundcolor | color |  "ffffff" |
| shadowangle | float |  120 |
| shadowintensity | float |  0.5 |

```swift
let t = Transformation.shadowGen(
    backgroundimage:, 
    backgroundcolor: "ffffff", 
    shadowangle: 120, 
    shadowintensity: 0.5
)
```

### SuperResolution

#### 1. srUpscale(Type, Enhance Face, Model, Enhance Quality)

Super Resolution Module
| Parameter | Type | Default |
|-----------|------|---------|
| type0 | enum: `2x`, `4x`, `8x` |  SuperResolution.Type0.\_2x |
| enhanceface | boolean |  false |
| model | enum: `Picasso`, `Flash` |  SuperResolution.Model.picasso |
| enhancequality | boolean |  false |

```swift
let t = Transformation.srUpscale(
    type0: SuperResolution.Type0._2x, 
    enhanceface: false, 
    model: SuperResolution.Model.picasso, 
    enhancequality: false
)
```

### VertexAI

#### 1. vertexaiGeneratebg(Background prompt, Negative prompt, seed, Guidance Scale)

Vertex AI based transformations
| Parameter | Type | Default |
|-----------|------|---------|
| backgroundprompt | custom |  "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr" |
| negativeprompt | custom |  "" |
| seed | integer |  22 |
| guidancescale | integer |  60 |

```swift
let t = Transformation.vertexaiGeneratebg(
    backgroundprompt: "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr", 
    negativeprompt: "", 
    seed: 22, 
    guidancescale: 60
)
```

#### 2. vertexaiRemovebg()

Vertex AI based transformations

```swift
let t = Transformation.vertexaiRemovebg(
)
```

#### 3. vertexaiUpscale(Type)

Vertex AI based transformations
| Parameter | Type | Default |
|-----------|------|---------|
| type0 | enum: `x2`, `x4` |  Upscale.Type0.x2 |

```swift
let t = Transformation.vertexaiUpscale(
    type0: Upscale.Type0.x2
)
```

### VideoWatermarkRemoval

#### 1. wmvRemove()

Video Watermark Removal Plugin

```swift
let t = Transformation.wmvRemove(
)
```

### VideoUpscalerPlugin

#### 1. vsrUpscale()

Video Upscaler Plugin

```swift
let t = Transformation.vsrUpscale(
)
```

### ViewDetection

#### 1. vdDetect()

Classifies wear type and view type of products in the image

```swift
let t = Transformation.vdDetect(
)
```

### WatermarkRemoval

#### 1. wmRemove(Remove Text, Remove Logo, Box 1, Box 2, Box 3, Box 4, Box 5)

Watermark Removal Plugin
| Parameter | Type | Default |
|-----------|------|---------|
| removetext | boolean |  false |
| removelogo | boolean |  false |
| box1 | string |  "0_0_100_100" |
| box2 | string |  "0_0_0_0" |
| box3 | string |  "0_0_0_0" |
| box4 | string |  "0_0_0_0" |
| box5 | string |  "0_0_0_0" |

```swift
let t = Transformation.wmRemove(
    removetext: false, 
    removelogo: false, 
    box1: "0_0_100_100", 
    box2: "0_0_0_0", 
    box3: "0_0_0_0", 
    box4: "0_0_0_0", 
    box5: "0_0_0_0"
)
```

### WatermarkDetection

#### 1. wmcDetect(Detect Text)

Watermark Detection Plugin
| Parameter | Type | Default |
|-----------|------|---------|
| detecttext | boolean |  false |

```swift
let t = Transformation.wmcDetect(
    detecttext: false
)
```
