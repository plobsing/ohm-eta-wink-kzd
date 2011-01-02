/* lib abstraction */
toProgramString = function (x) {
  return x.toProgramString();
}

/* winxed emulation */
string = function (x) {
    return '' + x;
}

/* ometa-optimizer */
JumpTable = function(choiceOp, choice) {
  this.choiceOp = choiceOp
  this.choices = {}
  this.add(choice)
}
JumpTable.prototype.add = function(choice) {
  var c = choice[0], t = choice[1]
  if (this.choices[c]) {
    if (this.choices[c][0] == this.choiceOp)
      this.choices[c].push(t)
    else
      this.choices[c] = [this.choiceOp, this.choices[c], t]
  }
  else
    this.choices[c] = t
}
JumpTable.prototype.toTree = function() {
  var r = ['JumpTable'], choiceKeys = ownPropertyNames(this.choices)
  for (var i = 0; i < choiceKeys.length; i += 1)
    r.push([choiceKeys[i], this.choices[choiceKeys[i]]])
  return r
}

