/*
See the License.txt file for this sample’s licensing information.
*/

import Foundation
import SwiftUI

struct Info {
    let image: String
    let image1: String
    let image2: String
    let name: String
    let story: String
    let hobbies: [String]
    let foods: [String]
    let colors: [Color]
    let funFacts: [String]
}

let information = Info(
    image: "PIC1",
    image1: "PIC",
    image2: "PIC2",
    name: "Ramiro Herdocia",
    story: "I was born and raised in Nicaragua. An attractive and tropical destiny with volcanoes, beaches, isles, rainforests, mountains, and scenic views. I have always been fascinated by the natural world and its wonders.  \n\n• 🏖️🌋🏕️🎣\n• 🏄‍♀️🚵‍♀️🚴‍♀️⚾️\n• 🍺🌴",
    hobbies: ["🏊🏻‍♂️.","📖","🎮"],
    foods: ["🍝", "🍉", "🥚"],
    colors: [Color.green, Color.brown, Color.black],
    funFacts: [
        "I am a International Student.",
        "Im a very empathic person, according to my grandma.",
        "Im a big videogame entusiast.",
        "Im optimistic",
        "Every time i go to swim i beat try to reach my own record to swim 2000m",
        "I have read many books, like Dracula, Robinson Crusoe.",
        "I have a sister who bothers me alot.",
        "I dont have problems with my family"
    ]
)
