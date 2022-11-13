import { LightningElement } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact'
import FIRSTNAME from '@salesforce/schema/Contact.FirstName'
import LASTNAME from '@salesforce/schema/Contact.LastName'
import ACCOUNTID from '@salesforce/schema/Contact.AccountId'

export default class ContactForm extends LightningElement {
    objectApi=CONTACT_OBJECT
    recordFields = [FIRSTNAME, LASTNAME,ACCOUNTID]
    handleSuccess(event){
        const newEvent = new ShowToastEvent({
        title : "Contact Created",
        message :"Conatct was Created",
        variant :"Success"
        });
        this.dispatchEvent(newEvent)
    }
}