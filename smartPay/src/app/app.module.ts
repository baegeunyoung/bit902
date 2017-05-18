import { NgModule, ErrorHandler } from '@angular/core';
import { IonicApp, IonicModule, IonicErrorHandler } from 'ionic-angular';
import { MyApp } from './app.component';
import { BrowserModule } from '@angular/platform-browser';

import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';
import { IonicStorageModule } from '@ionic/storage';
//pages
import { LoginPage } from '../pages/login/login';
import { LogoutPage } from '../pages/logout/logout';
import { BuyerPage } from '../pages/buyer/buyer';
import { PlaygroundPage} from '../pages/Playground/Playground';
import { RegisterPage} from '../pages/register/register';
import { HomePage } from '../pages/home/home';
import { StampPage } from  '../pages/stamp/stamp';
import { FoodReadyPage } from  '../pages/foodReady/foodReady';
import { DetailsPage } from '../pages/details/details';
import { validityCheck } from '../pages/register/registerService';
import { OrderHistoryPage }  from '../pages/orderHistory/orderHistory';
//providers
import { HttpWithToken } from '../providers/http-with-token';
import { HttpModule, JsonpModule} from '@angular/http';
import { Push } from "@ionic-native/push";
import { Facebook } from '@ionic-native/facebook';



@NgModule({
  declarations: [
    MyApp,
    LoginPage, 
    PlaygroundPage, 
    RegisterPage,
    HomePage,
    BuyerPage,
    StampPage,
    FoodReadyPage,
    DetailsPage,
    LogoutPage,
    OrderHistoryPage
  ],
  imports: [
    BrowserModule,
    IonicModule.forRoot(MyApp, {backButtonText : 'Back'}), HttpModule, JsonpModule,
    IonicStorageModule.forRoot()
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    LoginPage, 
    PlaygroundPage, 
    RegisterPage,
    HomePage,
    BuyerPage,
    StampPage,
    FoodReadyPage,
    DetailsPage,
    LogoutPage,
    OrderHistoryPage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler}, 
    HttpWithToken,
    Push,
    Facebook,
    validityCheck
  ]
})
export class AppModule {}
 