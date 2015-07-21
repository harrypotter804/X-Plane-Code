clc
% for k = 1: 1: 10000
%     clc
%     qq =xplaneget
%     pause(0.5)
%
% end
clear

QPR = [];

for ii = 1: 1: 1000
    clc
    mm = xplaneget;
    
    %% angular velocity PQR
    
    q = 1;
    for i = 8: -1: 5
        pqr( q, 3 ) = mm( 3, i  );
        q = q +1;
    end
    
    p = 1;
    for i = 12: -1: 9
        pqr( p, 2 ) = mm( 3, i  );
        p = p +1;
    end    
    
    r = 1;
    for i = 16: -1: 13
        pqr( r, 1 ) = mm( 3, i  );
        r = r +1;
    end
    
    %% pitch,roll,heading
    
    p = 1;
    for i = 8: -1: 5
        prh( p, 3 ) = mm( 4, i  );
        p = p +1;
    end
    
    r = 1;
    for i = 12: -1: 9
        prh( r, 2 ) = mm( 4, i  );
        r = r +1;
    end    
    
    h = 1;
    for i = 16: -1: 13
        prh( h, 1 ) = mm( 4, i  );
        h = h +1;
    end    
    
    %%
    
    pqrbin = dec2bin( pqr,8 );
    prhbin = dec2bin( prh,8 );
    
    avQ = [ pqrbin( 9,: ) pqrbin( 10, : ) pqrbin( 11,: ) pqrbin( 12, : ) ];
    avP = [ pqrbin( 5,: ) pqrbin( 6, : ) pqrbin( 7,: ) pqrbin( 8, : ) ];
    avR = [ pqrbin( 1,: ) pqrbin( 2, : ) pqrbin( 3,: ) pqrbin( 4, : ) ];
    
    stateP = [ prhbin( 9,: ) prhbin( 10, : ) prhbin( 11,: ) prhbin( 12, : ) ];
    stateR = [ prhbin( 5,: ) prhbin( 6, : ) prhbin( 7,: ) prhbin( 8, : ) ];
    stateH = [ prhbin( 1,: ) prhbin( 2, : ) prhbin( 3,: ) prhbin( 4, : ) ];   

    Q = xplanetranslate( avQ );
    P = xplanetranslate( avP );
    R = xplanetranslate( avR );
    
    QPR = [ QPR ; Q P R ];
    
    Pitch = xplanetranslate( stateP );
    Roll = xplanetranslate( stateR );
    Heading = xplanetranslate( stateH );
    
    PRH = [ Pitch Roll Heading]
    
    csvwrite('QPR.csv',QPR)
    
    pause( 0.5 );
end