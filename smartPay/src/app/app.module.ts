import { NgModule, ErrorHandler } from '@angular/core';
import { IonicApp, IonicModule, IonicErrorHandler } from 'ionic-angular';
import { MyApp } from './app.component';
import { BrowserModule } from '@angular/platform-browser';

import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

//pages
import { LoginPage } from '../pages/login/login';
import { BuyerPage } from '../pages/buyer/buyer';
import { PlaygroundPage} from '../pages/Playground/Playground';
import { RegisterPage} from '../pages/register/register';
import { HomePage } from '../pages/home/home';
import { StampPage } from  '../pages/stamp/stamp';

//providers
import { HttpWithToken } from '../providers/http-with-token';
import { HttpModule, JsonpModule} from '@angular/http';
import { AngularFireModule } from 'angularfire2';

const config = {
    apiKey: "AIzaSyB43Wfh2iDwFfXe54dxOhJSPDtUxwqMAdM",
    authDomain: "nerdiex-c6f41.firebaseapp.com",
    databaseURL: "https://nerdiex-c6f41.firebaseio.com",
    projectId: "nerdiex-c6f41",
    storageBucket: "nerdiex-c6f41.appspot.com",
    messagingSenderId: "1027012112085"
  };

@NgModule({
  declarations: [
    MyApp,
    LoginPage, PlaygroundPage, RegisterPage,
    HomePage,
    BuyerPage,
    StampPage 
  ],
  imports: [
    BrowserModule,
    IonicModule.forRoot(MyApp, {backButtonText : 'Back'}), HttpModule, JsonpModule,
    AngularFireModule.initializeApp(config)
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    LoginPage, PlaygroundPage, RegisterPage,
    HomePage,
    BuyerPage,
    StampPage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler}, HttpWithToken
  ]
})
export class AppModule {}
 