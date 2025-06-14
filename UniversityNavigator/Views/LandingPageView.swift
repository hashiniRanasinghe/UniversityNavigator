//
//  LandingPageView.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-04.
//
//DONE -HASHINI
import SwiftUI

struct LandingPageView: View {
    @Binding var showHomePage: Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 20) {
                // logo light
                    ZStack {
                    if let logoImage = UIImage(named: "Logo-light.png") {
                        Image(uiImage: logoImage)
                            .resizable()
                            .frame(width: 400, height: 400)
                    }
                }
            }
            Spacer()
            
            
            Button(action: {
                withAnimation(.easeInOut(duration: 0.5)) {
                        showHomePage = true
                }
            }) {
                Text("Let's Start")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color.black)
                    .cornerRadius(6)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 50)
            }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarBackButtonHidden(true)
        .background(Color.white)
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView(showHomePage: .constant(false))
    }
}
