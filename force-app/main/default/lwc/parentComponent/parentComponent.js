import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
    
    addInput(){
       this.template.querySelector("c-child-component").addValue()
    }
    subtractInput(){
        this.template.querySelector("c-child-component").subValue()
    }
    multipleInput(){
        this.template.querySelector("c-child-component").multiplyValue()
    }
    divideInput(){
        this.template.querySelector("c-child-component").divideValue()
    }
}