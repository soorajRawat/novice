import { LightningElement } from 'lwc';

export default class HelloChamp extends LightningElement {
    message
    handleEvent(){
        this.message="Hello Champ!"
    }
}