//
//  main.swift
//  binaryTree
//
//  Created by Tuncay Cansız on 30.12.2017.
//  Copyright © 2017 Tuncay Cansız. All rights reserved.
//

import Foundation

// Bize verilen düğüm sınıfı
class Node{
    var value: Int
    var rightChild: Node?
    var leftChild: Node?

    init(value: Int) {
        self.value = value
    }
}

// Soruda bizden preorder  sıralama istenmektedir.
// Bunun açıklaması kısaca kök'ün sağ yapraktan büyük sol yapraktan küçük olması demektir.



class BinaryTree{
    private var root: Node?

    func insert(value: Int){
        if self.root == nil{
            self.root = Node(value: value)
        }
        else{
            self.insert(value: value, node: root!)
        }
    }

    private func insert(value: Int, node: Node){
        if value > node.value{
            if node.rightChild == nil{
                node.rightChild = Node(value: value)
            }
            else{
                self.insert(value: value, node: node.rightChild!)
            }
        }
        else{
            if node.leftChild == nil{
                node.leftChild = Node(value: value)
            }
            else{
                self.insert(value: value, node: node.leftChild!)
            }
        }
    }


    private func isEmpty(value: Int)-> Bool{
        return self.isEmpty(val: value, node: root!)
    }

    private func isEmpty(val: Int, node: Node)-> Bool{
        if val == node.value{
            return true
        }
        if val > node.value && node.rightChild != nil{
            return isEmpty(val: val, node: node.rightChild!)
        }

        if val < node.value && node.leftChild != nil{
            return isEmpty(val: val, node: node.leftChild!)
        }
        return false
    }


    func preOrder(){
        self.preOrder(node: self.root!)
    }

    private func preOrder(node: Node){
        print(node.value,  terminator: " ")
        if node.leftChild != nil{
            preOrder(node: node.leftChild!)
        }
        if node.rightChild != nil{
            preOrder(node: node.rightChild!)
        }
    }


    func inOrder(){
        self.inOrder(node: self.root!)
    }

    private func inOrder(node: Node){

        if node.leftChild != nil{
            inOrder(node: node.leftChild!)
        }
        print(node.value,  terminator: " ")
        if node.rightChild != nil{
            inOrder(node: node.rightChild!)
        }
    }

    func postOrder(){
        self.postOrder(node: self.root!)
    }
    private func postOrder(node: Node){
        if node.leftChild != nil{
            postOrder(node: node.leftChild!)
        }

        if node.rightChild != nil{
            postOrder(node: node.rightChild!)
        }
        print(node.value,  terminator: " ")
    }
}


func random()-> Int{
    let random = Int(arc4random_uniform(100))
    return random
}


let myTree = BinaryTree()

for i in 0...20{
     myTree.insert(value: random())
}

print("Preorder: ", terminator: "") //  kök, sol, sağ
myTree.preOrder()
print("\n")
print("Inorder: ", terminator: "") // sol, kök, sağ
myTree.inOrder()
print("\n")
print("Postorder: ", terminator: "") // sol, sağ, kök
myTree.postOrder()
print("\n")




