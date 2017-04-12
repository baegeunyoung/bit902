import { Component, NgZone } from '@angular/core';
import { NavController, Platform, Events } from 'ionic-angular';

import { IBeacon } from 'ionic-native';
import { BeaconProvider } from '../../providers/beacon-provider';
import { BeaconModel } from '../../models/beacon-model';
@Component({
   templateUrl: 'ibeacon.html'
})
export class IbeaconPage {

  beacons: BeaconModel[] = [];
  zone: any;

  constructor(public navCtrl: NavController, public platform: Platform, 
              public beaconProvider: BeaconProvider, public events: Events) {
        this.zone = new NgZone({ enableLongStackTrace: false });
  }

  ionViewDidLoad() {
    this.platform.ready().then(() => {
      this.beaconProvider.initialise().then((isInitialised) => {
        //  alert(isInitialised);
        if (isInitialised) {
          this.listenToBeaconEvents();
        }
      });
    });
  }

  listenToBeaconEvents() {
    this.events.subscribe('didRangeBeaconsInRegion', (data) => {

    // update the UI with the beacon list
      this.zone.run(() => {
          //alert("run");
        this.beacons = [];
        //alert(JSON.stringify(data));
        let beaconList = data.beacons;
        beaconList.forEach((beacon) => {
           //alert("beacon: " + beacon);
          let beaconObject = new BeaconModel(beacon);
          //alert("beaconObject: " + beacon);
          this.beacons.push(beaconObject);
        });

      });

    });
  }

}
