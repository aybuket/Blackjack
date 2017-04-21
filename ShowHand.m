function x=ShowHand(y,c)
if c==1
    switch y(1)
        case {2,3,4,5,6,7,8,9,10}
            fprintf('%g x',y(1));
        case {'A','K','Q','J'}
            fprintf('%s x',y(1));
    end
elseif c==2
    for k=1:length(y)
        switch y(k)
            case {2,3,4,5,6,7,8,9,10}
                fprintf('%g ',y(k));
            case {'A','K','Q','J'}
                fprintf('%s ',y(k));
        end
    end
end