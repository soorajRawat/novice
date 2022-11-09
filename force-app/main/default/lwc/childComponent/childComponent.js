 import { LightningElement,api,track} from 'lwc';

export default class ChildComponent extends LightningElement {
    firstAdd=0
    secondAdd=0
    firstSub=0
    secondSub=0
    firstMulti=0
    secondMulti=0
    firstDiv=0
    secondDiv=0
    result=0
    HandleOne(event){
        this.firstAdd=event.detail.value
    }
    HandleTwo(event){
        this.secondAdd=event.detail.value
    }
    HandleThree(event){
        this.firstSub=event.detail.value
    }
    HandleFour(event){
        this.secondSub=event.detail.value
    }
    HandleFive(event){
        this.firstMulti=event.detail.value
    }
    HandleSix(event){
        this.secondMulti=event.detail.value
    }
    HandleSeven(event){
        this.firstDiv=event.detail.value
    }
    HandleEight(event){
        this.secondDiv=event.detail.value
    }
          
      result=0
    
    @api addValue(){
        this.result=Number(this.firstAdd)+Number(this.secondAdd)
        
    }
    @api subValue(){
        this.result=Number(this.firstSub)-Number(this.secondSub)
        
    }
    
    @api multiplyValue(){
        this.result=Number(this.firstMulti)*Number(this.secondMulti)
    }
    @api divideValue(){
        this.result=Number(this.firstDiv)/Number(this.secondDiv)
    }
}