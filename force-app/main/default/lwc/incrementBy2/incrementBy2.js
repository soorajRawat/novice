import { LightningElement } from 'lwc';

export default class IncrementBy2 extends LightningElement {
    result=0
    handleEvent(){
        this.result=this.result+2
    }
}