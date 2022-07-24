% Assign Papers to Referees

% Input : number k of referees per submission ; set referee/1 of
% commitee members ; set submission/1 of submissions ; set bid/3
% of triples (R,S,B) such that B is the R's bid for submission S.

% Workload is approx equal. 
% No commitee member is asked to review a NO bid.
% Total number of cases when a submission is assigned to a reviewer who 
% placed it in the Yes bid is as large as possible.

k { review(R,S) : referee(R) , not bid(R,S,no)} k :- submission(S).

workload(R,N) :- referee(R) , N = #count(S : review(R,S)).

:- workload(R1,N1) , workload(R2,N2) , |N1-N2| >1.

#maximize(1,R,S : bid(R,S,yes) , review(R,S)).

#show review/2.