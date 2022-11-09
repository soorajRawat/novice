import { LightningElement, api} from 'lwc';

export default class DivChild extends LightningElement {

    showDiv=false
    NumberOne=0
    NumberTwo=0
    Result=0
    
    @api show(){
        this.showDiv=true
    }   
    EnterFirst(event){
        this.NumberOne=event.target.value
    }
    EnterSec(event){
        this.NumberTwo=event.target.value
    }
    DivFunc(){
        this.Result=Number(this.NumberOne)/Number(this.NumberTwo)
    }
    dialogClose(){
        this.showDiv=false
    }   
    }