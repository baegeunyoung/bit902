import { Component } from '@angular/core';
import { NavController, Platform } from 'ionic-angular';
import { Facebook, FacebookLoginResponse } from '@ionic-native/facebook';
import { HomePage } from '../home/home';
import { Storage } from '@ionic/storage'

@Component({
  selector: 'page-login',
  templateUrl: 'login.html'
})
export class LoginPage {
  id: any
  constructor(public navCtrl: NavController, private platform: Platform, private fb: Facebook, private storage: Storage) {

  }

  fbLonin() {
    if(this.platform.is('cordova')) {
      this.fb.login(['public_profile', 'user_friends', 'email']).then((res: FacebookLoginResponse) => {
        //alert(JSON.stringify(res));
        this.id = JSON.stringify(res);
        
        this.storage.ready().then(() => {
          this.storage.set('id',this.id);
        })

        this.navCtrl.setRoot(HomePage);
      },(e) => {
        alert(JSON.stringify(e));
      }); 
    } else {
      alert("Please run me on a device");
    }
  }
}
