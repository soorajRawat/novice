import { LightningElement } from 'lwc';

export default class RandomDog extends LightningElement {
    imageURL;

    connectedCallback(){
        fetch( "https://dog.ceo/api/breeds/image/random" ,{method:"GET"})
        .then((response)=>response.json())
        .then((data)=> {
            this.imageURL=data.message;
        });
    }
}