import { LightningElement ,wire} from "lwc";
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';

import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import contactRecords from '@salesforce/apex/contactClass.contactRecords';
const COLUMNS = [
{ label: ' FirstName', fieldName: FIRSTNAME_FIELD.fieldApiName, type: 'text' },
{ label: ' LastName', fieldName: LASTNAME_FIELD.fieldApiName, type: 'text' },

{ label: 'Title', fieldName: TITLE_FIELD.fieldApiName, type: 'text' }
];

export default class ContactDisplay extends LightningElement {
columns=COLUMNS;
//@wire(contactRecords)
contacts


recordsNum;
handleInput(event) {
this.recordsNum= event.detail.value;
}

handleSuccess(){
contactRecords({num:this.recordsNum}).then((data) => {
    console.log("Server returned response")
    console.log(data)
    this.contacts = data
        
        
    })
}
}
