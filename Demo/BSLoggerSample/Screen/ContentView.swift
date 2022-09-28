//
//  ContentView.swift
//  BSLoggerSample
//
//  Created by 永井涼 on 2022/09/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView() {
            contentView
                .navigationBarTitle("BSLoggerSampleApp", displayMode: .large)
        }
    }
    
    var contentView: some View {
        VStack(alignment: .center, spacing: 30) {
            Text("Press the log output contents button")
                .bold()
                .padding(.vertical, 50)
            LoggerDebugButton
                .background(Color.black)
                .cornerRadius(10)
            LoggerInfoButton
                .background(Color.orange)
                .cornerRadius(10)
            LoggerWarnButton
                .background(Color.yellow)
                .cornerRadius(10)
            LoggerErrorButton
                .background(Color.red)
                .cornerRadius(10)
            LoggerTimeCheker
                .background(Color.blue)
                .cornerRadius(10)
            Spacer()
        }.onAppear { viewModel.setEnvironment() }
        
    }
    
    //debug
    var LoggerDebugButton: some View {
        LoggerButton(title: "DEBUG", image: "doc.text.below.ecg", action: { viewModel.LoggerDebug() })
    }
    
    //info
    var LoggerInfoButton: some View {
        LoggerButton(title: "INFO", image: "info.circle", action: { viewModel.LoggerInfo() })
    }
    
    //warn
    var LoggerWarnButton: some View {
        LoggerButton(title: "WARN", image: "exclamationmark.triangle", action: { viewModel.LoggerWarn() })
    }
    
    //error
    var LoggerErrorButton: some View {
        LoggerButton(title: "ERROR", image: "xmark.octagon", action: { viewModel.LoggerError() })
    }
    
    //timeCheker
    var LoggerTimeCheker: some View {
        LoggerButton(title: "TIMECHEKER", image: "timer", action: { viewModel.LoggerTimeCheker() })
    }
}
