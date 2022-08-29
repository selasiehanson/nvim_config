//==============================================
// PIPES AND FLOWS
//==============================================

//Expects functions that take  only one argument or curried by default
function pipe() {
  const [head, ...fns]  = arguments;
  return fns.reduce((acc, f) => {
    return f(acc)
  }, head)
}


module.exports = {
  pipe
}
