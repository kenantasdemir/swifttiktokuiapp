

import Foundation

struct User:Identifiable{
    var id: UUID = UUID()
    var name:String
    var email:String
    var image:String
    
    init( name: String, email: String, image: String) {
    
        self.name = name
        self.email = email
        self.image = image
    }
}

let users: [User] = [
    User(
 
        name: "Kenan T.",
        email: "kenan@example.com",
        image: "https://images.unsplash.com/photo-1527980965255-d3b416303d12"
    ),
    User(
      
        name: "Elif Y.",
        email: "elif@example.com",
        image: "https://images.unsplash.com/photo-1607746882042-944635dfe10e"
    ),
    User(
      
        name: "Mert A.",
        email: "mert@example.com",
        image: "https://images.unsplash.com/photo-1544005313-94ddf0286df2"
    ),
    User(
    
        name: "Zeynep K.",
        email: "zeynep@example.com",
        image: "https://images.unsplash.com/photo-1546456073-6712f79251bb"
    ),
    User(
   
        name: "Ahmet B.",
        email: "ahmet@example.com",
        image: "https://images.unsplash.com/photo-1502767089025-6572583495b0"
    ),
    User(
     
           name: "Buse D.",
           email: "buse@example.com",
           image: "https://images.unsplash.com/photo-1524504388940-b1c1722653e1"
       ),
       User(
          
           name: "Emre G.",
           email: "emre@example.com",
           image: "https://images.unsplash.com/photo-1531123897727-8f129e1688ce"
       ),
       User(
           
           name: "Dilara M.",
           email: "dilara@example.com",
           image: "https://images.unsplash.com/photo-1494790108377-be9c29b29330"
       ),
       User(
         
           name: "Mehmet K.",
           email: "mehmet@example.com",
           image: "https://images.unsplash.com/photo-1552058544-f2b08422138a"
       ),
       User(
          
           name: "Selin S.",
           email: "selin@example.com",
           image: "https://images.unsplash.com/photo-1517841905240-472988babdf9"
       )
]
