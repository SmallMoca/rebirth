let count = 1;
function incCount() {
  count += 1;
}

let testO = 'foo';
function changeTestO() {
  testO = Math.random();
}

module.exports = {
  count,
  incCount,
  testO,
  changeTestO,
};
