solve(X) :-
    permutation([5, 4, 3, 2, 1], [SwimA, SwimB, SwimK, SwimD, SwimE]),
    permutation([5, 4, 3, 2, 1], [RunA, RunB, RunK, RunD, RunE]),
    permutation([5, 4, 3, 2, 1], [FenceA, FenceB, FenceK, FenceD, FenceE]),
    permutation([5, 4, 3, 2, 1], [ShootA, ShootB, ShootK, ShootD, ShootE]),
    permutation([5, 4, 3, 2, 1], [RideA, RideB, RideK, RideD, RideE]),

    % У Колоколова одинакое место по 4 видам спорта
    permutation([A, A, A, A, _], [SwimK, RunK, FenceK, ShootK, RideK]),

    % У Емельянова первое место в соревнованиях по стрельбе
    ShootE =:= 6 - 1,
    
    % У Емельянова третье место в соревнованиях по верховной стрельбе
    RideE =:= 6 - 3,

    % Сумма очков Ачкасова 24 
    PointsA is SwimA + RunA + FenceA + ShootA + RideA,
    PointsA = 24,

    % Вспомним про места на соревнованиях
    % Ачкасов Боровский Колоколов Дикушин Емельянов
    % 1 2 3 4 5

    PointsB is SwimB + RunB + FenceB + ShootB + RideB,
    PointsK is SwimK + RunK + FenceK + ShootK + RideK,
    PointsD is SwimD + RunD + FenceD + ShootD + RideD,
    PointsE is SwimE + RunE + FenceE + ShootE + RideE,

    PointsA > PointsB, PointsB > PointsK, PointsK > PointsD, PointsD > PointsE,

    X is 6 - ShootB.  