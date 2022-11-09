import { LightningElement } from 'lwc';

export default class CalculateInput extends LightningElement {
    firstInput=0
    secondInput=0
    result=0
    FirstValue(event){
        this.firstInput=event.detail.value
    }
    SecondValue(event){
        this.secondInput=event.detail.value
    }
    AddInput(){
        this.result=Number(this.firstInput)+Number(this.secondInput)
    }
    SubtractInput(){
        this.result=Number(this.firstInput)-Number(this.secondInput)
    }
    MultiplyInput(){
        this.result=Number(this.firstInput)*Number(this.secondInput)
    }
    DivideInput(){
        this.result=Number(this.firstInput)/Number(this.secondInput)
    }
    Increment2(){
        this.result=this.result+2
    }
}