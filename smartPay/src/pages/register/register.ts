import { Component } from '@angular/core';
import { Http, RequestOptions, Headers } from '@angular/http';
import { NavController, NavParams } from 'ionic-angular';
import { validityCheck } from '../register/registerService';
import { LoginPage } from '../login/login'
 
@Component({
  selector: 'page-register',
  templateUrl: 'register.html'
})

export class RegisterPage {
  data : any;
  flag : boolean;
  constructor(public navCtrl: NavController, public navParams: NavParams, public http: Http, public valid: validityCheck) {
    this.data = {};
    this.data.id = "";
    this.data.password = "";
    this.data.repassword = "";
    this.data.name = "";
    this.data.cellphoneNumber = "";
  }

  ionViewDidLoad() {
    console.log('Move RegisterPage');
  }

  check() {
    console.log('Select check');
    this.valid.idCheck(this.data.id);
  }

  regist() {
    console.log('Select regist');

    function validCheckStart(data: any, flag: boolean, valid: any): boolean {

      if(data.id == "") {
         console.log("eeeee");
         alert("아이디를 입력하세요");
         flag = false;
         return flag;
      }

      console.log(valid.isFlag());
      if(valid.isFlag()) {
        console.log("아이디 중복 여부");
        alert("아이디가 중복 되었는지 확인하세요");
        return false;
      }

      if(data.password == "") {
        console.log("ffffff");
        alert("비밀번호를 입력하세요");
        flag = false;
        return flag;
      }

      if(valid.passwordLength(data.password)) {
        console.log("ppppppp");
        alert("비밀번호는 8자리이상 15자리 이하 입니다.");
        flag = false;
        return flag;
      }

      if(data.repassword == "") {
        console.log("gggggg");
        alert("비밀번호 확인을 입력하세요");
        flag = false;
        return flag;
      }

      if(valid.passwordCheck(data.password, data.repassword)) {
        console.log("kkkkkkkk");
        alert("비밀번호가 일치하지 않습니다.");
        flag = false;
        return flag;
      }

      if(data.name == "") {
        console.log("wwwwww");
        alert("이름을 입력하세요")
        flag = false;
        return flag;
      }

      if(data.cellphoneNumber == "") {
        console.log("nnnnnnn");
        alert("전화번호를 입력하세요");
        flag = false;
        return flag;
      }

      if(valid.phoneNumberCheck(data.cellphoneNumber)) {
        console.log("mmmmmmm");
        alert("전화번호는 숫자로 입력하세요");
        flag = false;
        return flag;
      }

      if(valid.phoneNumberLength(data.cellphoneNumber)) {
        console.log();
        alert("전화번호 11자리로 입력하세요");
        flag = false;
        return flag;
      }

      return true;
    }
    console.log("함수 실행 전 " + this.flag);
    this.flag = validCheckStart(this.data, this.flag, this.valid);
    console.log("함수 실행 후 " + this.flag);
    if(this.flag == true) {

        console.log("함수 안");

        let id = this.data.id;
        let password = this.data.password;
        let name = this.data.name;
        let cellphoneNumber = this.data.cellphoneNumber;
        let data = JSON.stringify({id, password, name, cellphoneNumber});
        let link = "http://14.32.66.123:10001/bit902app/login/regist.do";
        let headers = new Headers({'Content-Type' : 'application/json'});
        let options = new RequestOptions({headers: headers});

        console.log(data);

        this.http.post(link, data, options)
            .map(res => res.json())
            .subscribe(data => {
              console.log('성공 : ' + JSON.stringify(data));
              alert(data.msg);
              this.navCtrl.setRoot(LoginPage);
            }, (error) => {
              console.log('에러 : ' + JSON.stringify(error));
            });
      }
  }
}
