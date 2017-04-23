import { Component, ViewChild } from '@angular/core';
import { NavController, NavParams, Card } from 'ionic-angular';
import { Http, RequestOptions, Headers } from '@angular/http';

@Component({
    selector: 'page-stamp',
    templateUrl: 'stamp.html'
})
export class StampPage {
    @ViewChild(Card) stamp: Card;
    private html:string = "";
    private myStamp:string = "";
    private major:number = 0;
    constructor(public NavCtrl: NavController, public navParams: NavParams, public http: Http) {}

    myMarkets() {
    
        let link = "http://14.32.66.123:9090/bit902app/stamp/allStamp.do";
        this.html = "";
        this.http.get(link)
        .map(res => res.json())
        .subscribe(data => {

            console.log("success");
            console.log(data);
            for(let i = 0 ; i < data.length ; i++) {
                this.html += "스탬프 종류 : " + data[i].buyerStampNo + "<br><p> 모은갯수 : " + data[i].stampCount + " 스탬프 번호 : " + data[i].sellerStampNo + "</p>";
            }
            console.log(this.html);
        },error => {
            console.log("error");
        });
    }

    onlyMyStamp() {
        let myNo = 1;
        this.major = myNo;
        let data = myNo;
        this.myStamp = "";
        let link = "http://14.32.66.123:9090/bit902app/stamp/onlyMyStamp.do";
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
