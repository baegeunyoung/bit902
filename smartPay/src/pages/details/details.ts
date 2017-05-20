import {Component} from "@angular/core";
import {NavParams} from "ionic-angular";

@Component({
  templateUrl: 'details.html'
})
export class DetailsPage {
  pushMessage: string = "push message will be displayed here";
  filePath: string;
  constructor(public params: NavParams) {
    if (params.data.message) {
      this.pushMessage = params.data.message;
    }
    if (params.data.filePath) {
      this.filePath = params.data.filePath;
    }
  }
}
