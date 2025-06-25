# Git의 Branch
- 분기들에 붙이는 일종의 스티커
- `git branch [branch이름]`을 통해서 생성
- 브랜치를 생성하고 커밋을 하면 브랜치별로 분기가 분할
- `git switch [branch이름]`을 통해서 브랜치 전환
- 변경된 내용이 존재할때 커밋을 하지 않으면 `git switch` 불가

# Git의 merge
- 두개의 브랜치를 하나로 병합
- first브랜치일때 `git merge second`
->first브랜치에 second브랜치를 병합
- 만약에 병합할때 내용이 충돌한다면?
    - Accept current: first 브랜치의 내용만 남김
    - Accept incoming: second 브랜치의 내용만 남김
    - Accept both: 두 브랜치 내용을 모두 남김
    - Compare :두 브랜치의 내용을 모두 삭제
- 충돌이 일어난 다음에 내용을 저장하고 commit하면 브랜치 두개가 병합