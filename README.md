# Terrava

Terrava is a mobile application that provides users with real-time information about Earth's events and stunning astronomical images, powered by NASA's open APIs.

Inspired from Panda MemeCreator from Swift Playgrounds 💗

## Features

* **APOD (Astronomy Picture of the Day):**
    * Showcases a daily astronomy image or video from NASA.
    * Displays the image's title and explanation.
      
* **EONET (Earth Observatory Natural Event Tracker):**
    * Displays a map with markers indicating recent natural events across the globe.
    * Provides information about each event, including its title and categories.

## Technologies Used

* **Swift:** The primary programming language for iOS development.
* **SwiftUI:** For building the app's user interface.
* **CoreLocation:** For handling location data and map integration.
* **URLSession:** For fetching data from NASA's APIs.
* **Codable:** For JSON decoding.
* **MapKit:** For displaying maps.
* **NASA Open APIs (APOD, EONET):** The data sources for the app.

## Getting Started

### Prerequisites

* Xcode (latest version)
* iOS 15.0+
* NASA API Key (for APOD)

### Obtaining NASA API Key (APOD)

1.  Go to the NASA API website: [https://api.nasa.gov/](https://api.nasa.gov/)
2.  Click on "Generate API Key" or "Get API Key."
3.  Fill out the required information.
4.  You will receive your API key via email or on the website.
5.  In Xcode, open the `[APODFetcher](https://github.com/wgnofi/Terrava/blob/main/Terrava/APOD/APODFetcher.swift)` file.
6.  Add your API key to the `APODFetcher` placeholder:

    ```swift
    let urlString = "https://api.nasa.gov/planetary/apod?api_key=YOUR_API_KEY"
    ```

7.  Replace `"YOUR_API_KEY_HERE"` with your actual API key.

### Installation

1.  Clone the repository:

    ```bash
    git clone https://github.com/wgnofi/Terrava
    ```

2.  Open the project in Xcode:

    ```bash
    open Terrava.xcodeproj
    ```

3.  Build and run the app on a simulator or physical device.

## Usage

* **APOD Tab:**
    * A daily astronomy picture
    * It's title and description which is scrollable
* **EONET Tab:**
    * The map displays markers for recent natural events.
    * Tap a marker to view event details.

## Screenshots
![tr1](https://github.com/user-attachments/assets/05348269-ee3e-463c-916f-7cc74c04eb73)
![tr2](https://github.com/user-attachments/assets/b3fba2fa-3517-4240-bf9f-8785b8c01c98)
![tr3](https://github.com/user-attachments/assets/977d043f-9fab-48d8-96c0-4d80d0b0bd73)
![tr4](https://github.com/user-attachments/assets/5f0312e5-9d23-404c-bd49-fe2ee6ef73b7)
![tr5](https://github.com/user-attachments/assets/6ce253ca-abe2-45b9-9632-abe3ff3f2c68)
![tr6](https://github.com/user-attachments/assets/686c2855-fa58-48d8-ab7c-a2df5274c7c1)

## Contributing

Contributions are welcome! If you find a bug or have an idea for a new feature, please open an issue or submit a pull request.

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Make your changes and commit them.
4.  Submit a pull request.

## License

This project is licensed under the MIT License - see the `LICENSE` file for details.

## Acknowledgments

* Data provided by NASA's APOD and EONET APIs.
* [APOD](https://apod.nasa.gov/apod/astropix.html)
* [EONET API](https://eonet.gsfc.nasa.gov/docs/v2.1)
* Thank you NASA 🪐 💕
