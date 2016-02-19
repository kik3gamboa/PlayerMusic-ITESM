//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Telecomunicaciones Abiertas de México on 2/19/16.
//  Copyright © 2016 Telecomunicaciones Abiertas de México. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    private var reproductor: AVAudioPlayer!
    
    var id: String = ""
    var cover: String = ""
    var cancion: String = ""
    var album: String = ""
    @IBOutlet weak var CoverImg: UIImageView!
    @IBOutlet weak var cancionLbl: UILabel!
    @IBOutlet weak var albumLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("1:\(cover) 2:\(cancion) 3:\(album) ")
        cover = cover + ".jpg"
        CoverImg.image = UIImage(named: cover)
        cancionLbl.text = cancion
        albumLbl.text = album

        
        switch (id){
        case "1":
            let sonidoURL = NSBundle.mainBundle().URLForResource("A Sky Full of Stars", withExtension: "mp3")
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
            } catch {
                print("Error al cargar el archivo sonido...")
            }
            break
            
        case "2":
            let sonidoURL = NSBundle.mainBundle().URLForResource("Alive", withExtension: "mp3")
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
            } catch {
                print("Error al cargar el archivo sonido...")
            }
            break
            
        case "3":
            let sonidoURL = NSBundle.mainBundle().URLForResource("Mis Sentimientos", withExtension: "mp3")
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
            } catch {
                print("Error al cargar el archivo sonido...")
            }
            break
            
        case "4":
            let sonidoURL = NSBundle.mainBundle().URLForResource("Muerte En Hawai", withExtension: "mp3")
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
            } catch {
                print("Error al cargar el archivo sonido...")
            }
            break
            
        case "5":
            let sonidoURL = NSBundle.mainBundle().URLForResource("Go", withExtension: "mp3")
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
            } catch {
                print("Error al cargar el archivo sonido...")
            }
            break
            
        case "6":
            let sonidoURL = NSBundle.mainBundle().URLForResource("Riot Van", withExtension: "mp3")
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
            } catch {
                print("Error al cargar el archivo sonido...")
            }
            break
            
        case "7":
            let sonidoURL = NSBundle.mainBundle().URLForResource("The Bay", withExtension: "mp3")
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
            } catch {
                print("Error al cargar el archivo sonido...")
            }
            break
            
        default:
            print("Error de playing...")
            
        }

        reproductor.play()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func play() {
        if !reproductor.playing{
            reproductor.play()
        }
    }

    @IBAction func pause() {
        if reproductor.playing{
            reproductor.pause()
        }
    }

    @IBAction func stop() {
        if reproductor.playing{
            reproductor.stop()
            reproductor.currentTime = 0.0
        }
    }
    
    @IBAction func volumeMin(sender: UIBarButtonItem) {
        if( reproductor.volume > 0){
            reproductor.volume -= 0.1
        } else {
            let alert = UIAlertController(title: "Volume", message: "Ha llegado al nivel más bajo.", preferredStyle: .Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) in
                print("Ok")
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    

    @IBAction func volumeMax(sender: UIBarButtonItem) {
        if( reproductor.volume < 1.5){
            reproductor.volume += 0.1
        } else {
            let alert = UIAlertController(title: "Volumen", message: "No se puede elevar más el nivel por salud.", preferredStyle: .Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) in
                print("Ok")
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
}