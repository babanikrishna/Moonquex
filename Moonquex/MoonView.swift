//
//  MoonView.swift
//  Moonquex
//
//  Created by Krishna Babani on 10/8/23.
//

import SwiftUI
import SceneKit

struct MoonView: UIViewRepresentable {
    
    @Binding var showLatLongLines: Bool
        @Binding var showMoonquakes: Bool
        @Binding var showLunarData: Bool
    
    var moonquakeTapped: (MoonQuakes) -> Void
    
    func makeUIView(context: Context) -> SCNView {
        
        let sceneView = SCNView()
        sceneView.scene = SCNScene()
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = UIColor.black
        
        sceneView.scene?.background.contents = UIImage(named: "StarMap.png")
        sceneView.antialiasingMode = .multisampling4X
        
        return sceneView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: MoonView
        
        init(_ parent: MoonView) {
            self.parent = parent
        }
        
        @objc func handleTap(_ gestureRecognize: UIGestureRecognizer) {
            let scnView = gestureRecognize.view as! SCNView
            let p = gestureRecognize.location(in: scnView)
            let hitResults = scnView.hitTest(p, options: [:])
            
            if hitResults.count > 0 {
                let result: SCNHitTestResult = hitResults[0]
                let node = result.node
                if let id = UUID(uuidString: node.name ?? ""),
                   let moonquake = MoonQuakes.allMoonquakes.first(where: { $0.id == id }) {
                    parent.moonquakeTapped(moonquake)
                }
            }
        }
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        
        uiView.scene?.rootNode.enumerateChildNodes { node, stop in
                node.removeFromParentNode()
            }
        
        setupMoon(in: uiView)
        setupSunAndLight(in: uiView)
        setupCamera(in: uiView)
        if showLatLongLines {
            setupLongitudeLines(in: uiView)
            setupLatitudeLines(in: uiView)
        }
        
        if showMoonquakes {
            plotMoonquakes(in: uiView)
        }
        
        if showLunarData {
            lunarPlotFunction(in: uiView)
        }
        
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(_:)))
        uiView.addGestureRecognizer(tapGesture)
    }
    
    func setupSunAndLight(in view: SCNView) {
        let sunlight = SCNLight()
        sunlight.type = .directional
        sunlight.color = UIColor.white
        sunlight.intensity = 1000
        
        let sunSphere = SCNSphere(radius: 2)
        
        let sunMaterial = SCNMaterial()
        sunMaterial.diffuse.contents = UIImage(named: "SunMap.png")
        sunMaterial.lightingModel = .constant
        sunSphere.materials = [sunMaterial]
        
        let sunNode = SCNNode(geometry: sunSphere)
        sunNode.position = SCNVector3(x: 0, y: 0, z: 90)
        
        let containerNode = SCNNode()
        containerNode.addChildNode(sunNode)
        
        let sunlightNode = SCNNode()
        sunlightNode.light = sunlight
        sunlightNode.position = sunNode.position
        containerNode.addChildNode(sunlightNode)
        
        view.scene?.rootNode.addChildNode(containerNode)
        
        let lookAtMoonConstraint = SCNLookAtConstraint(target: view.scene?.rootNode.childNode(withName: "moon", recursively: false))
        lookAtMoonConstraint.isGimbalLockEnabled = true
        containerNode.constraints = [lookAtMoonConstraint]
    }
    
    func setupMoon(in view: SCNView) {
        let sphere = SCNSphere(radius: 1.0)
        sphere.segmentCount = 200
        
        let ambientLight = SCNLight()
        ambientLight.type = .ambient
        ambientLight.color = UIColor(white: 0.15, alpha: 1)
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = ambientLight
        view.scene?.rootNode.addChildNode(ambientLightNode)
        
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "ColorMap.png")
        material.displacement.intensity = 0.0008
        material.displacement.contents = UIImage(named: "DisplacementMap.png")
        sphere.materials = [material]
        
        let sphereNode = SCNNode(geometry: sphere)
        sphereNode.name = "moon"
        sphereNode.position = SCNVector3(x: 0, y: 0, z: 0)
        view.scene?.rootNode.addChildNode(sphereNode)
    }
    
    func setupLatitudeLines(in view: SCNView) {
        let radius: CGFloat = 1.01
        
        let coordinatesNode = SCNNode()
        view.scene?.rootNode.addChildNode(coordinatesNode)
        for i in stride(from: -90, to: 90, by: 10) {
            let latRadians = CGFloat(i) * .pi / 180.0
            let y = radius * sin(latRadians)
            let currentRadius = radius * cos(latRadians)
            
            let torus = SCNTorus(ringRadius: currentRadius, pipeRadius: 0.002)
            torus.firstMaterial?.diffuse.contents = UIColor.green
            let torusNode = SCNNode(geometry: torus)
            torusNode.position.y = Float(y)
            coordinatesNode.addChildNode(torusNode)
        }
    }
    
    
    func setupLongitudeLines(in view: SCNView) {
        let radius: CGFloat = 1.01
        let coordinatesNode = SCNNode()
        view.scene?.rootNode.addChildNode(coordinatesNode)
        
        for i in stride(from: 0, to: 360, by: 15) {
            let longRadians = CGFloat(i) * .pi / 180.0
            
            let torus = SCNTorus(ringRadius: radius, pipeRadius: 0.002)
            torus.firstMaterial?.diffuse.contents = UIColor.green
            let torusNode = SCNNode(geometry: torus)
            torusNode.rotation = SCNVector4(1, 0, 0, Float.pi / 2)
            torusNode.eulerAngles.y = Float(-longRadians)
            coordinatesNode.addChildNode(torusNode)
        }
    }
    
    func plotMoonquakes(in view: SCNView) {
        let offset = 1.01
        for moonquake in MoonQuakes.allMoonquakes {
            let latitudeRadians = (90 - moonquake.latitude) * .pi / 180
            let longitudeRadians = (moonquake.longitude + 90) * .pi / 180
            
            let x = offset * cos(latitudeRadians) * cos(longitudeRadians)
            let y = offset * cos(latitudeRadians) * sin(longitudeRadians)
            let z = offset * sin(latitudeRadians)
            
            let symbolImage = UIImage(systemName: "waveform.path")
            
            let plane = SCNPlane(width: 0.03, height: 0.03)
            let material = SCNMaterial()
            
            
            if let magnitude = moonquake.magnitude {
                switch magnitude {
                case 0...1:
                    material.diffuse.contents = UIColor.systemBlue
                case 1...2:
                    material.diffuse.contents = UIColor.systemGreen
                case 2...3:
                    material.diffuse.contents = UIColor.systemYellow
                default:
                    material.diffuse.contents = UIColor.systemRed
                }
            } else {
                material.diffuse.contents = UIColor.systemBlue
            }
            
            material.transparent.contents = symbolImage
            plane.materials = [material]
            
            let node = SCNNode(geometry: plane)
            node.position = SCNVector3(x: Float(x), y: Float(y), z: Float(z))
            node.look(at: SCNVector3(x: -2 * Float(x), y: -2 * Float(y), z: -2 * Float(z)), up: SCNVector3(0, 1, 0), localFront: node.worldFront)
            
            node.name = "\(moonquake.id.uuidString)"
            
            if let moonNode = view.scene?.rootNode.childNode(withName: "moon", recursively: false) {
                moonNode.addChildNode(node)
            }
        }
    }
    
    func lunarPlotFunction(in view: SCNView) {
        let offset = 1.01
        for location in lunarLocations {
            let latitudeRadians = (90 - location.latitude) * .pi / 180
            let longitudeRadians = (location.longitude + 90) * .pi / 180
            
            let x = offset * cos(latitudeRadians) * cos(longitudeRadians)
            let y = offset * cos(latitudeRadians) * sin(longitudeRadians)
            let z = offset * sin(latitudeRadians)
            
            let symbol = location.category.sfSymbolName
            let symbolImage = UIImage(systemName: symbol)
            
            let plane = SCNPlane(width: 0.01, height: 0.01)
            let material = SCNMaterial()
            switch location.category {
            case .mare:
                material.diffuse.contents = UIColor.cyan
            case .crater:
                material.diffuse.contents = UIColor.purple
            case .mountain:
                material.diffuse.contents = UIColor.orange
            case .apollo:
                material.diffuse.contents = UIColor.systemPink
            }
            material.transparent.contents = symbolImage
            plane.materials = [material]
            
            let node = SCNNode(geometry: plane)
            node.position = SCNVector3(x: Float(x), y: Float(y), z: Float(z))
            node.look(at: SCNVector3(x: -2*Float(x), y: -2*Float(y), z: -2*Float(z)), up: SCNVector3(0, 1, 0), localFront: node.worldFront)
            
            let text = SCNText(string: location.name, extrusionDepth: 0.01)
            let textNode = SCNNode(geometry: text)
            textNode.scale = SCNVector3(0.002, 0.002, 0.002)
            textNode.position = SCNVector3(x: 0, y: 0.01, z: 0)
            node.addChildNode(textNode)
            
            if let moonNode = view.scene?.rootNode.childNode(withName: "moon", recursively: false) {
                moonNode.addChildNode(node)
            }
        }
    }
    
    
    func setupCamera(in view: SCNView) {
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 3.5)
        
        let lookAtMoonConstraint = SCNLookAtConstraint(target: view.scene?.rootNode.childNode(withName: "moon", recursively: false))
        lookAtMoonConstraint.isGimbalLockEnabled = true
        cameraNode.constraints = [lookAtMoonConstraint]
        
        view.scene?.rootNode.addChildNode(cameraNode)
        view.pointOfView = cameraNode
    }
}

