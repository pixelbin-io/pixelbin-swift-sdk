import Foundation

public class IntelligentCrop {
    /**
     * Gravity towards options: object, foreground, face, none
     */
    public enum Gravitytowards: String {
        case object0 = "object"
        case foreground
        case face
        case none
    }

    /**
     * Preferred direction options: north_west, north, north_east, west, center, east, south_west, south, south_east
     */
    public enum Preferreddirection: String {
        case north_west
        case north
        case north_east
        case west
        case center
        case east
        case south_west
        case south
        case south_east
    }

    /**
     * Object Type (if Gravity is object) options: airplane, apple, backpack, banana, baseball_bat, baseball_glove, bear, bed, bench, bicycle, bird, boat, book, bottle, bowl, broccoli, bus, cake, car, carrot, cat, cell_phone, chair, clock, couch, cow, cup, dining_table, dog, donut, elephant, fire_hydrant, fork, frisbee, giraffe, hair_drier, handbag, horse, hot_dog, keyboard, kite, knife, laptop, microwave, motorcycle, mouse, orange, oven, parking_meter, person, pizza, potted_plant, refrigerator, remote, sandwich, scissors, sheep, sink, skateboard, skis, snowboard, spoon, sports_ball, stop_sign, suitcase, surfboard, teddy_bear, tennis_racket, tie, toaster, toilet, toothbrush, traffic_light, train, truck, tv, umbrella, vase, wine_glass, zebra
     */
    public enum Objecttype: String {
        case airplane
        case apple
        case backpack
        case banana
        case baseball_bat
        case baseball_glove
        case bear
        case bed
        case bench
        case bicycle
        case bird
        case boat
        case book
        case bottle
        case bowl
        case broccoli
        case bus
        case cake
        case car
        case carrot
        case cat
        case cell_phone
        case chair
        case clock
        case couch
        case cow
        case cup
        case dining_table
        case dog
        case donut
        case elephant
        case fire_hydrant
        case fork
        case frisbee
        case giraffe
        case hair_drier
        case handbag
        case horse
        case hot_dog
        case keyboard
        case kite
        case knife
        case laptop
        case microwave
        case motorcycle
        case mouse
        case orange
        case oven
        case parking_meter
        case person
        case pizza
        case potted_plant
        case refrigerator
        case remote
        case sandwich
        case scissors
        case sheep
        case sink
        case skateboard
        case skis
        case snowboard
        case spoon
        case sports_ball
        case stop_sign
        case suitcase
        case surfboard
        case teddy_bear
        case tennis_racket
        case tie
        case toaster
        case toilet
        case toothbrush
        case traffic_light
        case train
        case truck
        case tv
        case umbrella
        case vase
        case wine_glass
        case zebra
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
        paddingpercentage: Int? = nil,
        maintainoriginalaspect: Bool? = nil,
        aspectratio: String? = nil,
        gravitytowards: Gravitytowards? = nil,
        preferreddirection: Preferreddirection? = nil,
        objecttype: Objecttype? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let requiredwidth = requiredwidth {
            values["w"] = String(describing: requiredwidth)
        }
        if let requiredheight = requiredheight {
            values["h"] = String(describing: requiredheight)
        }
        if let paddingpercentage = paddingpercentage {
            values["p"] = String(describing: paddingpercentage)
        }
        if let maintainoriginalaspect = maintainoriginalaspect {
            values["ma"] = String(describing: maintainoriginalaspect)
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
        if let objecttype = objecttype {
            values["obj"] = objecttype.rawValue
        }
        return TransformationData(
            plugin: "ic",
            name: "crop",
            values: values
        )
    }
}
