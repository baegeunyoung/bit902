import { Component } from '@angular/core';
import { NavController, Platform, Events  } from 'ionic-angular';
import { IBeacon } from 'ionic-native';
import { NgZone } from "@angular/core";
import { BeaconModel } from '../../models/beacon-model';
@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  
  isScanning: boolean = false;
  beacons: BeaconModel[] = [];
  zone: any;
  delegate: any;
  region: any;
  constructor(public navCtrl: NavController, public platform : Platform, public events: Events) {
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
          });

      });

    });
  }

}
