import Foundation

public class OpacityFilter : Filter{
  // Where is processing begins
  override public func run(_ image: RGBAImage) -> RGBAImage {
    self.image = image
    let level = Double(params["level"]!)!

    for y in 0..<image.height {
      for x in 0..<image.width {
        var pix = prgba(x, y)
        
        pix.pixel.alpha = UInt8(min(255, level))
        
        set(x, y, pix.pixel)
      }
    }
    
    return self.image!
  }
}
