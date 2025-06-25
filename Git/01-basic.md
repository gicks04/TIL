# Git 기초개념
Git은 코드변경 이력을 관리하는 도구 (즉 버전을 관리해주는 사진기이다)

Git 은 Github가 아님. 로컬저장소에서만의 버전관리를 담당해줌.

# Git의 기초 명령어들

`git init` 
- Git 저장소 초기화
- 저장소가 아닌 일반폴더에서 초기에 한번만 실행
- 실행하면 숨겨진 파일인 .Git이 생성되면서 해당폴더가 Git저장소로 초기화

```
git config --global user.name
git config --global user.email
```
- 내 Git의 이름과 이메일을 기록하는 명령어

```
git add <filename>
git add .
```
- 수정된 파일을 커밋할 준비
- 위에는 특정파일, 아래는 Git저장소의 모든파일을 추가하는 명령어

`git status`

- 현재 Git상태 확인
- 어떤 파일이 수정되었고 어떤 파일이 스테이징 상태인지 확인

`git commit -m 'message' `

- 변경사항을 Git에 저장
- 반드시 메시지 내용이 존재
- 메시지 내용 작성 요령은 언제 커밋을 작성할지라는 시기에 달림 

## Local Repository에서 Gihub 연동
---
```
git remote add origin <URL>
git push origin main
```
- Gihub의 Remote Repository와 내 Local Repository를 연동
- remote add origin은 초기에 한번만 작성
- git push를 통해 Remote Repository에 Local의 내용 저장

## Github에서 Local Repository로 연동
--- 
```
터미널에서
git clone [URL]
cd [레포이름]
code .
```
- Github 저장소의 내용을 원하는 폴더로 이동해서 git clone으로 연동
- 해당 폴더에서 code .을 통해서 vs코드 시작 or vscode에서 파일 열기