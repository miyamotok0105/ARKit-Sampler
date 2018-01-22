//
//  PlaneDetectionViewController.swift
//  ARKit-Sampler
//
//  Created by Shuichi Tsutsumi on 2017/09/20.
//  Copyright © 2017 Shuichi Tsutsumi. All rights reserved.
//

import UIKit
import ARKit

//ARSCNViewDelegateを設定しておくことでrendererなどが使えるようになる。
class PlaneDetectionViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.scene = SCNScene()
        //特徴点を表示する設定
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //水平検出の設定
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        //セッション開始
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        sceneView.session.pause()
    }
    
    // MARK: - ARSCNViewDelegate
    //ARAnchorはARシーンの3D空間内に何かしらのオブジェクトを設置するための位置向きを保持
    
    //didadd：新しいアンカーに対応するノードがシーンに追加された
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        //平面を検出したらaddする
        guard let planeAnchor = anchor as? ARPlaneAnchor else {fatalError()}
        planeAnchor.addPlaneNode(on: node, color: UIColor.arBlue.withAlphaComponent(0.3))
    }
    
    //didUpdate：アンカーが更新された
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        //平面を検出したらupdateする
        guard let planeAnchor = anchor as? ARPlaneAnchor else {fatalError()}
        planeAnchor.updatePlaneNode(on: node)
    }
}

