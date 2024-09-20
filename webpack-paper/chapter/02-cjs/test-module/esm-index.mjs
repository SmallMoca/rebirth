console.log('start');

import { count, incCount } from './esm-a.mjs';
console.log('end');

console.log(count);
incCount();
console.log(count);

console.log(import.meta);
