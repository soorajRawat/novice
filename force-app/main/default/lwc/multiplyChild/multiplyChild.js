import { LightningElement ,api} from 'lwc';

export default class MultiplyChild extends LightningElement {
    showMulti=false
    NumberOne=0
    NumberTwo=0
    Result=0
    
    @api show(){
        this.showMulti=true
    }   
    EnterFirst(event){
        this.NumberOne=event.target.value
    }
    EnterSec(event){
        this.NumberTwo=event.target.value
    }
    MultiFunc(){
        this.Result=Number(this.NumberOne)*Number(this.NumberTwo)
    }
    dialogClose(){
        this.showMulti=false
    }   
    }