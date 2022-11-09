import { LightningElement } from 'lwc';

export default class Calculator extends LightningElement {
    addFunc(){
       this.template.querySelector("c-add-child").show()
       
    }
    divFunc(){
        this.template.querySelector('c-div-child').show()
        
     }
     multiFunc(){
        this.template.querySelector('c-multiply-child').show()
       
     }
     subFunc(){
        this.template.querySelector('c-sub-child').show()
        
     }
}