import { Component } from '@angular/core';
import { Http, RequestOptions, Headers } from '@angular/http';
import { NavController, NavParams } from 'ionic-angular';
 
/*
  Generated class for the Register page.

  See http://ionicframework.com/docs/v2/components/#navigation for more info on
  Ionic pages and navigation.
*/
@Component({
  selector: 'page-register',
  templateUrl: 'register.html'
})

export class RegisterPage {
  data : any;
  constructor(public navCtrl: NavController, public navParams: NavParams, public http: Http) {
    this.data = {};
    this.data.id = "";
    this.data.password = "";
    this.data.name = "";
    this.data.cellphoneNumber = "";
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad RegisterPage');
  }

  regist() {
    let id = this.data.id;
    let password = this.data.password;
    let name = this.data.name;
    let cellphoneNumber = this.data.cellphoneNumber;
    let data = JSON.stringify({id, password, name, cellphoneNumber});
    let link = "http://14.32.66.123:10001/bit902app/book/regist.do";
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({headers: headers});
  
    console.log(data);
    this.http.post(link, data, options)
      .map(res => res.json())
      .subscribe(data=>{
        console.log(data);
        console.log("success");
        alert(data.msg);
      },error => {
        console.log("error");
      }); 
    //this.navCtrl.push(LoginPage);
  }

 
}
