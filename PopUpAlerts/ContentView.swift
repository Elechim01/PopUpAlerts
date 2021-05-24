//
//  ContentView.swift
//  PopUpAlerts
//
//  Created by Michele Manniello on 24/05/21.
//

import SwiftUI
import SSToastMessage

struct ContentView: View {
    let bgColor = Color(hex:"E8F2F0")
    let alertColor = Color(hex:"ee6c4d")
    let bottomToastColor = Color(hex:"4067CC")
    let topToastColor = Color(hex:"61A117")
    let bottomFloatColor = Color(hex:"3d5a80")
    @State var showAlert = false
    @State var showTopToast = false
    @State var showBottomToast = false
    @State var showTopFloatter = false
    @State var showBottomfloatter = false
    func dismissAll(){
        self.showAlert = false
        self.showTopToast = false
        self.showBottomToast = false
        self.showTopFloatter = false
        self.showBottomfloatter = false
    }
    
    var body: some View {
        GeometryReader{ geometryProxy in
            VStack{
                VStack(spacing: 30){
                    MyButtonView(showing: self.$showAlert, title: "Alert", hideAll: self.dismissAll)
                    MyButtonView(showing: self.$showTopToast, title: "Top Toast", hideAll: self.dismissAll)
                    MyButtonView(showing: self.$showBottomToast, title: "BottomToast", hideAll: self.dismissAll)
                    MyButtonView(showing: self.$showTopFloatter, title: "Top Floater", hideAll: self.dismissAll)
                    MyButtonView(showing: self.$showBottomfloatter, title: "BottomFloatter", hideAll: self.dismissAll)
                }
                
                .present(isPresented: self.$showAlert,type: .alert,animation: Animation.interactiveSpring(),autohideDuration: nil, closeOnTap: false,view: {
                    self.createAlertView()
                })
                    
                .present(isPresented: self.$showTopToast,type: .toast,position: .top, onTap: {print("on toast tap")} ,view: {
                    self.createTopToastView()
                })
                .present(isPresented: self.$showBottomToast,type: .toast, position: .bottom,onTap: {print("on toast tap")} , view: {
                    self.createBottomToastView()
                })
                .present(isPresented: self.$showTopFloatter,type: .floater(),position: .top, animation: .spring(),onTap: {print("on toast tap")} ,view: {
                    self.createTopFloatterView()
                })
                .present(isPresented: self.$showBottomfloatter,type: .floater(),position: .bottom,animation: .spring(),autohideDuration: nil,onTap: {print("on toast tap")}, view: {
                    self.createBottomFloatterView()
                })
            }
            .frame(width: geometryProxy.size.width, height: geometryProxy.size.height)
        }
        .background(self.bgColor)
        .edgesIgnoringSafeArea(.all)
    }
    
    
//    creazione alert View
    func createAlertView() -> some View {
        VStack(spacing: 10){
            Image(systemName: "hand.raised")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .foregroundColor(.white)
            Spacer()
            Text("Alert!")
                .foregroundColor(.white)
                .font(.system(size: 20))
                .fontWeight(.bold)
            Text("Please click on Dismiss to hide")
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer()
            Button(action: {
                self.showAlert = false
            }, label: {
                Text("Dismiss")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            })
            .frame(width: 100, height: 40)
            .background(Color.white)
            .cornerRadius(20.0)
        }
        .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
        .frame(width: 300, height: 300)
        .background(self.alertColor)
        .cornerRadius(10.0)
        .shadow(color: Color(.sRGBLinear,white: 0,opacity: 0.13), radius: 10.0)
        
    }
//    Create Top toast
    func createTopToastView() -> some View {
        VStack{
            Spacer(minLength: 30)
            HStack(){
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .padding()
                VStack(alignment: .leading,spacing: 2){
                    HStack{
                        Text("xcode")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Spacer()
                        Text("10:10")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
                    Text("Strive for a goal even if the path doesn't look perfect.")
                        .lineLimit(2)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                }
            }.padding(15)
        }
        .frame(width: UIScreen.main.bounds.width, height: 130)
        .background(self.topToastColor)
    }
//    Bottom Toast..
    func createBottomToastView() -> some View {
        VStack{
            HStack(){
                Image(systemName: "house")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .padding()
                VStack(alignment: .leading,spacing: 2){
                    Text("Order has arrived!")
                        .font(.system(size: 16))
                        .foregroundColor(Color(hex:"206a5d"))
                        .fontWeight(.bold)
                    Text("You order is waiting at your doorstep.")
                        .lineLimit(2)
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "206a5d"))
                }
            }
            Spacer(minLength: 10)
        }
        .padding(15)
        .frame(width: UIScreen.main.bounds.width, height: 100)
        .background(self.bottomToastColor)
    }
//    Top Floatter View
    func createTopFloatterView() -> some View {
        VStack{
            HStack(){
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .padding()
                VStack(alignment: .leading,spacing: 2){
                    HStack{
                        Text("Xcode")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Spacer()
                        Text("10:10")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
                    Text("If you need any help with Xcode send me a DM.")
                        .lineLimit(2)
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                }
            }.padding(15)
        }
        .frame(width: UIScreen.main.bounds.width - 60 , height: 110)
        .background(self.topToastColor)
        .cornerRadius(15)
    }
//    Bottom Floatter view
    func createBottomFloatterView() -> some View {
        HStack(spacing: 15){
            Image(systemName: "airplane")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding()
            VStack(alignment: .leading, spacing: 2){
                Text("Ever thought of taking a break ?")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .lineLimit(3)
                Text("if you have....")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
            }
        }
        .padding(15)
        .frame(width: 350, height: 160)
        .background(self.bottomFloatColor)
        .cornerRadius(20.0)
    }
    
}
extension Color{
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue : UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        self.init(red: Double(r)/0xff, green : Double(g) / 0xff, blue : Double(b) / 0xff)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
