//
//  ContentView.swift
//  Furniture App UI
//
//  Created by Mahesh Prasad on 16/08/20.
//  Copyright © 2020 CreatesApp. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var search = ""
    @State var selectedMenu = "All"
    
    var body: some View {
        VStack{
            HStack {
                Text("Dashboard")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    
                    
                }) {
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        
                        Image(systemName: "bell")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                        
                        Circle()
                            .fill(Color.red)
                            .frame(width: 12, height: 12)
                        
                    }
                }
            }
            .padding()
            
            HStack(spacing: 15) {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.white)
                
                TextField("Search", text: $search)
                    .preferredColorScheme(.dark)
            }
            .padding()
            .background(Color("search"))
            .cornerRadius(15)
            .padding()
            
            HStack(spacing: 0) {
                
                ForEach(menus, id: \.self){ title in
                    
                    MenuButton(title: title, selected: self.$selectedMenu)
                }
                
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing : 15){
                    
                    ForEach(items) { item in
                        CardView(item: item)
                    }
                }
                .padding(.horizontal, 22)
            }
            .padding(.top)
            .background(Color.white.clipShape(CustomeCorner(corners: [.topLeft, .topRight], size: 55)).edgesIgnoringSafeArea(.all))
            .padding(.top, 100)
            
        }
        .background(Color("bg").edgesIgnoringSafeArea(.all))
    }
}

var menus = ["All","Sofa","Park bench","ArmChair"]

struct MenuButton : View {
    var title : String
    @Binding var selected : String
    
    var body: some View {
        Button(action: {self.selected = self.title}) {
            Text(title)
                .font(.system(size: 15))
                .fontWeight(selected == title ? .bold : .none)
                .foregroundColor(selected == title ? .white : Color.white.opacity(0.7))
                .padding(.vertical, 10)
                .padding(.horizontal,20)
                .background(Color("search").opacity(selected == title ? 1 : 0))
                .cornerRadius(5)
        }
    }
}

//Custom Corner View...
struct CustomeCorner : Shape {
    var corners : UIRectCorner
    var size : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: size, height: size))
        
        return Path(path.cgPath)
    }
}



//Cart View....
struct CardView : View {
    
    var item : Item
    
    var body: some View {
        HStack(spacing: 15) {
            Text(item.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Spacer(minLength: 0)
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                //max Size...
                .frame(height: 180)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(25)
    }
}


//Model And Model Data.....
struct Item : Identifiable {
    var id = UUID().uuidString
    var image : String
    var title : String
    var price : String
}

var items = [
    Item(image: "p1", title: "Classic Leather Arm Chair", price: "$56"),
    Item(image: "p2", title: "Poppy Plastic Tub Chair", price: "$100"),
    Item(image: "p3", title: "Bar Stool Chair", price: "$120")
]
