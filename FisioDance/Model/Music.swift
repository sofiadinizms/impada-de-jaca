//
//  Music.swift
//  FisioDance
//
//  Created by sofiadinizms on 13/04/23.
//

import Foundation
import AVFoundation

var soundtrack: AVAudioPlayer!

func playSoundtrack(sound: String) {
    let url = Bundle.main.url(forResource: sound, withExtension: "mp3")
    
    guard url != nil else {
        return
    }
    
    do {
        
        soundtrack = try AVAudioPlayer(contentsOf: url!)
        soundtrack?.setVolume(0.2, fadeDuration: 0.1)
        soundtrack?.play()
//        soundtrack.numberOfLoops = -1
        
    } catch {
        print("error")
    }
    
    
}

func stopSoundtrack(sound: String) {
    let url = Bundle.main.url(forResource: sound, withExtension: "mp3")
    
    guard url != nil else {
        return
    }
    
    do {
        
        soundtrack = try AVAudioPlayer(contentsOf: url!)
        soundtrack?.setVolume(0.2, fadeDuration: 0.1)
        soundtrack?.stop()
//        soundtrack.numberOfLoops = -1
        
    } catch {
        print("error")
    }
    
    
}
