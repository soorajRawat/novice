import { LightningElement ,api} from 'lwc';

export default class SubChild extends LightningElement {
    showSub=false
    NumberOne=0
    NumberTwo=0
    Result=0
    
    @api show(){
        this.showSub=true
    }   
    EnterFirst(event){
        this.NumberOne=event.target.value
    }
    EnterSec(event){
        this.NumberTwo=event.target.value
    }
    SubValue(){
        this.Result=Number(this.NumberOne)-Number(this.NumberTwo)
    }
    dialogClose(){
        this.showSub=false
    }   
    }