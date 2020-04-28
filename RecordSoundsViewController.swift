//
//  RecordSoundsViewController.swift
//  app1
//
//  Created by Apple on 10/04/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import AVFoundation
class RecordSoundsViewController: UIViewController ,AVAudioRecorderDelegate{
    
    var audioRecorder: AVAudioRecorder!
    @IBOutlet weak var RecordButton: UIButton!
    @IBOutlet weak var Recording: UIButton!
    @IBOutlet weak var StopButton: UIButton!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StopButton.isEnabled=false
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear( animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func RecordButton(_ sender: Any) {
        print("Button is pressed")
        RecordLabel.text="Recording in progress"
        StopButton.isEnabled=true
        RecordButton.isEnabled=false
    
            let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask,true)[0] as String
            let recordingName = "recordedVoice.wav"
            let pathArray = [dirPath, recordingName]
            let filePath = URL(string: pathArray.joined(separator: "/"))

            let session = AVAudioSession.sharedInstance()
            try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

            try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
            audioRecorder.delegate=self
            audioRecorder.isMeteringEnabled = true
            audioRecorder.prepareToRecord()
            audioRecorder.record()
        
}
       
    
    @IBAction func StopButton(_ sender: Any) {
    RecordButton.isEnabled = true
    StopButton.isEnabled = false
    RecordLabel.text = "Tap to Record"
    audioRecorder.stop()
    let audioSession = AVAudioSession.sharedInstance()
    try! audioSession.setActive(false)
        
    }
    
    @IBOutlet weak var RecordLabel: UILabel!
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Finished Recording")
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        }
        else {
            print("Recording was not successful")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="stopRecording"{
            let playSoundsVC=segue.destination as!PlaySoundViewController
            let recordAudioURL=sender as! URL
            playSoundsVC.recordAudioUrl=recordAudioURL
        }
        
        
    }
}
    
    
    
   


