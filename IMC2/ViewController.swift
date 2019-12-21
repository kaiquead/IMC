//
//  ViewController.swift
//  IMC2
//
//  Created by Kaique Alves on 22/11/19.
//  Copyright © 2019 Kaique Alves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //variaveis
    @IBOutlet weak var tfPeso: UITextField!
    @IBOutlet weak var tfAltura: UITextField!
    @IBOutlet weak var lbResultado: UILabel!
    @IBOutlet weak var ivResultado: UIImageView!
    @IBOutlet weak var viResultado: UIView!
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //funcao para quando clicar fora do texto o teclado fechar
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        viResultado.endEditing(true)
    }

    @IBAction func calcular(_ sender: Any) {
        if let peso = Double(tfPeso.text!), let altura = Double(tfAltura.text!){
           imc = peso/(altura*altura)
            MostraResultado()
        }
    }
    
    func MostraResultado(){
        var resultado:String = ""
        var imagem:String = ""
        
        switch imc {
            case 0..<16:
                resultado = "Magreza"
                imagem = "magreza"
            
            case 16..<18.5:
                resultado = "Abaixo do Peso"
                imagem = "abaixo"
            
            case 18.5..<25:
                resultado = "Peso Ideal"
                imagem = "ideal"
            
            case 25..<30:
                resultado = "Sobrepeso"
                imagem = "sobre"
            
            default:
                resultado = "Obesidade"
                imagem = "obesidade"
        }
        lbResultado.text = "\(Int(imc)): \(resultado)" //converte p/ int para arredondar
        ivResultado.image = UIImage(named: imagem)
        viResultado.isHidden = false
        view.endEditing(true) // usado para finalizar a edicao e o teclado sumir
    }
    
}

