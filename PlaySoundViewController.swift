//
//  PlaySoundViewController.swift
//  app1
//
//  Created by Apple on 13/04/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import AVFoundation
class PlaySoundViewController: UIViewController {
    var recordAudioUrl :URL!
    @IBOutlet weak var FastButton: UIButton!
    @IBOutlet weak var SlowButton: UIButton!
    @IBOutlet weak var HighButton: UIButton!
    @IBOutlet weak var LowButton: UIButton!
    @IBOutlet weak var EchoButton: UIButton!
    @IBOutlet weak var ReverbButton: UIButton!
    @IBOutlet weak var StopButton: UIButton!
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    enum ButtonType: Int {case fast=0,slow, chipmunk, vader, echo, reverb}
    
    // MARK: Actions

    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .fast:
            playSound(rate: 1.5)
        case .slow:
            playSound(rate: 0.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }

        configureUI(.playing)
    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        setupAudio()
        print("Stop Audio Button Pressed")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
// Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    

    

}
