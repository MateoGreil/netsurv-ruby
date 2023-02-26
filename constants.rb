module NetSurv
  module Constants
    PORT = { tcp: 34_567, udp: 34_568 }.freeze
    CODES = {
      login: 1000,
      keep_alive: 1006
    }.freeze
    RETURN_CODES = {
      100 => 'Success',
      101 => 'Unknown error',
      102 => 'Version not supported',
      103 => 'Illegal request',
      104 => 'User has already logged in',
      105 => 'User is not logged in',
      106 => 'Username or Password is incorrect',
      107 => 'Insufficient permission',
      108 => 'Timeout',
      109 => 'Find failed, file not found',
      110 => 'Find success, returned all files',
      111 => 'Find success, returned part of files',
      112 => 'User already exists',
      113 => 'User does not exist',
      114 => 'User group already exists',
      115 => 'User group does not exist',
      116 => 'Reserved',
      117 => 'Message is malformed',
      118 => 'No PTZ protocol is set',
      119 => 'No query to file',
      120 => 'Configured to be enabled',
      121 => 'Digital channel is not enabled',
      150 => 'Success, device restart required',
      202 => 'User is not logged in',
      203 => 'Incorrect password',
      204 => 'User is illegal',
      205 => 'User is locked',
      206 => 'User is in the blacklist',
      207 => 'User already logged in',
      208 => 'Invalid input',
      209 => 'User already exists',
      210 => 'Object not found',
      211 => 'Object does not exist',
      212 => 'Account in use',
      213 => 'Permission table error',
      214 => 'Illegal password',
      215 => 'Password does not match',
      216 => 'Keep account number',
      502 => 'Illegal command',
      503 => 'Talk channel has ben opened',
      504 => 'Talk channel is not open',
      511 => 'Update started',
      512 => 'Update did not start',
      513 => 'Update data error',
      514 => 'Update failed',
      515 => 'Update succeeded ',
      521 => 'Failed to restore default config',
      522 => 'Device restart required',
      523 => 'Default config is illegal',
      602 => 'Application restart required',
      603 => 'System restart required',
      604 => 'Write file error',
      605 => 'Features are not supported',
      606 => 'Verification failed',
      607 => 'Configuration does not exist',
      608 => 'Configuration parsing error'
    }.freeze
    PACKET_HEADER_FORMAT = 'CCx2IIx2S_I'.freeze
    PACKET_TAIL_FORMAT = "\x0a\x00".freeze
  end
end
