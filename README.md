<h2 align="center"> VISION DEVELOPER PROGRAM 2024 - Apple Coding Academy </h2>
<h3 align="center"> Spatial Shoes App - Final Training Project </h3>
<p align="center">
  <img src="https://github.com/user-attachments/assets/4581be55-7212-48b2-9fae-b0f8742a1a5b" width="200"/>
</p>

**Xcode Version Used:** Xcode 16.2  
**visionOS Version:** 2.2

Build an app for the Spatial Shoes store that displays 3D models alongside the data for each shoe model. The UI design is entirely up to you, but it must adhere to Apple’s native interface design guidelines.

### Tasks to Complete:

- Create a catalog that displays all the information and models.
<p align="center">
  <img src="https://github.com/user-attachments/assets/d529fadf-f40e-4e7d-b8d2-e3f4e428a9c8" width="600" /></div>
</p>

- The models can be manipulated in 3D to view them from any orientation and size in a "free view" mode.
<p align="center">
<img src="https://github.com/user-attachments/assets/433fafba-038e-4933-a5bd-03e1a51bb287" width="600"/>
</p>

- There will also be a "display" mode that can be selected on the screen, where the model rotates continuously and automatically.
<p align="center">
  <img src="https://github.com/user-attachments/assets/9281cfe9-199e-472b-a375-5db73d77bffa" width="600"/>
</p>

- Users can tap on a 3D model to view it exclusively in a volumetric window with more detailed information.
<p align="center">
  <img src="https://github.com/user-attachments/assets/b45cc752-2aad-481b-9cec-2d2ab0a0d480" width="600"/>
</p>

- Users can mark any model as a favorite.
<p align="center">
  <img src="https://github.com/user-attachments/assets/c992462e-6e05-4c55-86fa-3304ee01a978" width="600"/>
</p>

- Create a new layout for these favorites in a shelf mode, where 3D models rotate continuously with their names displayed below. Tapping on them will show a more detailed profile.
<p align="center">
  <img src="https://github.com/user-attachments/assets/c992462e-6e05-4c55-86fa-3304ee01a978" width="600"/>
</p>

- Create an immersive space featuring a carousel of shoes (optional). The first shoe appears in front of the user with "next" and "previous" buttons to cycle through the rest. You can implement this by fading shoes in and out or creating a wheel effect where other shoes approach as the user cycles through. The presentation of this space is up to you. However, the shoes must be displayed in maximum detail while being "grabbed" and return to their display position when released.

---

A **shoes.json** file contains all the necessary information:
```swift
struct Shoe: Codable {
      let id: Int
      let name: String
      let brand: String
      let size: [Int]
      let price: Double
      let description: String
      let model3DName: String
      let type: String
      let materials: [String]
      let origin: String
      let gender: String
      let weight: Double
      let colors: [String]
      let warranty: Int
      let certifications: [String]
}
```

The file must be loaded as read-only. The data is not editable from the app; it only displays the information.

You are free to analyze the data and create enumerations or substructures to optimize the catalog.

The `model3DName` field contains the USDZ 3D model, located in the **3D** folder. A file in Reality Composer Pro must be created to organize all the models appropriately.

All tasks are mandatory except for the final immersive space, which is optional for those who want to go the extra mile.

Scenes can be created in Reality Composer Pro if desired. The scale of each model should be adjusted individually, but in the app, all models must appear the same size.
