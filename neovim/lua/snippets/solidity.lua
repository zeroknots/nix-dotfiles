local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s(';log', {
    t 'console2.log("',
    i(1),
    t '", ',
    i(2),
    t ');',
  }),

  s(';tilde', t '~'),

  s(';backtick', t '`'),

  s(';backticks', t '```'),

  s(';struct', {
    t 'struct ',
    i(1),
    t ' {',
    t { '', '\t' },
    i(2),
    t(';', { '', '}' }),
  }),

  s(';inheritdoc', {
    t { '/**', ' * @inheritdoc ' },
    i(1),
    t { '', ' */' },
  }),

  s(';blockComment', {
    t {
      '/*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/',
      '/*                       ',
    },
    i(1),
    t {
      '                   */',
      '/*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/',
    },
  }),

  s(';doc', {
    t { '/**', ' * @notice: ' },
    i(1),
    t { '', '\t * @dev: ' },
    i(2),
    t { '', '\t * @param ' },
    i(3),
    t { '', '\t * @param ' },
    i(4),
    t { '', '\t * @return ' },
    i(5),
    t { '', ' */' },
  }),

  s(';uint[2][]', {
    t 'uint256[2][] ',
    i(1),
    t ' ',
    i(2),
  }),

  s(';uint[2][]calldata', {
    t 'uint256[2][] calldata ',
    i(1),
  }),

  s(';uint[2][]memory', {
    t 'uint256[2][] memory ',
    i(1),
  }),

  s(';import*', {
    t 'import { ',
    i(1),
    t ' } from "',
    i(2),
    t '";',
  }),

  s(';importConsoleLog2', t 'import { console2 } from "forge-std/console2.sol";'),

  s(';importERC20', t 'import { IERC20 } from "forge-std/interfaces/IERC20.sol";'),

  s(';pragma', {
    t { '// SPDX-License-Identifier: MIT', 'pragma solidity ^0.8.23;' },
  }),

  s(';contract', {
    t 'contract ',
    i(1),
    t ' {',
    t { '', '\t' },
    i(2),
    t { '', '}' },
  }),

  s(';functionInternalReturn', {
    t 'function ',
    i(1),
    t '(',
    i(2),
    t ') ',
    i(3),
    t ' returns(',
    i(4),
    t ') {',
    t { '', '\t' },
    i(5),
    t { '', '}' },
  }),

  s(';functionInternal', {
    t 'function ',
    i(1),
    t '(',
    i(2),
    t ') ',
    i(3),
    t ' {',
    t { '', '\t' },
    i(4),
    t { '', '}' },
  }),

  s(';contractInherit', {
    t 'contract ',
    i(1),
    t ' is ',
    i(2),
    t ' {',
    t { '', '\t' },
    i(3),
    t { '', '}' },
  }),
}
