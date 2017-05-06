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
import { StampPage } from '../stamp/stamp';
declare var IMP: any;
declare var io: any;
interface MENU{
  menuNo: number;
  storeNo: number;
  sellerNo: number;
  name: string;
  content: string;
  price: number;
  size: string;
  stName: string;
  quantity: number;
  tokenObj: Object;
  orderContentObj: Object;
  minorObj: Object;
  majorObj: Object;
}

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
 //알림
  private token: string;

  //메뉴
  menu: Array<MENU>;
  private menuFile:Array<string>;
  tokenObj: any;
  majorObj: any;
  minorObj: any; 
  orderContentObj: any;
  store: string = "";
  id: any;
  quantity:any;
  orderContent="";
  storeName: string;
  //비콘
  isScanning: boolean = false;
  beacons: BeaconModel[] = [];
  zone: any;
  delegate: any;
  region: any;
  major: number;
  minor: number;
  first: boolean;
  //홈화면
  homeEvents: Array<string>;

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
    if(this.token == null) {
      this.initPushNotification();
    }
    // if(this.initialise()) {
    //    this.first = true;
    //    this.listenToBeaconEvents();
    // }
    this. getHomeEventInfo();
  }
  //메뉴보기(비콘검색시작)
   startScanning() {
    if(this.initialise()) {
       this.first = true;
       this.listenToBeaconEvents();
    }
  }
//비콘검색중지
  stopScanning() {
     IBeacon.stopRangingBeaconsInRegion(this.region) 
            .then(
              () => {
                      this.isScanning = false;       
                     },
              error => {
                    console.error('Failed to stop Ranging: ', error);
                    alert("다시 시도해주세요.");
             }
            );
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
          if (this.first && beacon.minor > 5000 && beacon.rssi >= -79) {
            this.first = false;
            IBeacon.stopRangingBeaconsInRegion(this.region)
              .then(
              () => {
                      this.major = beacon.major;
                      this.minor = beacon.minor;
                      this.getMenu(beacon.major, beacon.minor);        
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
  getMenu(sellerNo: number, minor: number) {
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
          this.storeName = data.menu[0].stName;
          this.store ="[ " + data.menu[0].stName +" ]"+ tableNo +"번 테이블";
     
        },error => {
          console.log("error");
        }); 
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

 get total(){
   return this.menu.reduce( (total, v) => total + this.subTotal(v), 0 );
 }
 
 subTotal( menu ){
   return menu.price * ( menu.quantity ? menu.quantity : 0);
 }


   //디바이스토큰 저장하기 + 푸시알림시 이벤트
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

    //카카오페이 결제하기
    payment(amount: number) {
		IMP.init('imp91789758');

		IMP.request_pay({
			pg : 'kakao',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
      name : this.storeName,
			amount : this.total,
		},response => {
	//결제 후 호출되는 callback함수
	if ( response.success ) { //결제 성공
		console.log(response);
		//alert("결제완료 되었습니다.");
    this.nodeCall();
    this.order();
    this.menu = undefined;
    this.store = "";
    this.navCtrl.push(StampPage, {amount:amount});
	} else {
    alert('결제실패 : ' + response.error_msg);
	}
		})
	}
  //노드에 신호 전달
  nodeCall(){

    var socket = io.connect("http://14.32.66.123:8888");
	  var loginId = this.minor;
    var recvId = this.major;
    
	  socket.emit("login", loginId);
	  socket.emit("msg", {recvId: recvId, sendId: loginId, msg: loginId});
	  socket.on("msg", function(data) {
		  alert(data);
	  });
  }

  //주문내역 보내기
  order(){
   this.tokenObj = {"token": this.token};
   this.majorObj = {"sellerNo": this.major};
   this.minorObj = {"tableNo": this.minor};
   this.orderContentObj={"orderContent": this.orderContent};
   
   console.log(this.tokenObj);
   this.menu.push(this.tokenObj);
   this.menu.push(this.majorObj);
   this.menu.push(this.minorObj); 
   this.menu.push(this.orderContentObj); 
   console.log(JSON.stringify(this.menu));

    let data = JSON.stringify(this.menu);  
    let link = "http://14.32.66.123:10001/bit902app/order/regist.do";
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({headers: headers});
  
   
    console.log(data);
    this.http.post(link, data, options)
      .map(res => res.json())
      .subscribe(data=>{
        console.log(data);
        
   
      },error => {
        console.log("error");
      }); 
 }

//홈화면 이벤트정보 가져오기(10개)
 getHomeEventInfo() {
      let link = "http://14.32.66.123:10001/bit902app/notification/homeInfo.do";
      this.http.get(link)
        .map(res => res.json())
        .subscribe(data=>{
            console.log(data);
            this.homeEvents = data;      
        },error => {
          console.log("error");
        }); 
    }
}
