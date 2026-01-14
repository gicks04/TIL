# 10809
string = input()
result = []
for char in range(97, 123):
    result.append(string.find(chr(char)))
print(*result, sep=' ')

# 혹은 ascii_lowercase 사용 -> ascii_lowercase는 'abcdefghijklmnopqrstuvwxyz' 문자열을 가짐
# from string import ascii_lowercase

# 위에 코드는 find() 메서드를 사용하여 각 알파벳의 첫 등장 위치를 찾기에 문자열을 처음부터 끝까지 탐색하는 과정을 26번 반복
# 해야 하므로 비효율적입니다. 아래는 한 번의 순회로 문제를 해결하는 더 효율적인 방법
"""
import sys

# 1. 입력 받기
s = sys.stdin.readline().strip()

# 2. 알파벳 26개를 담을 리스트를 -1로 초기화하여 생성
# [-1, -1, -1, ..., -1] (26개)
result = [-1] * 26

# 3. 문자열을 처음부터 끝까지 한 번만 순회합니다.
for i in range(len(s)):
    # ord()를 사용해 문자의 아스키 코드 값을 구한 뒤, 'a'(97)를 빼서 0~25 인덱스로 변환합니다.
    idx = ord(s[i]) - 97
    
    # result라는 리스트의 알파벳 위치에 아직 기록이 없을(-1일) 때만 현재 인덱스(i)를 기록합니다.
    # 이렇게 하면 '처음 등장하는 위치'만 저장됩니다.
    if result[idx] == -1:
        result[idx] = i

# 4. 결과 출력
print(*result)

"""