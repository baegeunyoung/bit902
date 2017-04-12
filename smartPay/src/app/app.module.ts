import { NgModule, ErrorHandler } from '@angular/core';
import { IonicApp, IonicModule, IonicErrorHandler } from 'ionic-angular';
import { MyApp } from './app.component';

import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

//pages
import { DevicePage } from '../pages/device/device';
import { LoginPage } from '../pages/login/login';
import { PlaygroundPage} from '../pages/Playground/Playground';
import { RegisterPage} from '../pages/register/register';
import { HomePage } from '../pages/home/home';
import { IbeaconPage }  from '../pages/ibeacon/ibeacon';
//providers
import { HttpWithToken } from '../providers/http-with-token';
import { BeaconProvider } from '../providers/beacon-provider'
import { HttpModule, JsonpModule} from '@angular/http';


@NgModule({
  declarations: [
    MyApp,
    LoginPage, PlaygroundPage, RegisterPage,
    HomePage, IbeaconPage
  ],
  imports: [
    IonicModule.forRoot(MyApp, {backButtonText : 'Back'}), HttpModule, JsonpModule
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    LoginPage, PlaygroundPage, RegisterPage,
    HomePage, IbeaconPage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler}, HttpWithToken, BeaconProvider
  ]
})
export class AppModule {}
 