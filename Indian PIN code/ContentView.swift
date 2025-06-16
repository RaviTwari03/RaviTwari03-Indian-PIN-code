//
//  ContentView.swift
//  Indian PIN code
//
//  Created by Ravi Tiwari on 16/06/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PinCodeViewModel()
    @State private var pinCode = "" {
        didSet {
            if pinCode.count < 6 {
                viewModel.clearResults()
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Search Bar
                HStack {
                    TextField("Enter PIN Code", text: $pinCode)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: pinCode) { _, newValue in
                            if newValue.count > 6 {
                                pinCode = String(newValue.prefix(6))
                            }
                        }
                        .padding()
                    
                    Button(action: {
                        viewModel.fetchDetails(for: pinCode)
                    }) {
                        Text("Lookup")
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(pinCode.count == 6 ? Color.blue : Color.gray)
                            .cornerRadius(8)
                    }
                    .disabled(pinCode.count != 6)
                    .padding(.trailing)
                }
                
                if viewModel.isLoading {
                    ProgressView("Searching...")
                        .progressViewStyle(CircularProgressViewStyle())
                } else if let error = viewModel.errorMessage {
                    VStack {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.system(size: 50))
                            .foregroundColor(.red)
                        Text(error)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                } else if !viewModel.postOffices.isEmpty {
                    List(viewModel.postOffices) { office in
                        VStack(alignment: .leading, spacing: 8) {
                            Text("🏤 \(office.name)")
                                .font(.headline)
                            
                            Group {
                                Text("📍 \(office.district), \(office.state)")
                                Text("🌍 \(office.country)")
                                Text("📦 Delivery: \(office.deliveryStatus)")
                                Text("🏢 Branch Type: \(office.branchType)")
                                Text("🌐 Region: \(office.region)")
                            }
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 8)
                    }
                    .listStyle(InsetGroupedListStyle())
                }
                
                Spacer()
            }
            .navigationTitle("PIN Code Lookup")
        }
    }
}

#Preview {
    ContentView()
}
