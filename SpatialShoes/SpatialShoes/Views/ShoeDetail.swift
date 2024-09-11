//
//  ShoeDetail.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 08/08/2024.
//

import RealityKit
import SpatialShoesRC
import SwiftUI

struct ShoeDetail: View {
    let selectedShoe: ShoeModel
    
    @AppStorage("ShoeIsFavorite") var shoeIsFavorite = false
    
    @Binding var touch: Bool
    @Binding var rotate: Bool
    
    @State private var initialScale: Double = 0.0
    @State private var scaleMagnified: Double = 0.0
    
    @State private var rotationAngle: Double = 0.0
    @State private var currentRotation: CGFloat = 0.0
    @State private var lastDragValue: CGFloat = 0.0
    @State private var velocity: CGFloat = 0.0
    
    init(selectedShoe: ShoeModel, touch: Binding<Bool>, rotate: Binding<Bool>) {
        self.selectedShoe = selectedShoe
        _touch = touch
        _rotate = rotate
        _scaleMagnified = State(initialValue: selectedShoe.scale)
        _initialScale = State(initialValue: selectedShoe.scale)
        _shoeIsFavorite = AppStorage(wrappedValue: shoeIsFavorite, selectedShoe.favoriteKey)
    }
    
    var body: some View {
        VStack {
            Model3D(named: selectedShoe.model3DName, bundle: spatialShoesRCBundle) { model in
                model
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(scaleMagnified)
                    .offset(x: selectedShoe.offsetx, y: selectedShoe.offsety)
                    .rotation3DEffect(.degrees(rotationAngle),
                                      axis: (x: 0, y: -1, z: 0))
                    .rotation3DEffect(.degrees(Double(currentRotation)), axis: (x: 0, y: 1, z: 0))
                // .background(Color.green)
            } placeholder: {
                ProgressView()
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        let delta = value.translation.width - lastDragValue
                        velocity = delta / 10
                        lastDragValue = value.translation.width
                        if touch {
                            currentRotation += velocity
                        }
                    }
                    .onEnded { _ in
                        lastDragValue = 0.0
                        if touch {
                            startInertia()
                        }
                    }
            )
            .gesture(
                MagnifyGesture()
                    .onChanged { value in
                        let newScale = (1.0 - (value.magnification)) + initialScale
                        if newScale > 0.4, newScale < 1.0 {
                            scaleMagnified = newScale
                        }
                    }
                    .onEnded { _ in
                        initialScale = scaleMagnified
                    }
            )
        }
        .onAppear {
            doRotation()
        }
        .onChange(of: selectedShoe) { _, _ in
            scaleMagnified = selectedShoe.scale
            initialScale = selectedShoe.scale
            velocity = 0.0
            rotationAngle = 0.0
            currentRotation = 0.0
        }
        .toolbar {
            Toggle("Favorite", systemImage: "star", isOn: $shoeIsFavorite)
        }
    }
    
    func doRotation() {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { _ in
            let angle = rotationAngle + 0.2
            if rotate {
                rotationAngle = rotationAngle < 360 ? angle : 0
            }
        }
        RunLoop.current.add(timer, forMode: .common)
    }
    
    func startInertia() {
        let inertialTimer = Timer.scheduledTimer(withTimeInterval: 0.016, repeats: true) { timer in
            if abs(velocity) < 0.01 {
                timer.invalidate()
            } else {
                velocity *= 0.95
                currentRotation += velocity
            }
        }
        RunLoop.current.add(inertialTimer, forMode: .common)
    }
}

#Preview(windowStyle: .automatic) {
//    @State var touch = false
//    @State var rotate = true
//
//    ShoeDetail(selectedShoe: .test, touch: $touch, rotate: $rotate)
}
