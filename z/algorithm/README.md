## Algorithm

### 기본 조건

1.  입력 - 0 또는 그 이상의 자료 존재
2.  출력 - 최소 1개 이상의 결과
3.  명확성 - 각 단계는 명확하고 애매함 없음
4.  유한성 - 종료해야 함
5.  효과성 - 충분히 단순해야 함

### 종류
|종류|원리|Best|Worst|Stable|Memory|
|---|---|---|---|---|---|
|버블 정렬|두 개씩 비교|O(n) - 정렬됨|O(n^2)|Yes|1|
|선택 정렬|순회할 때 가장 큰 수|O(n^2)|O(n^2)|No|1|
|삽입 정렬|알맞은 위치에 삽입|O(n) - 정렬됨|O(n^2)|Yes|1|
|병합 정렬|분할 정복 후 병합|O(nlogn)|O(nlogn)|Yes|n|
|퀵 정렬|pivot 좌우로 배치|O(nlogn)|O(n^2)|No|logn~n|

### 탐색 알고리즘

-   이진 탐색
-   DFS (Depth-First Search)
-   BFS (Breadth-First Search)
-   힙 트리 탐색
-   다익스트라 알고리즘

### 암호화 알고리즘
|분류|종류|내용|
|---|---|---|
|대칭키|DES(Data Encryption Standard)|초창기 미국 NIST 표준|
| |AES(Advanced Encryption Standard)|DES 개선 미국 NIST 표준|
|비대칭키|RSA(Ron Rivest, Adi Shamir, Leonard Adleman)| |

### 기타 알고리즘

-   백트래킹
-   동적 계획법
-   분할 정복법
-   그리디 알고리즘

### Best Practice

-   최대공약수 & 최소공배수 (유클리드 호제법)
```python
def gcd(a,b):
	"""Compute the greatest common divisor of a and b"""
	while b > 0:
		a, b = b, a % b
	return a
  
def lcm(a, b):
	"""Compute the lowest common multiple of a and b"""
	return a * b / gcd(a, b)
```
