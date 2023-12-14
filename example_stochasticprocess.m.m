
%Example 2.54. Consider a particle that moves along a set of m + 1 nodes, labeled
%0, 1,...,m, that are arranged around a circle. At each step the particle
%is equally likely to move one position in either the clockwise or counterclockwise
%direction. That is, if Xn is the position of the particle after its nth step then

%P{X_(n+1) = i + 1|X_n = i} = P{X_(n+1) = i − 1|X_n = i} = 0.5

%where i +1 ≡ 0 when i = m, and i −1 ≡ m when i = 0. Suppose now that the particle
%starts at 0 and continues to move around according to the preceding rules until all the
%nodes 1, 2,...,m have been visited. What is the probability that node i,i = 1,...,m,
%is the last one visited?

n = 1000000;               %시행횟수
E = zeros(n,1);            %i번째 시행의 마지막 방문 위치 i번째에 입력

for p = 1:n
    j = 10;                %한 시행에서 입자가 움직이는 횟수의 최댓값 임의 지정
    A = rand(j,1);         %확률 조정을 위한 난수 불러오기
    m = 10;                %(노드의 갯수) - 1
    st = 0;                %입자의 위치
    B = zeros(j,1);        %입자가 있는 노드가 입력될 곳
    i = 1;                 %(입자가 움직인 횟수) - 1
    C = 0:m;               %모든 노드를 다 돌아 다녔는지 확인을 위한 벡터
    C = C';
    t = 1;                 %while문의 트리거

    while t
        if A(i,1) >= 0.5           %난수가 0.5보다 크면 시계방향으로 +1
            st = st + 1;
            i = i+1;               %시행횟수 +1
        else                       %난수가 0.5보다 작으면 시계방향으로 -1
            st = st-1;
            i = i+1;               %시행횟수 +1
        end
        B(i,1) = mod(st,m+1);      %방문한 노드 기록
        if sum(intersect(B,C)) == sum(C)    %모든 노드를 다 돌아다녔을 때 while문 멈추기
            t=0;
        end
        if i+1>j
            A(i+1,1) = rand(1,1);
            B(i+1,1) = 0;
        end
    end
    E(p,1) = B(i,1);               %마지막으로 방문한 노드 기록
end

F = zeros(m+1,1);                  %마지막으로 방문한 노드 각각이 총 몇개인지 확인
                                        %k-1번째 숫자가 노드k가 마지막 방문지가 된 횟수를 의미
for i = 1:m+1                       
    F(i,1) = sum(E == i-1)
end
