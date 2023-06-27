% location(B), block(B), on(B,L,T), move(B,L,T)

% Initially:
% loc(m)=table, loc(l)=m, loc(a)=l, loc(b)=a, loc(c)=b, loc(o)=table, loc(n)=o, loc(d)=n, loc(e)=d, loc(j)=e, loc(k)=j, loc(f)=table, loc(g)=f, loc(h)=g, loc(i)=h
% In maxstep:
% loc(e)=j, loc(a)= e, loc(n)=a, loc(i)=d, loc(h)=i, loc(m)=h, loc(o)= m, loc(k)=g, loc(c)=k, loc(b)=c, loc(l)=b.

block(a;b;c;d;e;f;g;h;i;j;k;l;m;n;o).

% initial state
:- not on(
    m, table, 0;
    l, m, 0;
    a, l, 0;
    b, a, 0;
    c, b, 0;
    o, table, 0;
    n, o, 0;
    d, n, 0;
    e, d, 0;
    j, e, 0;
    k, j, 0;
    f, table, 0;
    g, f, 0;
    h, g, 0;
    i, h, 0
).

% goal state
:- not on(
    e, j, maxstep;
    a, e, maxstep;
    n, a, maxstep;
    i, d, maxstep;
    h, i, maxstep;
    m, h, maxstep;
    o, m, maxstep;
    k, g, maxstep;
    c, k, maxstep;
    b, c, maxstep;
    l, b, maxstep
).
