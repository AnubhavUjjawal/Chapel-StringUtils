use StringUtils;

// isEmail tests

// all testcase should return false;
if isEmail('name.site.com') ||
    isEmail('name@site') ||
    isEmail('name@site.') ||
    isEmail('me@foo.123') ||
    isEmail('me@foo.c') ||
    isEmail('me@foo.!!') ||
    isEmail('me@foo.___') ||
    isEmail('me@foo.toolongext') ||
    isEmail('me@#foo#.com') ||
    isEmail('me@foo!.com') ||
    isEmail('someone@[foo].com') ||
    isEmail('someone@SOMESITE.COM') ||
    isEmail('name@em..ail.net') {
    exit(1);
}

// all testcase should return true;
if (isEmail('me@foo.com') && 
    isEmail('name@gmail.com') &&
    isEmail('name2@gmail.com') &&
    isEmail('PeterParker@gmail.com') &&
    isEmail('first_name.last_name@yahoo.it') &&
    isEmail('foo@domamin.subdomain.com') &&
    isEmail('is1isEmail@domain.org') &&
    isEmail('UPPER_CASE_isEmail@somesite.com')) == false {
    exit(1);
}
