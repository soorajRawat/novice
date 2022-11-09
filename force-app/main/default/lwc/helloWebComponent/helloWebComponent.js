import { LightningElement } from 'lwc';

export default class HelloWebComponent extends LightningElement {
greetings;
currentDate = new Date().toDateString();
get capitalizedGreeting() {
	return "hello ${this.greeting.toUpperCase()}!";
}
handleGreetingChange(event){
    this.greetings=event.target.value;
}
}