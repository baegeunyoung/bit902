import { Component, ViewChild } from '@angular/core';
import { Nav, MenuController, Platform } from 'ionic-angular';
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';
//import { Http } from '@angular/http';

import { PlaygroundPage } from '../pages/Playground/Playground';
import { RegisterPage } from '../pages/register/register';
import { LoginPage } from '../pages/login/login';
import { HomePage } from '../pages/home/home';
import { IbeaconPage } from '../pages/ibeacon/ibeacon';

@Component({
  templateUrl: 'app.html'
})
export class MyApp {
  @ViewChild(Nav) nav: Nav;

  rootPage = PlaygroundPage; 
  registerPage: any = RegisterPage;
  loginPage =  LoginPage;
  homePage = HomePage;
  ibeaconPage = IbeaconPage;
  constructor(public menu: MenuController, platform: Platform, statusBar: StatusBar, splashScreen: SplashScreen) {
    platform.ready().then(() => {
      console.log("platform ready");
      // Okay, so the platform is ready and our plugins are available.
      // Here you can do any higher level native things you might need.
      statusBar.styleDefault();
      splashScreen.hide();
    });
  }

  openPage(page) {
    this.menu.close();
    this.nav.setRoot(page);
  }

  login() {

  }
}
