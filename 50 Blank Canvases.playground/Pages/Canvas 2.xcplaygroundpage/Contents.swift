//: [Previous](@previous) / [Next](@next)
//: # A Blank Canvas
//:
//: Use this page to experiment. Have fun!
/*:
 ## Required code
 
 The following statements are required to make the playground run.
 
 Please do not remove.
 */
import Cocoa
import PlaygroundSupport

// Create canvas
let canvas = Canvas(width: 200, height: 100)
/*:
 ## Add your code below
 
 Be sure to write human-readable code.
 
 Use whitespace and comments as appropriate.
 */
// crreate a staring point for traveling through perlin noise space
var start = Double(random(from: 0, toButNotIncluding: 100))

//create a perlin noise generator
let p = PerlinGenerator()

for x in stride(from: 0, through: 200, by: 1){
    
    //move through perlin noise space
    //larger means more variation
    //smaller means less variation
    start += 0.01
    
    //get perlin noise (gives us a random number between -1 and 1)
    let randomvalue = p.perlinNoise(x: start)
    
    //convert to a range between 0 and 100
    let hight = map(value: randomvalue, fromLower: -1, fromUpper: 1, toLower: 0, toUpper: 100)
    
    //make hight an integer
    let toY = Int(hight)
    //set the color
    canvas.lineColor = Color.init(hue: toY, saturation: 100, brightness: 100, alpha: 100)
    
    //draw the line
    canvas.drawLine(fromX: x, fromY: 0, toX: x, toY: toY)
}
/*:
 ## Use source control
 To keep your work organized, and receive feedback, source control is a must.
 
 Please commit and push your work often.
 
 ![source_control](source_control.png "Source Control")
 */
/*:
 ## Template code
 The code below is necessary to see results in the Assistant Editor at right.
 
 Please do not remove.
 
 If you don't see output, remember to show the Assistant Editor, and switch to Live View:
 
 ![timeline](timeline.png "Timeline")
 */
// Don't remove the code below
PlaygroundPage.current.liveView = canvas.imageView

