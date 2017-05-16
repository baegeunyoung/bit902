import { Injectable } from '@angular/core';
import { Http, RequestOptions, Headers } from '@angular/http';

@Injectable()
export class validityCheck {

    idCheckFlag: boolean;

    constructor(private http: Http) {

    }

    idCheck(id: string) : void {

        let data = JSON.stringify({id});
        let link = "http://192.168.0.13:9090/bit902app/login/validity.do";
        let headers = new Headers({'Content-Type' : 'application/json'});
        let options = new RequestOptions({headers: headers});

        console.log(data);

        this.http.post(link, data, options)
            .map(res => res.json())
            .subscribe(data => {              
                console.log('성공 : ' + JSON.stringify(data));
                this.idCheckFlag = data.flag;
                console.log('왜안됨? : ' + this.idCheckFlag)
                alert(data.msg);
                
            }, (error) => {
                console.log('에러 : ' + JSON.stringify(error));
            })

    }

    isFlag(): boolean {

        return this.idCheckFlag;
    }

    passwordLength(password: string): boolean {
        if(password.length >= 8 && password.length < 15) {
            return false;
        }
        return true;
    }

    passwordCheck(password: string, repassword: string): boolean {
        if(password == repassword) {
            console.log('equals');
            return false;
        }
        console.log('not equals');
        return true;
    }

    phoneNumberCheck(cellPhoneNumber: string): boolean {
        if(Number(cellPhoneNumber)) {
            return false;
        }
        return true;
    }

    phoneNumberLength(cellPhoneNumber: string): boolean {
        if(cellPhoneNumber.length == 11) {
            return false;
        }
        return true;
    }
} 