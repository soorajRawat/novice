import { LightningElement } from 'lwc';

export default class DogBreeds extends LightningElement {
    dogBreeds;
    connectedCallback(){
        fetch("https://dog.ceo/api/breeds/list/all",{method:"GET"})
        .then((response)=>response.json())
        .then((data)=>{
            this.dogBreeds=data.message;
        }
        )
    }
}