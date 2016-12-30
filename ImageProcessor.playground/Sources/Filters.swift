import UIKit
import Foundation

public class Filters{
  var imageSrc: String
  var filters: Array<Filter> = []
  
  public init(_ imageSrc: String){
    self.imageSrc = imageSrc
  }
  
  // Apply all given filters and return result Image
  public func apply(_ filters: Array<Filter>) -> UIImage{
    self.filters = filters
    let image = UIImage(named: self.imageSrc)!
    var rgbaImage = RGBAImage(image: image)!
    for filter in filters{
      rgbaImage = filter.run(rgbaImage)
//      if (filter.name == "brightness") {
//        rgbaImage = BrightnessFilter(image: rgbaImage, params: filter.params).run()
//      }
    }
    return rgbaImage.toUIImage()!
  }
}
