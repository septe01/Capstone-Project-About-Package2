//
//  About.swift
//  About
//
//  Created by septe habudin on 07/01/23.
//

import SwiftUI

@available(macOS 10.15, *)
public struct About: View {

    @EnvironmentObject var profilePresenter: ProfilePresenter
    
    public init() {}
    
    @available(macOS 10.15, *)
    public var body: some View {
        ZStack {
            if #available(macOS 11.0, *) {
                SwiftUI.Color(.white).ignoresSafeArea()
            } else {
                // Fallback on earlier versions
            }
            if profilePresenter.loadingState {
                VStack {
                    Text("Loading...")
                }
            } else {
                ZStack {
                    ScrollView {
                        VStack(spacing: 14) {
                            VStack(spacing: 14) {

                                if let profileImg = profilePresenter.profile {
                                    if #available(macOS 12.0, *) {
                                        AsyncImage(url: URL(string: profileImg.img)) { Image in
                                            Image
                                                .resizable()
                                                .frame(width: 100, height: 100)
                                                .cornerRadius(100)
                                        } placeholder: {
                                            ProgressView()
                                                .progressViewStyle(CircularProgressViewStyle(tint: Color("ColorGreyDark", bundle: Bundle(identifier: "septehabudin.Capstone-Project"))))
                                                .frame(width: 100, height: 100)

                                        }
                                    } else {
                                        // Fallback on earlier versions
                                    }
                                }

                                VStack(spacing: 4) {
                                    if #available(macOS 11.0, *) {
                                        Text(profilePresenter.profile?.name ?? "")
                                            .font(.title3)
                                            .bold()
                                            .foregroundColor(Color.black)
                                    } else {
                                        // Fallback on earlier versions
                                    }

                                    Text(profilePresenter.profile?.title ?? "")
                                        .font(.subheadline)
                                        .tracking(1)
                                        .foregroundColor(Color.black)
                                }

                                HStack(spacing: 50) {
                                    if let profile = profilePresenter.profile {
                                        ButtonView(url: profile.git, image: "git")
                                        ButtonView(url: profile.instagram, image: "instagram")
                                        ButtonView(url: profile.linkedin, image: "linkedin")
                                    }
                                }
                                .padding(.top, 20)
                            }
                            .padding()

                            if #available(macOS 12.0, *) {
                                Divider()
                                    .frame(height: 1)
                                    .overlay(.gray)
                            } else {
                                // Fallback on earlier versions
                            }

                            Text("""
                               \t\(profilePresenter.profile?.bio ?? "")
                               """)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .padding()
                            .foregroundColor(Color.black)

                        }
                        .padding(.top, 50)
                    }

                }
            }
        }
        .onAppear(perform: {
            if self.profilePresenter.profile == nil {
                self.profilePresenter.getProfile()
            }
        })
    }
}

@available(macOS 10.15, *)
public struct ButtonView: View {
    var url = ""
    var image = ""

    @available(macOS 10.15, *)
    public var body: some View {
        if #available(macOS 11.0, *) {
            Link(destination: URL(string: url)!) {
                Image(image)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 20, height: 20)
            }
            .padding(.all, 10)
            .background(Color("ColorGreySoft", bundle: Bundle(identifier: "septehabudin.Capstone-Project")))
            .cornerRadius(30)
        } else {
            // Fallback on earlier versions
        }
    }
}
