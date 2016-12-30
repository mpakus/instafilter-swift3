import UIKit

let image_name = "sample"
let first_image = UIImage(named: image_name)

var filters = [Filter]()
// 5 kinds of Filter
filters.append(BrightnessFilter(["level": "150"]))
//filters.append(OpacityFilter(["level": "510"]))
//filters.append(ContrastFilter(["level": "255"]))
//filters.append(GrayscaleFilter())
filters.append(InvertFilter())

var newImage = Filters(image_name).apply(filters)
