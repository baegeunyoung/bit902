import { Component, ViewChild } from '@angular/core';
import { NavController, NavParams, Card } from 'ionic-angular';


declare var google;

interface Store{
  adress: string;
  content: string;
  longitude: number;
  latitude: number;
  name: string;
  sellerNo: number;
  storeNo: number;
  storeType: number;
}
/*
  Generated class for the Playground page.

  See http://ionicframework.com/docs/v2/components/#navigation for more info on
  Ionic pages and navigation.
*/
@Component({
  selector: 'page-playground',
  templateUrl: 'playground.html'
})
export class PlaygroundPage {
  @ViewChild('map') mapElement;
  map: any;
  selectStore: Store;
  callback: any;
  constructor(public navCtrl: NavController, public navParams: NavParams) {
     if (navParams.data.selectStore) {
            this.selectStore = navParams.data.selectStore;
            this.callback = this.navParams.get("callback");
        }
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad PlaygroundPage');
    //map 띄우기 
    this.initMap();
  }

  //맵 띄우기 테스트
 initMap(){
    let longitude = this.selectStore.longitude;
    let latitude = this.selectStore.latitude;
    let latLng = new google.maps.LatLng(longitude,latitude);
 
    let mapOptions = {
      center: latLng,
      zoom: 15,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
 
    this.map = new google.maps.Map(this.mapElement.nativeElement, mapOptions);

    this.addMarker(this.map, latLng);
  }
 
  //마커추가 함수
  addMarker(map, latLng){
	var markerOption = {
		position: latLng,   // 마커 생성 위치	
		map: map,		      	// 지도객체
		clickable: true     // 클릭시 정보창을 보여주기 위해 true 설정
	};
  var marker = new google.maps.Marker(markerOption);
  }

  onBack() {
    let params 
    this.callback(this.selectStore.sellerNo).then(()=>{
      this.navCtrl.pop();
    });
  }
}
