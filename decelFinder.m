function decelEvents = decelFinder(fname, '-mat', Brake_Temp_FR, Brake_Temp_RR, User_1, User_2, Wheel_)
    load(fname);
    tline = fgetl(fid);
    decelEvents = tline;
end