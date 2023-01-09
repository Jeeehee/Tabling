# Tabling
> **기간**  :  2023.01.02 ~ 2023.01.09
> **Architecture**  :  MVVM + CleanArchitecture  
> **Library**  :  SwiftLint

<br>

## 구현사항
- [x] 저장 화면 구현
- [x] 최근본 화면 구현

## 추가 구현사항
- [x] Cell 클릭시 뜨는 DetailView 구현
- [x] New Button

## 실행 화면
<img width="200" alt="이미지 제목" src="https://user-images.githubusercontent.com/92635121/211273876-3d58b9f2-11d2-435e-888e-b5246298ce4e.gif">

<br>

## Architecture :  MVVM + CleanArchitecture 
<img width="1000" alt="이미지 제목" src="https://user-images.githubusercontent.com/92635121/211208558-44ff3e43-4e8c-45c3-98d2-bce8dc08216c.png">

[MVVM + CleanArchitecture 채택 이유](https://github.com/Jeeehee/Tabling/wiki/MVVM---CleanArchitecture-%EC%B1%84%ED%83%9D-%EC%9D%B4%EC%9C%A0)

<br>

## 고민과 해결
- [Tab 변경시, ColletcionView의 Data가 중복되어 표시](https://github.com/Jeeehee/Tabling/wiki/Tab-%EB%B3%80%EA%B2%BD%EC%8B%9C,-ColletcionView%EC%9D%98-Data%EA%B0%80-%EC%A4%91%EB%B3%B5%EB%90%98%EC%96%B4-%ED%91%9C%EC%8B%9C)  
- [StoryBoard 사용시 ViewModel 주입 방법](https://github.com/Jeeehee/Tabling/wiki/StoryBoard-%EC%82%AC%EC%9A%A9%EC%8B%9C-ViewModel-%EC%A3%BC%EC%9E%85-%EB%B0%A9%EB%B2%95)  
- [CollectionViewCell이 UseCase 소유](https://github.com/Jeeehee/Tabling/wiki/CollectionViewCell%EC%9D%B4-UseCase-%EC%86%8C%EC%9C%A0)
- [이미지 캐싱 : 디스크 캐싱? 메모리 캐싱??](https://github.com/Jeeehee/Tabling/wiki/%EC%9D%B4%EB%AF%B8%EC%A7%80-%EC%BA%90%EC%8B%B1-:-%EB%94%94%EC%8A%A4%ED%81%AC-%EC%BA%90%EC%8B%B1%3F-%EB%A9%94%EB%AA%A8%EB%A6%AC-%EC%BA%90%EC%8B%B1%3F)
- [Deployment Target과 Library, 패키지 매니저 선택 이유](https://github.com/Jeeehee/Tabling/wiki/Deployment-Target%EA%B3%BC-Library,-%ED%8C%A8%ED%82%A4%EC%A7%80-%EB%A7%A4%EB%8B%88%EC%A0%80-%EC%84%A0%ED%83%9D-%EC%9D%B4%EC%9C%A0)  
