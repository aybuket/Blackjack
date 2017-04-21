function x=SumHand(y)
x=0;
for k=1:length(y)
    if y(k)+1==66
        if x+11<=21
            y(k)=11;
        else
            y(k)=1;
        end
    elseif y(k)+1==82 || y(k)+1==76 || y(k)+1==75 
        y(k)=10;
    end
    x=x+y(k);
end
