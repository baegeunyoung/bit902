import {Component} from "@angular/core";
import {NavParams} from "ionic-angular";

@Component({
  selector: 'page-details',
  templateUrl: 'details.html'
})
export class DetailsPage {
  title: string;
  pushMessage: string = "push message will be displayed here";
  filePath: string;
  storeName: string;
  constructor(public params: NavParams) {
    if (params.data.message) {
      this.pushMessage = params.data.message;
       this.filePath = params.data.filePath;
       this.title = params.data.title;
       this.storeName = params.data.storeName
    }
    if (params.data.filePath) {
     
    }
    if (params.data.title) {
      
    }
  }
}
