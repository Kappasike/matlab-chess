function [inbound] = is_inbound(r,c)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
inbound = r>0 && r<=8 && c>0 && c<=8;
end