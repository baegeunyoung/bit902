import { Component } from '@angular/core';
import { NavController, Platform, Events  } from 'ionic-angular';
import { IBeacon } from 'ionic-native';
import { NgZone } from "@angular/core";
import { Http, RequestOptions, Headers } from '@angular/http';
import { BeaconModel } from '../../models/beacon-model';
@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  private html:string = "" ;
  isScanning: boolean = false;
  beacons: BeaconModel[] = [];
  zone: any;
  delegate: any;
  region: any;
  menu: string;
  major: number;
  minor: number;
  constructor(public navCtrl: NavController, public platform : Platform, public events: Events, public http : Http ) {
      this.zone = new NgZone({ enableLongStackTrace: false });
  }


  ionViewDidLoad() {
    if(this.initialise()) {
       this.listenToBeaconEvents();
    }
  }

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
          if (beacon.minor > 5000 && beacon.rssi >= -75) {
            this.major = beacon.major;
            this.minor = beacon.minor;
            this.order(beacon.major, beacon.minor);
          } 
        });
      });
    });
  }

  order(sellerNo: number, minor: number) {
   this.beacons = [];
   this.isScanning = false;
   IBeacon.stopRangingBeaconsInRegion(this.region);

   if(this.minor > 5000) {
      let tableNo = minor - 5000;
      let data = sellerNo;
      let link = "http://192.168.0.200:9090/bit902app/menu/list.do";
      let headers = new Headers({'Content-Type': 'application/json'});
      let options = new RequestOptions({headers: headers});
    
      console.log(data);
      this.http.post(link, data, options)
        .map(res => res.json())
        .subscribe(data=>{
          console.log(data);
          for(let i = 0; i < data.menu.length; i++) {
             console.log(data.menu[i].name);
           	this.html += "<p>" + data.menu[i].menuNo + " "+ data.menu[i].name+ "  : " + data.menu[i].price + "원 " + data.menu[i].content + "</p>";
					}
        },error => {
          console.log("error");
        }); 
      this.menu = this.major + '가게 ' + tableNo +' 테이블 주문하기.';
   }
   else {
      this.menu = this.major + '가게 광고용 비콘입니다.';
   }
  }
}
