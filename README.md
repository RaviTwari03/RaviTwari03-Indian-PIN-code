# Indian PIN Code Lookup

A SwiftUI-based iOS application that allows users to look up details of Indian postal codes (PIN codes) using the India Post API.

## Features

- 🔍 Search by 6-digit PIN code
- 📍 View detailed information about post offices
- 🏢 Display multiple post offices for the same PIN code
- 📱 Modern SwiftUI interface
- ⚡️ Real-time validation
- 🎯 Error handling with user-friendly messages

## Screenshots

[Add your app screenshots here]

## Technical Details

### Requirements
- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

### Architecture
- MVVM (Model-View-ViewModel)
- SwiftUI for UI
- Combine for data binding
- URLSession for networking

### API
The app uses the unofficial India Post API:
```
GET https://api.postalpincode.in/pincode/<PINCODE>
```

### Key Components
- `ContentView`: Main view with search interface
- `PinCodeViewModel`: Handles business logic and API calls
- `PostOffice`: Model for post office data
- `PostOfficeDetailView`: Detailed view for post office information

## Installation

1. Clone the repository:
```bash
git clone https://github.com/RaviTwari03/RaviTwari03-Indian-PIN-code.git
```

2. Open the project in Xcode:
```bash
cd Indian-PIN-code
open "Indian PIN code.xcodeproj"
```

3. Build and run the project in Xcode

## Usage

1. Launch the app
2. Enter a 6-digit Indian PIN code in the search field
3. Tap the "Lookup" button
4. View the detailed information about post offices in that area

## Data Display
For each post office, the app shows:
- Post Office Name
- District and State
- Country
- Delivery Status
- Branch Type
- Region

## Error Handling
The app handles various scenarios:
- Invalid PIN code format
- Network errors
- No data found
- Server errors

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is available under the MIT license. See the LICENSE file for more info.

## Acknowledgments

- India Post for providing the API
- SwiftUI and Apple's development tools
- The Swift community

## Author

Ravi Tiwari - [@RaviTwari03](https://github.com/RaviTwari03) 