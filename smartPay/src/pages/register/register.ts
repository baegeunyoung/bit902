import { Component } from '@angular/core';
import { Http, RequestOptions, Headers } from '@angular/http';
import { NavController, NavParams } from 'ionic-angular';
 
/*
  Generated class for the Register page.

  See http://ionicframework.com/docs/v2/components/#navigation for more info on
  Ionic pages and navigation.
*/
@Component({
  selector: 'page-register',
  templateUrl: 'register.html'
})

export class RegisterPage {
  data : any;
  constructor(public navCtrl: NavController, public navParams: NavParams, public http: Http) {
    this.data = {};
    this.data.id = "";
    this.data.password = "";
    this.data.name = "";
    this.data.cellphoneNumber = "";
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad RegisterPage');
  }

  register() {
    let id = this.data.id;
    let password = this.data.password;
    let name = this.data.name;
    let cellphoneNumber = this.data.cellphoneNumber;
    let data = JSON.stringify({id, password, name, cellphoneNumber});
    let link = "http://14.32.66.123:10001/bit902app/book/regist.do";
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({headers: headers});
  
    console.log(data);
    this.http.post(link, data, options)
      .map(res => res.json())
      .subscribe(data=>{
        console.log(data);
        console.log("success");
        alert(data.msg);
      },error => {
        console.log("error");
      }); 
    //this.navCtrl.push(LoginPage);
  }
function doAction() {
		
		
			var f = register;
			var id = f.id;
			var pw = f.password;
			var pw2 = f.password2;
			var name = f.name;
			var cellNo = f.cellphoneNumber;
			
// 			var pattern1 = /[0-9]/;
// 			var pattern2 = /[a-zA-Z]/;
			
			if (id.value == "") {
				alert("insert your id");
				id.focus();
				return false;
			}
						
			if (2 > id.value.length || id.value.length > 21){
				alert("아이디는 최소 3자에서 최대 20자까지 입력이 가능합니다.");
				id.focus();
				return false;
			}
			
			if (pw.value == "") {
				alert("비밀번호를 입력하세요");
				pw.focus();
				return false;
			}
			
			if ( 7 > pw.value.length || pw.value.length > 21) {
				alert("비밀번호는 최소 8자에서 최대 20자까지 입력이 가능합니다.");
				pw.focus();
				return false;
			}
			
			if (pw2.value == "") {
				alert("비밀번호 확인을 입력하세요");
				pw2.focus();
				return false;
			}
			
			if (7 > pw2.value.length || pw2.value.length > 21){
				alert("비밀번호는 최소 8자에서 최대 20자까지 입력이 가능합니다.");
				pw2.focus();
				return false;
			}
			
			if (pw.value != pw2.value) {
				alert("비밀번호가 일치하지 않습니다");
				pw.focus();
				pw.select();
				return false;
			}
			
			if (name.value == "") {
				alert("이름을 입력하세요");
				name.focus();
				return false;
			}
			
			if (1 > name.value.length || name.value.length > 6){
				alert("이름은 최소 2자에서 최대 5자까지 입력이 가능합니다.");
				name.focus();
				return false;
			}			
			
			if (cellNo.value == "") {
				alert("핸드폰번호를 입력하세요");
				cellNo.focus();
				return false;	
			}	
			
			if (cellNo.value.length > 11){
				alert("핸드폰 번호는 11자까지 입력이 가능합니다.");
				cellNo.focus();
				return false;
			}
				
// 			$("form[name='mForm']").submit(function () {
// 				if(!confirm('회원가입이 완료됩니다')) {
// 				return false;		
// 			}
// 			})
				
			return true;
		}
		
		
		
		
		
		
		
	</script>	
 
}
