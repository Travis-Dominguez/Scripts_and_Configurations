#!/bin/bash


fping -g 12.205.151.91/24 | cat >> ./results;
fping -g 15.199.151.91/24 | cat >> ./results;
fping -g 15.199.158.91/28 | cat >> ./results;
fping -g 15.199.141.91/28 | cat >> ./results;
fping -g 15.199.131.91/28 | cat >> ./results;
fping -g 15.199.121.91/28 | cat >> ./results;
fping -g 15.199.111.91/28 | cat >> ./results;
fping -g 15.199.100.91/28 | cat >> ./results;
fping -g 15.199.99.91/28 | cat >> ./results;
fping -g 15.199.98.91/28 | cat >> ./results;
fping -g 15.199.97.91/28 | cat >> ./results;
fping -g 15.199.96.91/28 | cat >> ./results;
fping -g 15.199.95.91/28 | cat >> ./results;
fping -g 15.199.94.91/28 | cat >> ./results;
fping -g 11.199.158.91/28 | cat >> ./results;
fping -g 167.172.144.11/32 | cat >> ./results;
fping -g 11.199.141.91/28 | cat >> ./results;
fping -g 11.199.131.91/28 | cat >> ./results;
fping -g 11.199.121.91/29 | cat >> ./results;
fping -g 11.199.111.91/28 | cat >> ./results;
fping -g 11.199.100.91/32 | cat >> ./results;
fping -g 11.199.99.91/24 | cat >> ./results;
fping -g 11.199.98.91/28 | cat >> ./results;
echo "finally done";


