// isIP tests
use StringUtils;

// all testcase should return false;
if isIP(' 127.0.0.1 ') ||
    isIP('0.0.0.0 ') ||
    isIP(' 255.255.10.1') ||
    isIP('255. 255.10.1') ||
    isIP('0..0.0.0') ||
    isIP('255.255.10.1.') ||
    isIP('127-0-0-1') ||
    isIP('255,255,10,1') ||
    isIP('') ||
    isIP(' ') ||
    isIP('0_0_0_0') {
        exit(1);
    }

// all testcase should return true;
if !isIP('127.0.0.1') ||
    !isIP('0.0.0.0') ||
    !isIP('255.255.10.1') {
        exit(1);
    }