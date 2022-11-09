import { LightningElement,api} from 'lwc';

export default class AddChild extends LightningElement {
showAdd=false
NumberOne=0
NumberTwo=0
Result=0

@api show(){
    this.showAdd=true
}   
EnterFirst(event){
    this.NumberOne=event.detail.value
}
EnterSec(event){
    this.NumberTwo=event.detail.value
}
AddValue(){
    this.Result=Number(this.NumberOne)+Number(this.NumberTwo)
}
dialogClose(){
    this.showAdd=false
}   
}

