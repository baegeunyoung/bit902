import { Component, ViewChild } from '@angular/core';
import { NavController, NavParams, Card,} from 'ionic-angular';
import { Http, Jsonp } from '@angular/http';

/*
  Generated class for the Login page.

  See http://ionicframework.com/docs/v2/components/#navigation for more info on
  Ionic pages and navigation.
*/
@Component({
  selector: 'page-login',
  templateUrl: 'login.html'
})
export class LoginPage {
  @ViewChild(Card) login: Card;
  private html:string = "" ;
  constructor(public navCtrl: NavController, public navParams: NavParams, public http : Http , private jsonp : Jsonp) {}

  ionViewDidLoad() {
    console.log('ionViewDidLoad LoginPage');
  }
  
  buyerList() {
      let link = "http://192.168.0.200:9090/bit902app/book/timeCheck.do";
      this.html = "";
      this.http.get(link)
        .map(res => res.json())
        .subscribe(data=>{
          
          console.log("success");
          console.log(data);
          	for(let i = 0; i < data.length; i++) {
              console.log(data[i].name);
            	this.html += "<p> 이름 : " + data[i].name + " 아이디 : " + data[i].id + " 전화번호 :  " + data[i].cellphoneNumber + "</p>";
					}
          console.log(this.html);
        },error => {
          console.log("error");
        }); 
    }
  
}
