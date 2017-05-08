import { Component, ViewChild } from '@angular/core';
import { NavController, NavParams, Card } from 'ionic-angular';
import { Http, RequestOptions, Headers } from '@angular/http';
  
@Component({
    selector: 'page-stamp',
    templateUrl: 'stamp.html'
})
export class StampPage {
    @ViewChild(Card) stamp: Card;
    amount: string = "";
    private myStamp:string = "";
    constructor(public NavCtrl: NavController, public navParams: NavParams, public http: Http) {
        if (navParams.data.amount) {
            this.amount = navParams.data.amount;
        }
    }

    onlyMyStamp() {
        let myNo = 1;
        let data = myNo;
        this.myStamp = "";
        let link = "http://14.32.66.123:10001/bit902app/stamp/onlyMyStamp.do";
        let headers = new Headers({'Content-Type' : 'application/json'});
        let options = new RequestOptions({headers : headers});

        this.http.post(link, data, options)
        .map(res => res.json())
        .subscribe(data => {
            this.myStamp = data;
        },error => {
            console.log("error");
        });
    }
}
