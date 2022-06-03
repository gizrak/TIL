### Angular 바인딩

> 데이터와 뷰의 상호간 갱신을 자동화 해주는 기능

```html
<my-comp value="hello"></my-comp>  # hello 리터럴 값 그 자체
<my-comp [value]="myValue"></my-comp>  # MyComponent의 myValue 속성
<my-comp (change)="onChange($event)"></my-comp>  # MyComponent의 onChange(event) 메소드
<my-comp [(value)]="myValue"></my-comp>  # MyComponent의 myValue 양방향 바인딩
<div *ngIf="isVisible">Hidden Contents</div>  # * 문법
<input #myInput type="text"></input>  # 템플릿 참조 변수
```

#### 평가 없는 문자열

- `value`에 별다른 표현식 없이 그대로 입력
- 입력한 리터럴 자체를 대입하는 것으로 기존의 HTML 문법과 일치하고 직관적

#### 속성 바인딩

- 속성명을 `[`와 `]`로 감싸서 표현
- 문자열을 식으로 평가(eval)해서 결과를 대입
  ```typescript
  @Component({
    selector: 'app',
    template: `
      <input [value]="myValue"></input>
    `
  })
  export class AppComponent {
    myValue = 3 * 4;
  }
  ```
- 인터폴레이션(interpolation)에서도 사용이 가능
  ```html
  <div>{{ myValue }}</div>
  ```
- attr, class, style 바인딩 기능도 제공
  ```html
  <tr><td [attr.colspan]="1+2">data</td></tr>
  <div [class.active]="isActivated ? true : false"></div>
  <button [style.color]="isDefault ? 'green' : 'red'></button>
  ```

#### 이벤트 바인딩

- 속성명을 `(`와 `)`로 감싸서 표현
- 이벤트를 뷰에서 핸들러로 호출
  ```typescript
  @Component({
    selector: 'app',
    template: `
      <input (change)="onChange($event)"></input>
    `
  })
  export class AppComponent {
    onChange(event) {
      console.log(event);
    }
  }
  ```

#### 양방향 바인딩

- 속성명을 `[(`와 `)]`로 감싸서 표현
- 값의 변경사항을 뷰와 핸들러 양쪽에서 모니터
  ```typescript
  @Component({
    selector: 'app',
    template: `
      <input [(value)]="myValue"></input>
    `
  })
  export class AppComponent {
    myValue = 10;
  }
  ```

#### * 문법

- `<ng-template>` 사용을 위한 문법적 편의 기능
- [구조적 디렉티브](https://angular.kr/guide/built-in-directives#built-in-structural-directives)를 위한 문법
- 원래 아래와 같이 써야 할 내용을
  ```html
  <ng-template [ngIf]="isVisiable">
    <div>...</div>
  </ng-template>
  ```
- 아래와 같이 쓸 수 있게 해줌
  ```html
  <div *ngIf="isVisible">
  </div>
  ```

#### 템플릿 참조 변수

- 변수 이름에 `#`을 붙여 표현
- 템플릿 내 엘리먼트 객체를 지칭하기 위한 표현식
  ```html
  <input #myInput type="text"></input>
  <button (click)="onClick(myInput.value)">Submit</button>
  ```

#### 템플릿 입력 변수

- `<ng-template>`에 값을 전달하기 위한 변수
- `let-xxx` 형태의 애트리뷰트로 선언
  ```html
  <ng-template let-foo="fooValue">
    <div>{{ fooValue }}</div>
  </ng-template>
  ```
