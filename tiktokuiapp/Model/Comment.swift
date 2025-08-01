

import Foundation

struct Comment:Identifiable{
    var id:UUID = UUID()
    var content:String
    var user:User
}

let comments: [Comment] = [
    Comment(content: "Harika paylaşım!", user: users[0]),
    Comment(content: "Çok faydalı oldu, teşekkürler!", user: users[1]),
    Comment(content: "Bunu deneyeceğim.", user: users[2]),
    Comment(content: "Eline sağlık!", user: users[3]),
    Comment(content: "Süper içerik, devamını bekliyorum.", user: users[4]),
    Comment(content: "Çok güzel anlatmışsın.", user: users[5]),
    Comment(content: "Paylaşım için teşekkürler.", user: users[6]),
    Comment(content: "Çok faydalı bilgiler var burada.", user: users[7]),
    Comment(content: "Harika fikirler, deneyeceğim.", user: users[8]),
    Comment(content: "Çok güzel görünüyor.", user: users[9]),
    Comment(content: "Bunu paylaştığın için teşekkürler.", user: users[0]),
    Comment(content: "Çok ilham verici!", user: users[1]),
    Comment(content: "Detaylar için teşekkürler.", user: users[2]),
    Comment(content: "Bu çok işe yaradı.", user: users[3]),
    Comment(content: "Harika olmuş, tebrikler!", user: users[4]),
]
