//
//  ContentView.swift
//  Apod
//
//  Created by Ming Xia on 4/2/22.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @State var imageTitle = ""
    @State var imageexplanation = ""
    @State var imageurl: URL?
    @State var hdimageurl: URL?
    @State var imagecopyright: String?
    @State var date = ""
    @State var currentTime = Date()
    @State private var API_KEY = "9SEjPKM14jrgKguq4Y8PwceHIBdI2dfaQSa0qQ6r"
    @State var startDate = "1995-06-16"
    @State var alertshow = false
    
    var dateFormateter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    var body: some View {
        let stime = dateFormateter.date(from: startDate)!
        
        NavigationView{
            Form{
                Section(){
                    VStack{
                        AsyncImage(url: imageurl) {phase in
                            if let image = phase.image{
                                image
                                    .resizable()
                                    .scaledToFit()
                            }else if phase.error != nil{
                                VideoPlayer(player: AVPlayer(url: imageurl!))
                                    .scaledToFit()
                                    Text("Video .... ")
                            }else{
                                ProgressView()
                            }
                        }
                        HStack(){
                            VStack(alignment: .leading){
                                Text("Public Date:   \(date)")
                                Text("Copyright:      \(imagecopyright ?? "")")
                            }
                            Spacer()
                        }
                    }
                }
                
                Section(header: Text("Pick a time")){
                    DatePicker("Select Date", selection: $currentTime, in: stime...Date(), displayedComponents: .date)
                    
                }
                
                Section(header: Text("Explanation")){
                    Text(imageexplanation)

                }
            }
            .navigationTitle(imageTitle)
            .navigationBarTitleDisplayMode(.inline)
            
            .task {
                getApiData()
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        
                        Task{
                            getApiData()
                        }
                    }) {
                        Text(Image(systemName: "arrow.clockwise")).font(.system(size: 20).bold())
                            .alert(isPresented: $alertshow, content: {
                                Alert(title: Text("404"),
                                      message: Text("No data available for date \(dateFormateter.string(from: currentTime))"),
                                      dismissButton: .default(Text("OK")))
                            })
                    }
                }
            }
        }
    }
    
    func getApiData() {
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=\(API_KEY)&date=\(dateFormateter.string(from: currentTime))") else{
            print("Invaild URL")
            return
        }

        URLSession.shared.dataTask(with: url) {( data, response, error) in

            guard let data = data else{
                print("Could not get data")
                return
            }

            do {
                let apidata = try JSONDecoder().decode(APIData.self, from: data)
                DispatchQueue.main.async {
                    imageTitle = apidata.title
                    imageexplanation = apidata.explanation
                    imagecopyright = apidata.copyright
                    date = apidata.date
                    imageurl = apidata.url
                }
            }catch{
                DispatchQueue.main.async {
                    
                    if(error != nil){
                        alertshow = true
                    }
                    print("**********************************")
                    print("\(error)")
                    print("Invaild Data")
                }
            }
        }
        .resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
