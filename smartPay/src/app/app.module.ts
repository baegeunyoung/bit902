import { NgModule, ErrorHandler } from '@angular/core';
import { IonicApp, IonicModule, IonicErrorHandler } from 'ionic-angular';
import { MyApp } from './app.component';

import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

//pages
import { LoginPage } from '../pages/login/login';
import { PlaygroundPage} from '../pages/Playground/Playground';
import { RegisterPage} from '../pages/register/register';
import { HomePage } from '../pages/home/home';

//providers
import { HttpWithToken } from '../providers/http-with-token';
import { HttpModule, JsonpModule} from '@angular/http';


@NgModule({
  declarations: [
    MyApp,
    LoginPage, PlaygroundPage, RegisterPage,
    HomePage
  ],
  imports: [
    IonicModule.forRoot(MyApp, {backButtonText : 'Back'}), HttpModule, JsonpModule
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    LoginPage, PlaygroundPage, RegisterPage,
    HomePage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler}, HttpWithToken
  ]
})
export class AppModule {}
 