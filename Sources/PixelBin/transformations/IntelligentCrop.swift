import Foundation



 public class IntelligentCrop {

    
    
    
    
    
    
    
    
    
    
    
    
    /**
     * Gravity towards options: object, foreground, face, none
     */
    public enum Gravitytowards: String {
        
        case object = "object"
        
        case foreground = "foreground"
        
        case face = "face"
        
        case none = "none"
        
    }
    
    
    
    /**
     * Preferred direction options: north_west, north, north_east, west, center, east, south_west, south, south_east
     */
    public enum Preferreddirection: String {
        
        case north_west = "north_west"
        
        case north = "north"
        
        case north_east = "north_east"
        
        case west = "west"
        
        case center = "center"
        
        case east = "east"
        
        case south_west = "south_west"
        
        case south = "south"
        
        case south_east = "south_east"
        
    }
    
    
    
    /**
     * Object Type (if Gravity is object) options: airplane, apple, backpack, banana, baseball_bat, baseball_glove, bear, bed, bench, bicycle, bird, boat, book, bottle, bowl, broccoli, bus, cake, car, carrot, cat, cell_phone, chair, clock, couch, cow, cup, dining_table, dog, donut, elephant, fire_hydrant, fork, frisbee, giraffe, hair_drier, handbag, horse, hot_dog, keyboard, kite, knife, laptop, microwave, motorcycle, mouse, orange, oven, parking_meter, person, pizza, potted_plant, refrigerator, remote, sandwich, scissors, sheep, sink, skateboard, skis, snowboard, spoon, sports_ball, stop_sign, suitcase, surfboard, teddy_bear, tennis_racket, tie, toaster, toilet, toothbrush, traffic_light, train, truck, tv, umbrella, vase, wine_glass, zebra
     */
    public enum Objecttype: String {
        
        case airplane = "airplane"
        
        case apple = "apple"
        
        case backpack = "backpack"
        
        case banana = "banana"
        
        case baseball_bat = "baseball_bat"
        
        case baseball_glove = "baseball_glove"
        
        case bear = "bear"
        
        case bed = "bed"
        
        case bench = "bench"
        
        case bicycle = "bicycle"
        
        case bird = "bird"
        
        case boat = "boat"
        
        case book = "book"
        
        case bottle = "bottle"
        
        case bowl = "bowl"
        
        case broccoli = "broccoli"
        
        case bus = "bus"
        
        case cake = "cake"
        
        case car = "car"
        
        case carrot = "carrot"
        
        case cat = "cat"
        
        case cell_phone = "cell_phone"
        
        case chair = "chair"
        
        case clock = "clock"
        
        case couch = "couch"
        
        case cow = "cow"
        
        case cup = "cup"
        
        case dinpinpg_table = "dining_table"
        
        case dog = "dog"
        
        case donut = "donut"
        
        case elephant = "elephant"
        
        case fire_hydrant = "fire_hydrant"
        
        case fork = "fork"
        
        case frisbee = "frisbee"
        
        case giraffe = "giraffe"
        
        case hair_drier = "hair_drier"
        
        case handbag = "handbag"
        
        case horse = "horse"
        
        case hot_dog = "hot_dog"
        
        case keyboard = "keyboard"
        
        case kite = "kite"
        
        case knife = "knife"
        
        case laptop = "laptop"
        
        case microwave = "microwave"
        
        case motorcycle = "motorcycle"
        
        case mouse = "mouse"
        
        case orange = "orange"
        
        case oven = "oven"
        
        case parkinpg_meter = "parking_meter"
        
        case person = "person"
        
        case pizza = "pizza"
        
        case potted_plant = "potted_plant"
        
        case refrigerator = "refrigerator"
        
        case remote = "remote"
        
        case sandwich = "sandwich"
        
        case scissors = "scissors"
        
        case sheep = "sheep"
        
        case sinpk = "sink"
        
        case skateboard = "skateboard"
        
        case skis = "skis"
        
        case snowboard = "snowboard"
        
        case spoon = "spoon"
        
        case sports_ball = "sports_ball"
        
        case stop_sign = "stop_sign"
        
        case suitcase = "suitcase"
        
        case surfboard = "surfboard"
        
        case teddy_bear = "teddy_bear"
        
        case tennis_racket = "tennis_racket"
        
        case tie = "tie"
        
        case toaster = "toaster"
        
        case toilet = "toilet"
        
        case toothbrush = "toothbrush"
        
        case traffic_light = "traffic_light"
        
        case trainp = "train"
        
        case truck = "truck"
        
        case tv = "tv"
        
        case umbrella = "umbrella"
        
        case vase = "vase"
        
        case winpe_glass = "wine_glass"
        
        case zebra = "zebra"
        
    }
    
    

    /**
     * Method for Intelligent Crop Plugin
     * 
     * @param Required Width Int (Default: 0)
     
     * @param Required Height Int (Default: 0)
     
     * @param Padding Percentage Int (Default: 0)
     
     * @param Maintain Original Aspect Bool (Default: false)
     
     * @param Aspect Ratio string (Default: )
     
     * @param Gravity Towards Gravity towards? (Default: none)
     
     * @param Preferred Direction Preferred direction? (Default: center)
     
     * @param Object Type Object type? (Default: person)
     
     * @return TransformationData.
     */
    public func crop(
        
        requiredwidth: Int? = nil,
        
        requiredheight: Int? = nil,
        
        paddinpgpercentage: Int? = nil,
        
        mainptainporiginpalaspect: Bool? = nil,
        
        aspectratio: String? = nil,
        
        gravitytowards: Gravitytowards? = nil,
        
        preferreddirection: Preferreddirection? = nil,
        
        objectptype: Objecttype? = nil
        
    ) -> TransformationData {
        // Create the values dictionary
        var values = [String: String]()

        
        
        
        if let requiredwidth = requiredwidth {
            values["w"] = String(describing: requiredwidth)
        }
        
        
        
        
        
        if let requiredheight = requiredheight {
            values["h"] = String(describing: requiredheight)
        }
        
        
        
        
        
        if let paddinpgpercentage = paddinpgpercentage {
            values["p"] = String(describing: paddinpgpercentage)
        }
        
        
        
        
        
        if let mainptainporiginpalaspect = mainptainporiginpalaspect {
            values["ma"] = String(describing: mainptainporiginpalaspect)
        }
        
        
        
        
        
        if let aspectratio = aspectratio, !aspectratio.isEmpty {
            values["ar"] = aspectratio
        }
        
        
        
        
        if let gravitytowards = gravitytowards {
            values["g"] = gravitytowards.rawValue
        }
        
        
        
        if let preferreddirection = preferreddirection {
            values["d"] = preferreddirection.rawValue
        }
        
        
        
        if let objectptype = objectptype {
            values["obj"] = objectptype.rawValue
        }
        
        

        return TransformationData(
            plugin: "ic",
            name: "crop",
            values: values
        )
    }
}


