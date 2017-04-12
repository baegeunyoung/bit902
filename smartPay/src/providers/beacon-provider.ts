import { Injectable } from '@angular/core';
import { Platform, Events } from 'ionic-angular';
import { IBeacon } from 'ionic-native';


/*
Generated class for the BeaconProvider provider.

See https://angular.io/docs/ts/latest/guide/dependency-injection.html
for more info on providers and Angular 2 DI.
*/
@Injectable()
export class BeaconProvider {

delegate: any;
region: any;
check: string;
constructor(public platform: Platform, public events: Events) {
}

initialise(): any {
let promise = new Promise((resolve, reject) => {
// we need to be running on a device
if (this.platform.is('cordova')) {
    this.check = "platform is cordova";
// Request permission to use location on iOS
IBeacon.enableBluetooth();

// create a new delegate and register it with the native layer
this.delegate = IBeacon.Delegate();

// Subscribe to some of the delegate’s event handlers
this.delegate.didRangeBeaconsInRegion()
.subscribe(
data => {
this.events.publish('didRangeBeaconsInRegion', data);
},
error => console.error()
);

// setup a beacon region – CHANGE THIS TO YOUR OWN UUID
this.region = IBeacon.BeaconRegion('RECO', '24DDF411-8CF1-440C-87CD-E368DAF9C93E');

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
}