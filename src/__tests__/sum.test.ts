
import { describe, expect, test } from '@jest/globals';
import { sum } from '../sum';

describe('sum module', () => {
  test('adds 1 + 2 to equal 3', () => {
    const a: number = 1;
    const b: number = 2;
    expect(sum(a, b)).toBe(3);
  });
});
