### Get Started
https://angular.kr/

```bash
$ ng new ted-ng
$ cd ted-ng
$ npm install --legacy-peer-deps  // Fix the upstream dependency conflict
$ ng serve -o --port 4201  // --open
```

### Angular CLI
- [Angular CLI를 사용한 프로젝트의 생성, 구성요소 추가와 빌드](https://poiemaweb.com/angular-cli)

| 구성요소     | 명령어                                 | 축약형                 |
|------------|--------------------------------------|-----------------------|
| 컴포넌트   | ng generate component component-name | ng g component-name   |
| 디렉티브   | ng generate directive directive-name | ng g d directive-name |
| 파이프     | ng generate pipe pipe-name           | ng g p pipe-name      |
| 서비스     | ng generate service service-name     | ng g s service-name   |
| 모듈       | ng generate module module-name       | ng g m module-name    |
| 가드       | ng generate guard guard-name         | ng g g guard-name     |
| 클래스     | ng generate class class-name         | ng g cl class-name    |
| 인터페이스 | ng generate interface interface-name | ng g i interface-name |
| 열거형     | ng generate enum enum-name           | ng g e enum-name      |

### Tips
- [Angular에서 Typecript를 사용하는 이유](https://github.com/not-for-me/til/blob/master/angular2/translations/writing_angular2_in_typescript.md)
- [Catching errors in Angular HttpClient](https://stackoverflow.com/questions/46019771/catching-errors-in-angular-httpclient)
