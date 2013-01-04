function [ x ] = xsnake( solution, max, coef )
%XSNAKE Summary of this function goes here
%   Detailed explanation goes here

increment = 1;

m(1,1) = solution(1);
m(1,2) = solution(2);

c = 2;

for i = 2:(max/2)+1
    if mod(i,2) == 0
        m(c,:) = [m(c-1,1)+increment*coef, m(c-1,2)];
        c=c+1;
        m(c,:) = [m(c-1,1), m(c-1,2)+increment*coef];
        c=c+1;
    else
        m(c,:) = [m(c-1,1)-increment*coef, m(c-1,2)];
        c=c+1;
        m(c,:) = [m(c-1,1), m(c-1,2)-increment*coef];
        c=c+1;
    end
    increment=increment+1;
end

x=m

end

