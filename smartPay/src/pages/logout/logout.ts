import { Component } from '@angular/core';
import { NavController, Events } from 'ionic-angular';
import { HomePage } from '../home/home';
import { Storage } from '@ionic/storage';
import { Facebook } from '@ionic-native/facebook';

@Component({
    templateUrl: 'logout.html'
})
export class LogoutPage {
    data: string;
    division: string;
    constructor(public navCtrl: NavController, private storage: Storage, private fb: Facebook, public events: Events) {
        this.storage.get('division').then((val) => {
            this.division = val;
          });
    }


    ionViewDidLoad() {
        this.logout();
    }

    logout() {
        if(this.division == "facebook") {
            this.fb.logout().then((data) => {
                this.navCtrl.setRoot(HomePage);
            
                this.storage.remove('userName').then((val) => {
                this.data = val;
                this.events.publish("logout", this.data);
                });
            });
        } else {
            this.storage.remove('userName').then((val) => {
                this.data = val;
                this.navCtrl.setRoot(HomePage);
                this.events.publish("logout", this.data);
            });
        }
    }
}