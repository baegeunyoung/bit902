import { Component } from '@angular/core';
import { NavController, Platform } from 'ionic-angular';
import { AuthProviders, AuthMethods, AngularFire } from 'angularfire2';
import { Facebook } from 'ionic-native';
import firebase from 'firebase';


@Component({
    selector: 'page-login',
    templateUrl: 'login.html'
})

export class LoginPage {
    email: any;
    password: any;
    constructor(public navCtrl: NavController, public angfire: AngularFire, public platform: Platform) {

    }


    login() {
        this.angfire.auth.login({
            email: this.email,
            password: this.password
        },
          {
                provider: AuthProviders.Password,
                method: AuthMethods.Password
        }).then((response) => {
            console.log('Login Success' + JSON.stringify(response));
            let currentuser = {
                email: response.auth.email,
                picture: response.auth.photoURL
            };
            window.localStorage.setItem('currentuser', JSON.stringify(currentuser));
            this.navCtrl.pop();
        }).catch((error) => {
            console.log(error);
        })
    }

    twitterlogin() {
        if(this.platform.is('cordova')) {
            let accessToken = '852570655098716160-lNNuJBFlXspEMCi3Iy2EJw9Q6MCUjcQ';
            let secreKey = 'JbqA5mhRzjbEi3tbLDAJQzxfiWRA1c4qfStjdreCwl3OR';
                const twitterCreds = firebase.auth.TwitterAuthProvider.credential(accessToken, secreKey);
                firebase.auth().signInWithCredential(twitterCreds).then((res) => {
                    let currentuser = firebase.auth().currentUser;
                    window.localStorage.setItem('currentuser', JSON.stringify(currentuser.displayName));
                    this.navCtrl.pop();
                }, (err) => {
                    alert('Login not successful' + err);
                })
            
        }
        else {
            this.angfire.auth.login({
                provider: AuthProviders.Twitter,
                method: AuthMethods.Popup
            }).then((response) => {
                console.log('Login Success with Twitter' + JSON.stringify(response));
                let currentuser = {
                    email: response.auth.displayName,
                    picture: response.auth.photoURL
                };
                window.localStorage.setItem('currentuser', JSON.stringify(currentuser));
                this.navCtrl.pop();
            }).catch((error) => {
                console.log(error);
            })
        }
    }

    fblogin() {
        if(this.platform.is('cordova')) {
            Facebook.login(['email', 'public_profile']).then((res) => {
                const facebookCreds = firebase.auth.FacebookAuthProvider.credential(res.authResponse.accessToken);
                firebase.auth().signInWithCredential(facebookCreds).then((res) => {
                    let currentuser = firebase.auth().currentUser;
                    window.localStorage.setItem('currentuser', JSON.stringify(currentuser.displayName));
                    this.navCtrl.pop();
                }, (err) => {
                    alert('Login not successful' + err);
                })
            })
        }
        else {
            this.angfire.auth.login({
                provider: AuthProviders.Facebook,
                method: AuthMethods.Popup
            }).then((response) => {
                console.log('Login Success with Twitter' + JSON.stringify(response));
                let currentuser = {
                    email: response.auth.displayName,
                    picture: response.auth.photoURL
                };
                window.localStorage.setItem('currentuser', JSON.stringify(currentuser));
                this.navCtrl.pop();
            }).catch((error) => {
                console.log(error);
            })
        }
    }
}