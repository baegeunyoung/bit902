import { Component } from '@angular/core';
import { NavController, Platform, Events } from 'ionic-angular';
import { Facebook, FacebookLoginResponse } from '@ionic-native/facebook';
import { HomePage } from '../home/home';
import { Storage } from '@ionic/storage';
import { Http, RequestOptions, Headers } from '@angular/http';

@Component({
  selector: 'page-login',
  templateUrl: 'login.html'
})
export class LoginPage {
  user
  userName: string;
  data: any;
  private html: string = "";
  constructor(public navCtrl: NavController, private platform: Platform, private fb: Facebook, private storage: Storage, private events: Events, public http: Http) {
    this.data = {};
    this.data.id = "";
    this.data.password = "";
  }

  login() {
    let id = this.data.id;
    let password = this.data.password;
    this.html = "";
    let data = JSON.stringify({id, password});
    let link = "http://14.32.66.123:10001/bit902app/login/selectOneBuyer.do";
    let headers = new Headers({'Content-Type' : 'application/json'});
    let options = new RequestOptions({headers: headers});
    console.log('데이터 : ' + data);
    this.http.post(link, data, options)
      .map(res => res.json())
      .subscribe(data => {
        console.log('성공 : ' + JSON.stringify(data));
        this.storage.set('userName', this.data.id);
        this.navCtrl.setRoot(HomePage);
        this.events.publish('login', this.data.id);
      }, (e) => {
        console.log('에러 : ' + JSON.stringify(e));
      })
  }

  facebookLogin() {
    if(this.platform.is('cordova')) {
      this.fb.login(['public_profile', 'user_friends', 'email']).then((res: FacebookLoginResponse) => {
       
        this.fb.api('me?fields=email,name', null).then((res) => {
          this.storage.set('userName', res.name);
          this.storage.set('division', 'facebook')
          
          this.navCtrl.setRoot(HomePage);

          this.storage.get('userName').then((val) => {
            this.userName = val;
            this.events.publish('login', this.userName);
          });
          
        },(e) => {
          alert(JSON.stringify(e));
        })

      },(e) => {
        alert(JSON.stringify(e));
      }); 
    } else {
      alert("Please run me on a device");
    }
  }
}
