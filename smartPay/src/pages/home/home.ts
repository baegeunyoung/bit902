import {Component, enableProdMode } from '@angular/core';
import { NavController } from 'ionic-angular'
import {DevicePage} from '../device/device';
import {BLE} from 'ionic-native';

enableProdMode();
@Component({
templateUrl: 'home.html'
})
export class HomePage {
    devices: any;
    isScanning: boolean;
    keys: any;
    constructor(public nav: NavController) {
    this.devices = [];
    this.isScanning = false;
    }

    startScanning() {
    console.log("Scanning Started");
    this.devices = [];
    this.isScanning = true;
    BLE.startScan([]).subscribe(device => {
    this.devices.push(device);
    this.keys = JSON.stringify(device.advertising);
    });

    setTimeout(() => {
    BLE.stopScan().then(() => {
    console.log('Scanning has stopped');
    console.log(JSON.stringify(this.devices))
    this.isScanning = false;
    });
    }, 10000);

    }

    connectToDevice(device) {
    console.log('Connect To Device');
    console.log(JSON.stringify(device))
    this.nav.push(DevicePage, {
    device: device
    });
    }
    
}