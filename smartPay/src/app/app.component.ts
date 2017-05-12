import { Component, ViewChild } from '@angular/core';
import { Nav, MenuController, Platform, Events } from 'ionic-angular';
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';
//import { Http } from '@angular/http';

import { PlaygroundPage } from '../pages/Playground/Playground';
import { RegisterPage } from '../pages/register/register';
import { LoginPage } from '../pages/login/login';
import { LogoutPage } from '../pages/logout/logout';
import { HomePage } from '../pages/home/home';
import { BuyerPage } from '../pages/buyer/buyer';
import { StampPage } from '../pages/stamp/stamp';
import { FoodReadyPage } from '../pages/foodReady/foodReady';
import { Storage } from '@ionic/storage';

@Component({
  templateUrl: 'app.html'
})
export class MyApp {

  userName: string;

  @ViewChild(Nav) nav: Nav;

  rootPage = HomePage; 
  playgroundPage = PlaygroundPage;
  registerPage = RegisterPage;
  loginPage =  LoginPage;
  logoutPage = LogoutPage;
  buyerPage = BuyerPage;
  stampPage = StampPage;
  foodReadyPage = FoodReadyPage;
  
  constructor(public menu: MenuController, platform: Platform, statusBar: StatusBar, splashScreen: SplashScreen, public storage: Storage, private events: Events) {
    events.subscribe('login', (userEventData) => {
      
      this.userName = userEventData;
    })

    events.subscribe('logout',(Data) => {
      
      this.userName = Data;
    })

    storage.ready().then(() => {
      storage.get('userName').then((val) => {
        this.userName = val;
        console.log(this.userName);
      })
    });
  }

  openPage(page) {
    this.menu.close();
    this.nav.setRoot(page);
  }
}
