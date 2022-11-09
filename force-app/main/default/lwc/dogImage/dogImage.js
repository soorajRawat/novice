import { LightningElement } from 'lwc';
import randomDogs from'@salesforce/apex/dogClass.randomDogs';


export default class DogImage extends LightningElement {
imageURL;

handleSuccess(){
    randomDogs().then((response)=>{
        var parseData=JSON.parse(response);
        console.log(response);
        console.log(parseData);
    this.imageURL=parseData.message;

        } );
}
}