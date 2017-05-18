import { Component } from '@angular/core';
import { Storage } from '@ionic/storage';
import { Http, RequestOptions, Headers } from '@angular/http';
import { NavController, NavParams } from 'ionic-angular';


interface orderHistory {
    storeName: string;
    menuName: string;
    quantity: number;
    orderState: number;
    orderDate: any;
    filePath: string;
    systemName: string;
}

@Component({
    selector: 'page-orderHistory',
    templateUrl: 'orderHistory.html'
})
export class OrderHistoryPage {
    historyList: orderHistory;
    userName: string;
    constructor(public navCtrl: NavController, private storage: Storage, public http: Http) {
    }


    ionViewDidLoad() {
        this.storage.get('userName').then((val) => {
            this.userName = val;
        this.getHistory();
          });
    }

    getHistory() {
        let userName = this.userName;
        console.log(userName);
        let data = JSON.stringify(userName);
        let link = "http://14.32.66.123:10001/bit902app/home/orderHistory.do";
         let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({headers: headers});
  
    console.log(data);
    this.http.post(link, data, options)
      .map(res => res.json())
      .subscribe(data=>{
             this.historyList = data;
              
            }, (error) => {
              console.log('에러 : ' + JSON.stringify(error));
            });
    }
             
}