clear all;

samplerate = 800e3;
nyqistrate = samplerate/2;

Ws1 = 22e3/nyqistrate;
Wp1 = 30e3/nyqistrate;
Wp2 = 34e3/nyqistrate;
Ws2 = 42e3/nyqistrate;
Rp = 1;
Rs = 40;

% seems to be the best
[n, Wc] = cheb1ord([Wp1, Wp2], [Ws1, Ws2], Rp, Rs);
[b, a] = cheby1(n, Rp, Wc);

% does not work at all
%[n, Wc] = cheb2ord([Wp1, Wp2], [Ws1, Ws2], Rp, Rs);
%[b, a] = cheby2(n, Rp, Wc);

% performs badly
%[n, Wc] = ellipord([Wp1, Wp2], [Ws1, Ws2], Rp, Rs);
%[b, a] = ellip(n, Rp, Rs, Wc);

% big filter order - unpracticable
%[n, Wc] = buttord([Wp1, Wp2], [Ws1, Ws2], Rp, Rs);
%[b, a] = butter(n, Wc);

print_iir_filter_coef(b ,a);
