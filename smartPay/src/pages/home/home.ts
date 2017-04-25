import { Component } from '@angular/core';
import { NavController, Platform, Events, AlertController } from 'ionic-angular';
import { IBeacon } from 'ionic-native';
import { NgZone } from "@angular/core";
import { Http, RequestOptions, Headers } from '@angular/http';
import { BeaconModel } from '../../models/beacon-model';
import {Push, PushObject, PushOptions} from "@ionic-native/push";
import { Storage } from '@ionic/storage'
import { Facebook } from '@ionic-native/facebook';

import { DetailsPage } from '../details/details';
@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  private html:string = "" ;
  private token: string;
  private menuFile:Array<string>;
  isScanning: boolean = false;
  beacons: BeaconModel[] = [];
  zone: any;
  delegate: any;
  region: any;
  menu: Array<string>;
  major: number;
  minor: number;
  store: string = "";
  first: boolean;
  id: any;
  quantity:any;
  constructor(public navCtrl: NavController, 
              public platform : Platform, 
              public events: Events, 
              public http : Http,
              public push: Push,
              public alertCtrl: AlertController,
              private fb: Facebook, 
              private storage: Storage ) {
      this.zone = new NgZone({ enableLongStackTrace: false });
  }


  ionViewDidLoad() {
    //this.test();
    if(this.token == undefined) {
      this.initPushNotification();
    }
     if(this.initialise()) {
       this.first = true;
       this.listenToBeaconEvents();
    }
  }

   startScanning() {
    if(this.initialise()) {
       this.first = true;
       this.listenToBeaconEvents();
    }
  }
  //비콘리전설정
  initialise(): any {
    let promise = new Promise((resolve, reject) => {
    // we need to be running on a device 
      if (this.platform.is('cordova')) {

        // Request permission to use location on iOS
        //IBeacon.requestAlwaysAuthorization();
       
       //Enables Bluetooth using the native Layer. (ANDROID ONLY)
        IBeacon.enableBluetooth();
        // create a new delegate and register it with the native layer
        this.delegate = IBeacon.Delegate();

        // Subscribe to some of the delegate's event handlers
        this.delegate.didRangeBeaconsInRegion()
          .subscribe(
            data => {
              this.events.publish('didRangeBeaconsInRegion', data);
            },
            error => console.error()
            );

        // setup a beacon region
        this.region = IBeacon.BeaconRegion('deskBeacon', '24DDF411-8CF1-440C-87CD-E368DAF9C93E');

        // start ranging
        IBeacon.startRangingBeaconsInRegion(this.region)
        .then(
          () => {
          resolve(true);
          },
          error => {
            console.error('Failed to begin monitoring: ', error);
          resolve(false);
          }
        );

      } else {
        console.error("This application needs to be running on a device");
        resolve(false);
      }
    });

    return promise;
  }
 
 //비콘검색하기
  listenToBeaconEvents() {
    this.major = 0;
    this.minor = 0;
    this.isScanning = true;
    this.events.subscribe('didRangeBeaconsInRegion', (data) => {

      
      // update the UI with the beacon list  
      this.zone.run(() => {
                    
        let beaconList = data.beacons;
        if(beaconList.length != 0) {
          this.beacons = [];
        }        
        beaconList.forEach((beacon) => {
          let beaconObject = new BeaconModel(beacon);
          this.beacons.push(beaconObject);
          if (this.first && beacon.minor > 5000 && beacon.rssi >= -65) {
            this.first = false;
            IBeacon.stopRangingBeaconsInRegion(this.region)
              .then(
              () => {
                      this.major = beacon.major;
                      this.minor = beacon.minor;
                      this.order(beacon.major, beacon.minor);        
                     },
              error => {
                    console.error('Failed to begin monitoring: ', error);
             }
            );
          } 
          if (this.first && beacon.minor < 5000 && beacon.rssi > -75) {
            this.first = false;
            IBeacon.stopRangingBeaconsInRegion(this.region) 
            .then(
              () => {
                     this.major = beacon.major;
                     this.advertisement(beacon.major, this.token);            
                     },
              error => {
                    console.error('Failed to begin monitoring: ', error);
             }
            );
           }
        });
      });
    });
   }
  
  //테이블비콘 검색시 메뉴가져오기
  order(sellerNo: number, minor: number) {
   this.beacons = [];
   this.isScanning = false;
   IBeacon.stopRangingBeaconsInRegion(this.region);

   if(this.minor > 5000) {
      let tableNo = minor - 5000;
      let data = sellerNo;
      let link = "http://14.32.66.123:10001/bit902app/menu/list.do";
      let headers = new Headers({'Content-Type': 'application/json'});
      let options = new RequestOptions({headers: headers});
     // this.menu = "";
     // this.menuFile = "";
    
      console.log(data);
      this.http.post(link, data, options)
        .map(res => res.json())
        .subscribe(data=>{
          console.log(data);
          
          data.menu.forEach(m =>{
            m.quantity = 0;
          })
          
          this.menu = data.menu;
          this.menuFile = data.menuFile;
     
        },error => {
          console.log("error");
        }); 
      this.store = this.major + '가게 ' + tableNo +' 테이블 주문하기.';
   }
  }
  orderPlus(menu){ 
    menu.quantity++; 
  }

  orderMinus(menu){
    if(menu.quantity>0){
        menu.quantity--;
    }else{
      alert("최소수량입니다");
    }
  }

   //디바이스토큰 저장하기 
   initPushNotification() {
     const options: PushOptions = {
      android: {
        senderID: "214091746342"
      },
      ios: {
        alert: "true",
        badge: false,
        sound: "true"
      },
      windows: {}
    };
    const pushObject: PushObject = this.push.init(options);

    pushObject.on('registration').subscribe((data: any) => {
      console.log("device token ->", data.registrationId);
      this.token = data.registrationId;
       //TODO - send device token to server
    });

    pushObject.on('notification').subscribe((data: any) => {
      console.log('message', data.message);
      //if user using app and push notification comes
      if (data.additionalData.foreground) {
        // if application open, show popup
        let confirmAlert = this.alertCtrl.create({
          title: 'New Notification',
          message: data.message,
          buttons: [{
            text: 'Ignore',
            role: 'cancel'
          }, {
            text: 'View',
            handler: () => {
              //TODO: Your logic here
              this.navCtrl.push(DetailsPage, {message: data.message});
            }
          }]
        });
        confirmAlert.present();
      } else {
        //if user NOT using app and push notification comes
        //TODO: Your logic on click of push notification directly
        this.navCtrl.push(DetailsPage, {message: data.message});
        console.log("Push notification clicked");
      }
    });

    pushObject.on('error').subscribe(error => console.error('Error with Push plugin', error));
  }

  
  //이벤트비콘 검색시
  advertisement(sellerNo: number, deviceToken: string) {
    this.beacons = [];
    this.isScanning = false;
    let token = this.token;
    //alert(token);
    let data = JSON.stringify({token, sellerNo});
    let link = "http://14.32.66.123:10001/bit902app/notification/push.do";
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({headers: headers});
    
    this.http.post(link, data, options)
      .subscribe(data=>{
        console.log(data);
      },error => {
        console.log("error");
      }); 
    }

      test() {
        this.storage.get('id').then((val) => {
            alert(val);
            this.id = val;
        })
    }
}
