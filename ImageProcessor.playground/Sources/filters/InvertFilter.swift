import Foundation

public class InvertFilter : Filter{
  // Where is processing begins
  override public func run(_ image: RGBAImage) -> RGBAImage {
    self.image = image
    for y in 0..<image.height {
      for x in 0..<image.width {
        var pix = prgba(x, y)
        
        pix.pixel.red = UInt8(255 - pix.r)
        pix.pixel.green = UInt8(255 - pix.g)
        pix.pixel.blue = UInt8(255 - pix.b)
        
        set(x, y, pix.pixel)
      }
    }
    
    return self.image!
  }
}
