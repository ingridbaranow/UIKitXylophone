//  ViewController.swift
//  Xylophone
//
//  Created by Ingrid Baranow on 24/03/2025.

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    @IBAction func keyPressed(_ sender: UIButton) {
    playSound(soundName: sender.currentTitle!)
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!) //cria um player de audio com o arquivo localizado
        player.play()
    }
    
    @IBAction func keyPressed2(_ sender: UIButton) {
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
        }
    }
}

// MARK: - Anotações:

// Quando botão for pressionado vai ativar a função "playSound" que está definida na linha 15, sendo que "soundName" é o nome do parametro e "sender.currentTitle" é o valor esperado -> exemplo: playSound(soundName: "C")

// Constante chama url ; Bundle.main = pacote principal onde ficam armazenados todos os recursos (imagens, sons, etc); .url = ação de procurar um arquivo no pacote (AVAudioPlayer trabalha com URLs); forResource = nome do arquivo, nesse caso o soundName que é o texto do botão pressionada equivale ao nome do arquivo; withExtension = a extensão do arquivo que está buscando, ou seja: busca o arquivo no pacote principal e usa o soundName como nome do arquivo

// DispatchQueue.main -> significa que a tarefa será executada de forma assincrona (sem bloquear/pausar outras tarefas [=DispatchQueue]) na fila principal (=main) = atualiza UI (UserInterface)
// .asyncAfter -> agenda o código para rodar depois de um intervalo de tempo
// deadline: .now() + 0.2 -> define o momento que o código será executado
// .now() -> pega o momento atual
// + 0.2 -> adiciona 0.2 segundos, ou seja, tarefa é executado 0.2 segundo depois do momento atual e nesse caso a tarefa é o alpha voltar para 100%
