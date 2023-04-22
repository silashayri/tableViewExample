//
//  ViewController.swift
//  SehirTanitimKitabi
//
//  Created by Silas Hayri on 20.04.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sehirDizisi = [Sehir]()
    var kullaniciSecimi : Sehir?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // şehirler
        
        let istanbul = Sehir(isim: "Istanbul", bolge: "Marmara", gorsel: UIImage(named: "istanbul")!)
        let ankara   = Sehir(isim: "Ankara", bolge: "İç Anadolu", gorsel: UIImage(named: "ankara")!)
        let antalya = Sehir(isim: "Antalya", bolge: "Guney", gorsel: UIImage(named: "antalya")!)
        let van = Sehir(isim: "Van", bolge: "Doğu", gorsel: UIImage(named: "van")!)
        let izmir = Sehir(isim: "Izmir", bolge: "Ege", gorsel: UIImage(named: "izmir")!)
        
        sehirDizisi = [istanbul,ankara,antalya,van,izmir]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sehirDizisi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = sehirDizisi[indexPath.row].isim
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        kullaniciSecimi = sehirDizisi[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenSehir = kullaniciSecimi
                    
        }
    }
}
