% Implementation of Bubble Sort (with output)
% ?_bubblesort([4,5,8,2,3,1,9],L).
% L=[1,2,3,4,5,8,9].

bubblesort(L,L1):-
  (bubble(L,L2)
  ->bubblesort(L2,L1)
  ;L=L1).

bubble([A,B|T],L):-
  (A>B
  ->L=[B,A|T]
  ;L=[A|L1],
  bubble([B|T],L1)).


% Implementation of DFS (with output)

%                    A
%                   / \
%                  /   \
%                 B     C
%                /       \
%               /         \
%              D           E
%             /
%            /
%           F
%          / \
%         /   \
%        G     H

% ?_dfs(a,h,Path).
% Total Iterations: 5
% Path=[a,b,d,f,g,h]

dfs(Start,Goal,Path):-
  dfs_stack([Start],Goal,[],Path,0,Iterations).
  format('Total Iterations: ~w~n', [Iterations]).
  
dfs_stack([Goal|_],Goal,Visited,Path,Iterations,Iterations):-
  reverse([Goal|Visited],Path).
  
dfs_stack([Current|Rest],Goal,Visited,Path,Iterations,FinalIterations):-  
  \+member(Current,Visited),
  findall(Next,edge(Current,Next),Neighbor),
  append(Neighbor,Rest,NewStack),
  NewIterations is Iterations+1,
  dfs_stack(NewStack,Goal,[Current|Visited],Path,NewIterations,FinalIterations).

edge(a,b).
edge(a,c).
edge(b,d).
edge(c,e).
edge(d,f).
edge(f,g).
edge(f,h).
