// isIsogram tests
use StringUtils;

// all testcase should return false;
if  isIsogram('hello world') ||
  isIsogram('HeloWOrLd') ||
  isIsogram('Helo  ') {
    exit(1);
}

// all testcase should return true;
if !isIsogram('The'){
    exit(1);
}
