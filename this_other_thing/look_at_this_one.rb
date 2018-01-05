

#my solution does not use any advanced work such as classes or procs, but I could have used hashes
def zero(operation= 0)
 case operation[0]
 when '*'
   0 * operation[1]
 when '/'
   0 / operation[1]
 when '+'
   0 + operation[1]
 when '-'
   0 - operation[1]
 else
   0
 end
end
def one(operation = 1)
case operation[0]
 when '*'
   1 * operation[1]
 when '/'
   1 / operation[1]
 when '+'
   1 + operation[1]
 when '-'
   1 - operation[1]
 else
   1
 end
end
def two(operation = 2)
 case operation[0]
 when '*'
   2 * operation[1]
 when '/'
   2 / operation[1]
 when '+'
   2 + operation[1]
 when '-'
   2 - operation[1]
 else
   2
 end
end
def three(operation = 3)
 case operation[0]
 when '*'
   3 * operation[1]
 when '/'
   3 / operation[1]
 when '+'
   3 + operation[1]
 when '-'
   3 - operation[1]
 else
   3
 end
end
def four(operation = 4)
 case operation[0]
 when '*'
   4 * operation[1]
 when '/'
   4 / operation[1]
 when '+'
   4 + operation[1]
 when '-'
   4 - operation[1]
 else
   4
 end
end
def five(operation = 5)
 case operation[0]
 when '*'
   5 * operation[1]
 when '/'
   5 / operation[1]
 when '+'
   5 + operation[1]
 when '-'
   5 - operation[1]
 else
   5
 end
end
def six(operation = 6)
 case operation[0]
 when '*'
   6 * operation[1]
 when '/'
   6 / operation[1]
 when '+'
   6 + operation[1]
 when '-'
   6 - operation[1]
 else
   6
 end
end
def seven(operation = 7)
 case operation[0]
 when '*'
   7 * operation[1]
 when '/'
   7 / operation[1]
 when '+'
   7 + operation[1]
 when '-'
   7 - operation[1]
 else
   7
 end
end
def eight(operation = 8)
 case operation[0]
 when '*'
   8 * operation[1]
 when '/'
   8 / operation[1]
 when '+'
   8 + operation[1]
 when '-'
   8 - operation[1]
 else
   8
 end
end
def nine(operation = 9)
 case operation[0]
 when '*'
   9 * operation[1]
 when '/'
   9 / operation[1]
 when '+'
   9 + operation[1]
 when '-'
   9 - operation[1]
 else
   9
 end
end
def plus(value)
   ['+', value]
end
def minus(value)
   ['-', value]
end
def times(value)
   ['*', value]
end
def divided_by(value)
  ['/', value.to_f]
end






#other solutions to learn from on this one, stuff I haven't learned
class Object
  %w[zero one two three four five six seven eight nine].each_with_index do |name, n|
    define_method(name) do |args = nil|
      args ? n.send(*args) : n.to_f
    end
  end
  
  %w[plus + minus - times * divided_by /].each_slice(2) do |name, symbol|
    define_method(name) do |n|
      [symbol, n]
    end
  end
end

7 similar code variations are grouped with this one
Show Variations

        Best Practices56
        Clever94
    4
    Fork
    Compare with your solution
    Link

mcls

def noop
  ->(n) { n }
end

module MathAndStuff
  %w(zero one two three four five six seven eight nine).each_with_index do |num, i|
    define_method num do |op=noop|
      op.call(i)  
    end
  end
  
  Hash[*%w(plus + minus - times * divided_by /)].each do |m, op|
     define_method m do |*args|
      ->(right, left) { left.to_f.send(op, right) }.curry.call(*args)
    end
  end
end
include MathAndStuff

        Best Practices4
        Clever3
    1
    Fork
    Compare with your solution
    Link

animatedgif

class Operation
  def initialize(num, op)
    @num = num
    @op = op
  end
  
  def perform(num)
    num.send(@op, @num.to_f)
  end
end

NUMBER_WORDS = %w(zero one two three four five six seven eight nine)
OPERATION_WORDS = {
  :"+" => "plus",
  :"-" => "minus",
  :"*" => "times",
  :"/" => "divided_by"
}

NUMBER_WORDS.each_with_index do |word, num|
  define_method word.to_sym do |operation = nil|
    operation ? operation.perform(num) : num
  end
end

OPERATION_WORDS.each do |method, word|
  define_method word.to_sym do |num|
    Operation.new(num, method)
  end
end

        Best Practices3
        Clever0
    0
    Fork
    Compare with your solution
    Link

ivanyv, sharefiles, Dante, chenge, kpierceBI610

{ zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9 }.each do |m, n|
  Object.send(:define_method, m) { |proc = nil| proc ? proc.call(n) : n }
end
{ plus: :+, minus: :-, times: :*, divided_by: :/ }.each do |m, o|
  Object.send(:define_method, m) { |b| Proc.new { |a| a.send(o, b * 1.0) } }
end

1 similar code variation is grouped with this one
Show Variations

        Best Practices3
        Clever17
    1
    Fork
    Compare with your solution
    Link

nielsbuus, SnowDeveloper

def zero(operation_tuple = nil)
  abstract_number(0, operation_tuple)
end

def one(operation_tuple = nil)
  abstract_number(1, operation_tuple)
end

def two(operation_tuple = nil)
  abstract_number(2, operation_tuple)
end

def three(operation_tuple = nil)
  abstract_number(3, operation_tuple)
end

def four(operation_tuple = nil)
  abstract_number(4, operation_tuple)
end

def five(operation_tuple = nil)
  abstract_number(5, operation_tuple)
end

def six(operation_tuple = nil)
  abstract_number(6, operation_tuple)
end

def seven(operation_tuple = nil)
  abstract_number(7, operation_tuple)
end

def eight(operation_tuple = nil)
  abstract_number(8, operation_tuple)
end

def nine(operation_tuple = nil)
  abstract_number(9, operation_tuple)
end

def abstract_number(n, operation_tuple)
  if operation_tuple
    n.public_send(*operation_tuple)
  else
    n
  end
end

def plus(value)
  [:+, value]
end

def minus(value)
  [:-, value]
end

def times(value)
  [:*, value]
end

def divided_by(value)
  [:/, value.to_f]
end

1 similar code variation is grouped with this one
Show Variations

        Best Practices2
        Clever0
    0
    Fork
    Compare with your solution
    Link

d2au

Nums = [:zero,:one,:two,:three,:four,:five,:six,:seven,:eight,:nine]
Ops = {:plus => :+, :minus => :-, :times => :*, :divided_by => :/}

class Op
  def initialize op, right
    @op, @right = op, right
  end
  def calc left
    [left, @right.to_f].inject(Ops[@op])
  end
end

def method_missing m, *args, &blk
  if Nums.include? m
    if args.count == 1
      args.first.calc Nums.index m
    else 
      Nums.index m
    end
  elsif Ops.keys.include? m
    Op.new m, args.first
  else 
    super
  end
end

        Best Practices2
        Clever2
    0
    Fork
    Compare with your solution
    Link

vetalpaprotsky

%w[zero one two three four five six seven eight nine].each_with_index do |name, n|
  define_method(name) do |a = n|
     a == n ? a : n.to_f.method(a[0]).call(a[1])
  end
end
actions = [:+, :-, :*, :/]
%w[plus minus times divided_by].each_with_index do |name, i|
  define_method(name) do |n|
    [actions[i], n]
  end
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

lambda4fun

[:zero, :one, :two, :three, :four, :five, :six, :seven, :eight, :nine].each_with_index do |sym, i|
  define_method(sym) do |*args|
    args.empty? ? i : args.first.call(i)
  end
end

def plus(rhs)       -> (lhs) { lhs + rhs } end
def minus(rhs)      -> (lhs) { lhs - rhs } end
def times(rhs)      -> (lhs) { lhs * rhs } end
def divided_by(rhs) -> (lhs) { lhs / rhs.to_f } end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

artemuk

@numbers = { zero: "0.0", one: "1.0", two: "2.0", three: "3.0", four: "4.0",
             five: "5.0", six: "6.0", seven: "7.0", eight: "8.0", nine: "9.0" }
@operations = { plus: "+", minus: "-", times: "*", divided_by: "/"}

def method_missing(name, *args)
  @numbers.member?(name) ?
      instance_eval(@numbers[name] + args[0].to_s) :
      @operations[name] + args[0].to_s
end

        Best Practices1
        Clever1
    0
    Fork
    Compare with your solution
    Link

cwheart

%w(zero one two three four five six seven eight nine).each_with_index do |name, index|
  define_method(name) do |proc = nil|
    proc.nil? ? index : proc.call(index)
  end
end


def times(right)
  Proc.new {|left| left * right }
end
def plus(right)
  Proc.new {|left| left + right }
end
def minus(right)
  Proc.new {|left| left - right }
end
def divided_by(right)
  Proc.new {|left| left.to_f / right }
end

        Best Practices1
        Clever1
    0
    Fork
    Compare with your solution
    Link

acarl005

{ zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9 }
.each do |name, val|
  define_method(name) { |op = '+ 0'|
    eval("#{val} #{op}")
  }
end

{ plus: '+', minus: '-', times: '*', divided_by: '/' }
.each do |name, op|
  define_method(name) { |n|
    "#{op} #{n.to_f}"
  }
end

        Best Practices1
        Clever1
    0
    Fork
    Compare with your solution
    Link

hakanensari

%i(zero one two three four five six seven eight nine).each_with_index do |mth, i|
  define_method(mth) { |stack=nil| stack ? i.send(*stack) : i }
end

def plus(v); [:+, v]; end
def minus(v); [:-, v]; end
def times(v); [:*, v]; end
def divided_by(v); [:fdiv, v]; end

        Best Practices1
        Clever1
    0
    Fork
    Compare with your solution
    Link

mchagas

def zero(m = nil)
  return 0 unless m
  op, num = m
  0.to_f.send(op.to_sym, num.to_f)
end

def one(m = nil)
  return 1 unless m
  op, num = m
  1.to_f.send(op.to_sym, num.to_f)
end

def two(m = nil)
  return 2 unless m
  op, num = m
  2.to_f.send(op.to_sym, num.to_f)
end

def three(m = nil)
  return 3 unless m
  op, num = m
  3.to_f.send(op.to_sym, num.to_f)
end

def four(m = nil)
  return 4 unless m
  op, num = m
  4.to_f.send(op.to_sym, num.to_f)
end

def five(m = nil)
  return 5 unless m
  op, num = m
  5.to_f.send(op.to_sym, num.to_f)
end

def six(m = nil)
  return 6 unless m
  op, num = m
  6.to_f.send(op.to_sym, num.to_f)
end

def seven(m = nil)
  return 7 unless m
  op, num = m
  7.to_f.send(op.to_sym, num.to_f)
end

def eight(m = nil)
  return 8 unless m
  op, num = m
  8.to_f.send(op.to_sym, num.to_f)
end

def nine(m = nil)
  return 9 unless m
  op, num = m
  9.to_f.send(op.to_sym, num.to_f)
end

def divided_by(m)
  return '/', m
end

def plus(m)
  return '+', m
end

def minus(m)
  return '-', m
end

def times(m)
  return '*', m
end

        Best Practices1
        Clever1
    0
    Fork
    Compare with your solution
    Link

Alien-AV

def zero(args=nil)
  args ? 0.send(args[0],args[1]) : 0
end
def one(args=nil)
  args ? 1.send(args[0],args[1]) : 1
end
def two(args=nil)
  args ? 2.send(args[0],args[1]) : 2
end
def three(args=nil)
  args ? 3.send(args[0],args[1]) : 3
end
def four(args=nil)
  args ? 4.send(args[0],args[1]) : 4
end
def five(args=nil)
  args ? 5.send(args[0],args[1]) : 5
end
def six(args=nil)
  args ? 6.send(args[0],args[1]) : 6
end
def seven(args=nil)
  args ? 7.send(args[0],args[1]) : 7
end
def eight(args=nil)
  args ? 8.send(args[0],args[1]) : 8
end
def nine(args=nil)
  args ? 9.send(args[0],args[1]) : 9
end
def plus(val)
  return :+,val
end
def minus(val)
  return :-,val
end
def times(val)
  return :*,val
end
def divided_by(val)
  return :/,val
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

jeffdurand

def zero(funct=nil)
  funct ? funct.call(0) : ->(){ 0 }
end
def one(funct=nil)
  funct ? funct.call(1) : ->(){ 1 }
end
def two(funct=nil)
  funct ? funct.call(2) : ->(){ 2 }
end
def three(funct=nil)
  funct ? funct.call(3) : ->(){ 3 }
end
def four(funct=nil)
  funct ? funct.call(4) : ->(){ 4 }
end
def five(funct=nil)
  funct ? funct.call(5) : ->(){ 5 }
end
def six(funct=nil)
  funct ? funct.call(6) : ->(){ 6 }
end
def seven(funct=nil)
  funct ? funct.call(7) : ->(){ 7 }
end
def eight(funct=nil)
  funct ? funct.call(8) : ->(){ 8 }
end
def nine(funct=nil)
  funct ? funct.call(9) : ->(){ 9 }
end
def plus(funct)
  ->(numb){ funct.call + numb }
end
def minus(funct)
  ->(numb){ numb - funct.call }
end
def times(funct)
  ->(numb){ funct.call * numb }
end
def divided_by(funct)
  ->(numb){ numb.to_f / funct.call.to_f }
end

        Best Practices0
        Clever1
    0
    Fork
    Compare with your solution
    Link

kaffepanna

NUMBERS = { 0 => :zero, 1 => :one, 2 => :two, 3 => :three, 4 => :four,
            5 => :five, 6 => :six, 7 => :seven, 8 => :eight, 9 => :nine }

NUMBERS.each_pair do |key, value|
  define_method(value) do |*args|
    if args.length > 0
      operator, operand = args.first
      return key.send(operator, operand)
    end
    key
  end
end

def plus arg
  [:+, arg]
end
def minus arg
  [:-, arg]
end
def times arg
  [:*, arg]
end
def divided_by arg
  [:/, arg.to_f]
end

        Best Practices0
        Clever1
    0
    Fork
    Compare with your solution
    Link

chian yee

def zero(oper = false)
  oper ? 0.send(*oper) : 0.0
end
def one(oper = false)
  oper ? 1.send(*oper) : 1.0
end
def two(oper = false)
  oper ? 2.send(*oper) : 2.0
end
def three(oper = false)
  oper ? 3.send(*oper) : 3.0
end
def four(oper = false)
  oper ? 4.send(*oper) : 4.0
end
def five(oper = false)
  oper ? 5.send(*oper) : 5.0
end
def six(oper = false)
  oper ? 6.send(*oper) : 6.0
end
def seven(oper = false)
  oper ? 7.send(*oper) : 7.0
end
def eight(oper = false)
  oper ? 8.send(*oper) : 8.0
end
def nine(oper = false)
  oper ? 9.send(*oper) : 9.0
end
def plus(num)
  ["+", num]
end
def minus(num)
  ["-", num]
end
def times(num)
  ["*", num]
end
def divided_by(num)
  ["/", num]
end

        Best Practices0
        Clever1
    0
    Fork
    Compare with your solution
    Link

njohnson7

def zero(right = '*1.0')
  eval("0 #{right}")
end
def one(right = '*1.0')
  eval("1 #{right}")
end
def two(right = '*1.0')
  eval("2 #{right}")
end
def three(right = '*1.0')
  eval("3 #{right}")
end
def four(right = '*1.0')
  eval("4 #{right}")
end
def five(right = '*1.0')
  eval("5 #{right}")
end
def six(right = '*1.0')
  eval("6 #{right}")
end
def seven(right = '*1.0')
  eval("7 #{right}")
end
def eight(right = '*1.0')
  eval("8 #{right}")
end
def nine(right = '*1.0')
  eval("9 #{right}")
end
def plus(num)
  "+ #{num}"
end
def minus(num)
  "- #{num}"
end
def times(num)
  "* #{num}"
end
def divided_by(num)(num)
  "/ #{num}"
end

        Best Practices0
        Clever1
    0
    Fork
    Compare with your solution
    Link

HaoscyonKitsune

#Well I tried... I know it's not the best but I got a bit confused and it works.
def zero(z = nil)
if z == nil then return 0 end
if z[0] == "+" then return z[1] end
if z[0] == "-" then return 0 - z[1] end
if z[0] == "*" then return 0 end
if z[0] == "/" then return 0.00 end
end
def one(z = nil)
if z == nil then return 1 end
if z[0] == "+" then return 1+z[1] end
if z[0] == "-" then return 1-z[1] end
if z[0] == "*" then return 1*z[1] end
if z[0] == "/" then return 1.00/z[1] end
end
def two(z = nil)
if z == nil then return 2 end
if z[0] == "+" then return 2+z[1] end
if z[0] == "-" then return 2-z[1] end
if z[0] == "*" then return 2*z[1] end
if z[0] == "/" then return 2.00/z[1] end
end
def three(z = nil)
if z == nil then return 3 end
if z[0] == "+" then return 3+z[1] end
if z[0] == "-" then return 3-z[1] end
if z[0] == "*" then return 3*z[1] end
if z[0] == "/" then return 3.00/z[1] end
end
def four(z = nil)
if z == nil then return 4 end
if z[0] == "+" then return 4+z[1] end
if z[0] == "-" then return 4-z[1] end
if z[0] == "*" then return 4*z[1] end
if z[0] == "/" then return 4.00/z[1] end
end
def five(z = nil)
if z == nil then return 5 end
if z[0] == "+" then return 5+z[1] end
if z[0] == "-" then return 5-z[1] end
if z[0] == "*" then return 5*z[1] end
if z[0] == "/" then return 5.00/z[1] end
end
def six(z = nil)
if z == nil then return 6 end
if z[0] == "+" then return 6+z[1] end
if z[0] == "-" then return 6-z[1] end
if z[0] == "*" then return 6*z[1] end
if z[0] == "/" then return 6.00/z[1] end
end
def seven(z = nil)
if z == nil then return 7 end
if z[0] == "+" then return 7+z[1] end
if z[0] == "-" then return 7-z[1] end
if z[0] == "*" then return 7*z[1] end
if z[0] == "/" then return 7.00/z[1] end
end
def eight(z = nil)
if z == nil then return 8 end
if z[0] == "+" then return 8+z[1] end
if z[0] == "-" then return 8-z[1] end
if z[0] == "*" then return 8*z[1] end
if z[0] == "/" then return 8.00/z[1] end
end
def nine(z = nil)
if z == nil then return 9 end
if z[0] == "+" then return 9+z[1] end
if z[0] == "-" then return 9-z[1] end
if z[0] == "*" then return 9*z[1] end
if z[0] == "/" then return 9.00/z[1] end
end
def plus(y)
return ["+" , y]
end
def minus(y)
return ["-" , y]
end
def times(y)
return ["*" , y]
end
def divided_by(y)
return ["/" , y]
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

gstokkink

def zero arg = nil
  arg ? arg.(0) : 0
end
def one arg = nil
  arg ? arg.(1) : 1
end
def two arg = nil
  arg ? arg.(2) : 2
end
def three arg = nil
  arg ? arg.(3) : 3
end
def four arg = nil
  arg ? arg.(4) : 4
end
def five arg = nil
  arg ? arg.(5) : 5
end
def six arg = nil
  arg ? arg.(6) : 6
end
def seven arg = nil
  arg ? arg.(7) : 7
end
def eight arg = nil
  arg ? arg.(8) : 8
end
def nine arg = nil
  arg ? arg.(9) : 9
end
def plus op
  -> (x) { x + op }
end
def minus op
  -> (x) { x - op }
end
def times op
  -> (x) { x * op }
end
def divided_by op
  -> (x) { x.to_f / op.to_f }
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

robturtle

class Object
  %w[zero one two three four five six seven eight nine].each_with_index do |name, n|
    define_method(name) do |args = nil|
      args ? n.send(*args) : n
    end
  end
  
  %w[times * minus - plus + divided_by fdiv].each_slice(2) do |name, symbol|
    define_method(name) do |n|
      [symbol, n]
    end
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

santiaro90

nums = [:zero, :one, :two, :three, :four, :five, :six, :seven, :eight, :nine]
operators = Hash[plus: :+, minus: :-, times: :*, divided_by: :/]

nums.each_with_index do |m, a|
  self.send(:define_method, m) do |b = nil|
    return a unless b && b.respond_to?(:call)
    b.call(a)
  end
end

operators.each do |m, op|
  self.send(:define_method, m) do |b|
    ->(a) { a.to_f.send(op, b) }
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

rpass

def proc_if_proc(a_proc, arg)
  a_proc.nil? ? arg : a_proc.call(arg)  
end
def zero(a_proc = nil)
  proc_if_proc(a_proc, 0)
end
def one(a_proc = nil)
  proc_if_proc(a_proc, 1)
end
def two(a_proc = nil)
  proc_if_proc(a_proc, 2)
end
def three(a_proc = nil)
  proc_if_proc(a_proc, 3)
end
def four(a_proc = nil)
  proc_if_proc(a_proc, 4)
end
def five(a_proc = nil)
  proc_if_proc(a_proc, 5)
end
def six(a_proc = nil)
  proc_if_proc(a_proc, 6)
end
def seven(a_proc = nil)
  proc_if_proc(a_proc, 7)
end
def eight(a_proc = nil)
  proc_if_proc(a_proc, 8)
end
def nine(a_proc = nil)
  proc_if_proc(a_proc, 9)
end
def plus(operand_2)
  Proc.new {|op1| op1 + operand_2}
end
def minus(operand_2)
  Proc.new {|op1| op1 - operand_2}
end
def times(operand_2)
  Proc.new {|op1| op1 * operand_2}
end
def divided_by(operand_2)
  Proc.new {|op1| op1.to_f / operand_2}
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

kmic1986

def zero(p = 0)
  if p == 0
    return '0.0'
  else
    string = '0.0' + p
    eval string
  end
end

def one(p = 1)
  if p == 1
    return '1.0'
  else
    string = '1.0' + p
    eval string
  end
end

def two(p = 2)
  if p == 2
    return '2.0'
  else
    string = '2.0' + p
    eval string
  end
end

def three(p = 3)
  if p == 3
    return '3.0'
  else
    string = '3.0' + p
    eval string
  end
end

def four(p = 4)
  if p == 4
    return '4.0'
  else
    string = '4.0' + p
    eval string
  end
end

def five(p = 5)
  if p == 5
    return '5.0'
  else
    string = '5.0' + p
    eval string
  end
end

def six(p = 6)
  if p == 6
    return '6.0'
  else
    string = '6.0' + p
    eval string
  end
end

def seven(p = 7)
  if p == 7
    return '7.0'
  else
    string = '7.0' + p
    eval string
  end
end

def eight(p = 8)
  if p == 8
    return '8.0'
  else
    string = '8.0' + p
    eval string
  end
end

def nine(p = 9)
  if p == 9
    return '9.0'
  else
    string = '9.0' + p
    eval string
  end
end

def plus(p)
  ' + ' + p
end

def minus(p)
  ' - ' + p
end

def times(p)
  ' * ' + p
end

def divided_by(p)
  ' / ' + p
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

Bajinai

def zero(x = nil)
  return 0 if x.nil?
  check(0,x[1].to_i,x[0])
end
def one(x = nil)
  return 1 if x.nil?
  check(1,x[1].to_i,x[0])
end
def two(x = nil)
  return 2 if x.nil?
  check(2,x[1].to_i,x[0])
end
def three(x = nil)
  return 3 if x.nil?
  check(3,x[1].to_i,x[0])
end
def four(x = nil)
  return 4 if x.nil?
  check(4,x[1].to_i,x[0])
end
def five(x = nil)
  return 5 if x.nil?
  check(5,x[1].to_i,x[0])
end
def six(x = nil)
  return 6 if x.nil?
  check(6,x[1].to_i,x[0])
end
def seven(x = nil)
  return 7 if x.nil?
  check(7,x[1].to_i,x[0])
end
def eight(x = nil)
  return 8 if x.nil?
  check(8,x[1].to_i,x[0])
end
def nine(x = nil)
  return 9 if x.nil?
  check(9,x[1].to_i,x[0])
end

def check (num1, num2, op)
  case op
  when "+" ; plus(num1,num2)
  when "-" ; minus(num1,num2)
  when "*" ; times(num1,num2)
  when "/" ; divided_by(num1,num2)
  end
end

def plus(num,num2=nil)
  return "+#{num}" if num2.nil?
  return num + num2
end
def minus(num,num2=nil)
  return "-#{num}" if num2.nil?
  return num - num2
end
def times(num,num2=nil)
  return "*#{num}" if num2.nil?
  return num * num2
end
def divided_by(num,num2=nil)
  return "/#{num}" if num2.nil?
  return num.to_f / num2.to_f
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

jsears4585

def final(left, op, right)
  if op == '+' 
    left.to_f + right.to_f
  elsif op == '-'
    left.to_f - right.to_f
  elsif op == '*'
    left.to_f * right.to_f
  elsif op == '/'
    left.to_f / right.to_f
  end
end

def zero(p = nil) 
  p ? final(0, p[:op], p[:right]) : 0
end
def one(p = nil)
  p ? final(1, p[:op], p[:right]) : 1
end
def two(p = nil)
  p ? final(2, p[:op], p[:right]) : 2
end
def three(p = nil)
  p ? final(3, p[:op], p[:right]) : 3
end
def four(p = nil)
  p ? final(4, p[:op], p[:right]) : 4
end
def five(p = nil)
  p ? final(5, p[:op], p[:right]) : 5
end
def six(p = nil)
  p ? final(6, p[:op], p[:right]) : 6
end
def seven(p = nil)
  p ? final(7, p[:op], p[:right]) : 7
end
def eight(p = nil)
  p ? final(8, p[:op], p[:right]) : 8
end
def nine(p = nil)
  p ? final(9, p[:op], p[:right]) : 9
end

def plus(right)
  {op: '+', right: right}
end
def minus(right)
  {op: '-', right: right}
end
def times(right)
  {op: '*', right: right}
end
def divided_by(right)
  {op: '/', right: right}
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

7vs

numbers = {
  zero: 0, 
  one: 1,
  two: 2,
  three: 3,
  four: 4,
  five: 5,
  six: 6,
  seven: 7,
  eight: 8,
  nine: 9
  }
  
numbers.each do |key, value|
  define_method(key) do |arg=nil|
    return value if arg.nil?
    value.send(arg[0], arg[1])
  end
end

def plus(arg)
  [:+, arg]
end
def minus(arg)
  [:-, arg]
end
def times(arg)
  [:*, arg]
end
def divided_by(arg)
  [:/, arg.to_f]
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

chaitealatte

def zero(val = nil)
  eval("0 #{val}")
end
def one(val = nil)
  eval("1 #{val}")
end
def two(val = nil)
  eval("2 #{val}")
end
def three(val = nil)
  eval("3 #{val}")
end
def four(val = nil)
  eval("4 #{val}")
end
def five(val = nil)
  eval("5 #{val}")
end
def six(val = nil)
  eval("6 #{val}")
end
def seven(val = nil)
  eval("7 #{val}")
end
def eight(val = nil)
  eval("8 #{val}")
end
def nine(val = nil)
  eval("9 #{val}")
end
def plus(val)
  "+ #{val.to_f}"
end
def minus(val)
  "- #{val.to_f}"
end
def times(val)
  "* #{val.to_f}"
end
def divided_by(val)
  "/ #{val.to_f}"
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

brillante.wang@gmail.com

%w{zero one two three four five six seven eight nine}.each_with_index do |name, i|
  define_method(name) do |args = nil|
    args ? i.send(*args) : i.to_f 
  end
end

%w{plus + minus - times * divided_by /}.each_slice(2) do |name, operator|
  define_method(name) do |n|
    [operator, n]
  end
end

# zero(plus(four()))
# zero(plus(4))
# zero(["+", 4])
# 0.send("+", 4)
# 0.+(4)
# 4

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

brillante.wang@gmail.com

def zero(tuple = nil)
  tuple.nil? ? 0 : [0.0, tuple.last].reduce(tuple.first)
end
def one(tuple = nil)
  tuple.nil? ? 1 : [1.0, tuple.last].reduce(tuple.first)
end
def two(tuple = nil)
  tuple.nil? ? 2 : [2.0, tuple.last].reduce(tuple.first)
end
def three(tuple = nil)
  tuple.nil? ? 3 : [3.0, tuple.last].reduce(tuple.first)
end
def four(tuple = nil)
  tuple.nil? ? 4 : [4.0, tuple.last].reduce(tuple.first)
end
def five(tuple = nil)
  tuple.nil? ? 5 : [5.0, tuple.last].reduce(tuple.first)
end
def six(tuple = nil)
  tuple.nil? ? 6 : [6.0, tuple.last].reduce(tuple.first)
end
def seven(tuple = nil)
  tuple.nil? ? 7 : [7.0, tuple.last].reduce(tuple.first)
end
def eight(tuple = nil)
  tuple.nil? ? 8 : [8.0, tuple.last].reduce(tuple.first)
end
def nine(tuple = nil)
  tuple.nil? ? 9 : [9.0, tuple.last].reduce(tuple.first)
end
def plus(n)
  [:+, n]
end
def minus(n)
  [:-, n]
end
def times(n)
  [:*, n]
end
def divided_by(n)
  [:/, n]
end

p seven(times(five()))

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

giusepped

def zero(options=nil)
  if options.nil?
    0
  else
    options.call(0)
  end
end

def one(options=nil)
  if options.nil?
    1
  else
    options.call(1)
  end
end

def two(options=nil)
  if options.nil?
    2
  else
    options.call(2)
  end
end

def three(options=nil)
  if options.nil?
    3
  else
    options.call(3)
  end
end

def four(options=nil)
  if options.nil?
    4
  else
    options.call(4)
  end
end

def five(options=nil)
  if options.nil?
    5
  else
    options.call(5)
  end
end

def six(options=nil)
  if options.nil?
    6
  else
    options.call(6)
  end
end

def seven(options=nil)
  if options.nil?
    7
  else
    options.call(7)
  end
end

def eight(options=nil)
  if options.nil?
    8
  else
    options.call(8)
  end
end

def nine(options=nil)
  if options.nil?
    9
  else
    options.call(9)
  end  
end

def plus(other_num)
  lambda {|num| num + other_num }
end
def minus(other_num)
  lambda {|num| num - other_num }
end
def times(other_num)
  lambda {|num| num * other_num }
end
def divided_by(other_num)
  lambda {|num| num.to_f / other_num.to_f }
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

vonu

def reducer(n, ops)
  [n, ops.last].reduce(ops.first)
end

def zero(ops = nil)
  ops ? reducer(0, ops) : 0
end

def one(ops = nil)
  ops ? reducer(1, ops) : 1
end

def two(ops = nil)
  ops ? reducer(2, ops) : 2
end

def three(ops = nil)
  ops ? reducer(3, ops) : 3
end

def four(ops = nil)
  ops ? reducer(4, ops) : 4
end

def five(ops = nil)
  ops ? reducer(5, ops) : 5
end

def six(ops = nil)
  ops ? reducer(6, ops) : 6
end

def seven(ops = nil)
  ops ? reducer(7, ops) : 7
end

def eight(ops = nil)
  ops ? reducer(8, ops) : 8
end

def nine(ops = nil)
  ops ? reducer(9, ops) : 9
end

def plus(n)
  [:+, n]
end

def minus(n)
  [:-, n]
end

def times(n)
  [:*, n]
end

def divided_by(n)
  [:/, n.to_f]
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

ryanm1234

def zero(operation = nil)
  operation ? operation.call(0.0) : 0.0
end
def one(operation = nil)
 operation ? operation.call(1.0) : 1.0
end
def two(operation = nil)
  operation ? operation.call(2.0) : 2.0
end
def three(operation = nil)
 operation ? operation.call(3.0) : 3.0
end
def four(operation = nil)
  operation ? operation.call(4.0) : 4.0
end
def five(operation = nil)
  operation ? operation.call(5.0) : 5.0
end
def six(operation = nil)
  operation ? operation.call(6.0) : 6.0
end
def seven(operation = nil)
  operation ? operation.call(7.0) : 7.0
end
def eight(operation = nil)
  operation ? operation.call(8.0) : 8.0
end
def nine(operation = nil)
  operation ? operation.call(9.0) : 9.0
end
def plus(num2)
  Proc.new { |num1| num1 + num2 }
end
def minus(num2)
  Proc.new { |num1| num1 - num2 } 
end
def times(num2)
  Proc.new { |num1| num1 * num2 }
end
def divided_by(num2)
  Proc.new { |num1| num1 / num2 }
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

barnettjoe

NUMS = %w(zero one two three four five six seven eight nine)
OPS = {"plus" => :+, "minus" => :-, "times" => :*, "divided_by" => :fdiv}

NUMS.each do |num|
    define_method(num) do |a = nil|
      x = NUMS.index(num)
    a ? x.send(a[0], a[1]) : x
  end
end

OPS.keys.each do |op|
    define_method(op) do |n|
      [OPS[op], n]
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

cdunham1989

[:zero, :one, :two, :three, :four, :five, 
 :six, :seven, :eight, :nine].each.with_index do |method, index|
  define_method method do |function = nil|
    (function) ? function.call(index) : index
  end
end
 
[[:plus, :+], [:minus, :-], 
 [:times, :*], [:divided_by, :/]].each do |(method, action)|
  define_method method do |second_operand|
    ->(first_operand) { first_operand.to_f.send(action, second_operand.to_f) } 
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

peterfication

numbers = %w[zero one two three four five six seven eight nine]
numbers.each_with_index do |method, num|
  define_method method do |args = []|
    operand, number = args
    operand ? calculate(num, operand, number) : [operand, num]
  end
end

%i[plus minus times divided_by].each do |operand|
  define_method operand do |args = []|
    [operand, args[1]]
  end
end

def calculate(first, operand, second)
  case operand
  when :plus then first + second
  when :minus then first - second
  when :times then first * second
  when :divided_by then second.zero? ? 0 : first.to_f / second
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

peterfication

{
  zero: 0,
  one: 1,
  two: 2,
  three: 3,
  four: 4,
  five: 5,
  six: 6,
  seven: 7,
  eight: 8,
  nine: 9,
}.each do |method, num|
  define_method method do |args = []|
    operand, number = args
    operand ? calculate(num, operand, number) : [operand, num]
  end
end

[
  :plus,
  :minus,
  :times,
  :divided_by,
].each do |operand|
  define_method operand do |args = []|
    [operand, args[1]]
  end
end

def calculate(first, operand, second)
  case operand
  when :plus then first + second
  when :minus then first - second
  when :times then first * second
  when :divided_by then second == 0 ? 0 : first.to_f / second
  else
    nil
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

ahmetabdi

value_matrix = { "zero" => 0, 
                 "one" => 1,
                 "two" => 2,
                 "three" => 3,
                 "four" => 4,
                 "five" => 5,
                 "six" => 6,
                 "seven" => 7,
                 "eight" => 8,
                 "nine" => 9 }

value_matrix.each do |key, value|
  define_method(key.to_sym) do |method = nil|
    calculate(method, value)
  end
end

symbol_matrix = { "plus" => "+",
                  "minus" => "-",
                  "times" => "*",
                  "divided_by" => "/" }
                  
symbol_matrix.each do |key, value|
  define_method(key.to_sym) do |amount|
    "#{value} #{amount}.to_f"
  end
end

def calculate(method, value)
  method ? eval("#{value} #{method}") : value
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

bagdenia

def calculate(string)
  ar = string.split
  return string if ar.size !=3
  ar[0].to_f.send(ar[1], ar[2].to_f)
end

def zero(arg=nil)
  calculate("0.0 "+arg.to_s)
end

def one(arg=nil)
  calculate('1.0 ' + arg.to_s)
end
def two(arg=nil)
  calculate('2.0 ' + arg.to_s)
end
def three(arg=nil)
  calculate('3.0 ' + arg.to_s)
end
def four(arg=nil)
  calculate('4.0 ' + arg.to_s)
end
def five(arg=nil)
  calculate('5.0 ' + arg.to_s)
end
def six(arg=nil)
  calculate('6.0 ' + arg.to_s)
end
def seven(arg=nil)
 calculate('7.0 ' + arg.to_s)
end
def eight(arg=nil)
  calculate('8.0 ' + arg.to_s)
end
def nine(arg=nil)
  calculate('9.0 ' + arg.to_s)
end
def plus(arg=nil)
  calculate('+ ' + arg.to_s)
end
def minus(arg=nil)
  calculate('- ' + arg.to_s)
end
def times(arg=nil)
  calculate('* ' + arg.to_s)
end
def divided_by(arg=nil)
  calculate('/ ' + arg.to_s)
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

dagosi

def  evaluator(number, fn_param)
  if fn_param
    eval("#{number.to_f}#{fn_param}").to_f
  else
    number.to_f
  end
end

def zero(function = nil)
  evaluator(0, function)
end
def one(function = nil)
  evaluator(1, function)
end
def two(function = nil)
  evaluator(2, function)
end
def three(function = nil)
  evaluator(3, function)
end
def four(function = nil)
  evaluator(4, function)
end
def five(function = nil)
  evaluator(5, function)
end
def six(function = nil)
  evaluator(6, function)
end
def seven(function = nil)
  evaluator(7, function)
end
def eight(function = nil)
  evaluator(8, function)
end
def nine(function = nil)
  evaluator(9, function)
end
def plus(function = nil)
  function ? "+#{function}" : nil
end
def minus(function = nil)
  function ? "-#{function}" : nil
end
def times(function = nil)
  function ? "*#{function}" : nil
end
def divided_by(function = nil)
  function ? "/#{function}" : nil
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

serjmil

[:zero, :one, :two, :three, :four, :five, :six, :seven, :eight, :nine].
  each_with_index do |method_name, value|
    define_method(method_name) do |block = nil|
      block ? block.call(value) : value
    end
  end
  
def plus(b)
  -> (a) { a + b }
end
def minus(b)
  -> (a) { a - b }
end
def times(b)
  -> (a) { a * b }
end
def divided_by(b)
  -> (a) { a / b.to_f }
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

LeoXugu

class Object

  %w[zero one two three four five six seven eight nine].each_with_index do |digit, n|
    define_method(digit) do |args = nil|
      args ? n.send(*args) : n.to_f
    end
    
  end
  
  %w[plus + minus - times * divided_by /].each_slice(2) do |name, symbol|
    define_method(name) do |n|
      [symbol, n]
    end
  end
  
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

RashFever

def zero(n=nil)
  return 0 if n == nil
  eval("0.0" + n)
end
def one(n=nil)
  return 1 if n == nil
  eval("1.0" + n)
end
def two(n=nil)
  return 2 if n == nil
  eval("2.0" + n)
end
def three(n=nil)
  return 3 if n == nil
  eval("3.0" + n)
end
def four(n=nil)
  return 4 if n == nil
  eval("4.0" + n)
end
def five(n=nil)
  return 5 if n == nil
  eval("5.0" + n)
end
def six(n=nil)
  return 6 if n == nil
  eval("6.0" + n)
end
def seven(n=nil)
  return 7 if n == nil
  eval("7.0" + n)
end
def eight(n=nil)
  return 8 if n == nil
  eval("8.0" + n)
end
def nine(n=nil)
  return 9 if n == nil
  eval("9.0" + n)
end
def plus(n)
  "+" + n.to_s
end
def minus(n)
  "-" + n.to_s
end
def times(n)
  "*" + n.to_s
end
def divided_by(n)
  "/" + n.to_s
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

4ak.off

def zero(func=nil)
  return 0.0 if func.nil?
  return func[0].to_proc.call(0,func[1])
end
def one(func=nil)
  return 1.0 if func.nil?
  return func[0].to_proc.call(1,func[1])
end
def two(func=nil)
  return 2.0 if func.nil?
  return func[0].to_proc.call(2,func[1])
end
def three(func=nil)
  return 3.0 if func.nil?
  return func[0].to_proc.call(3,func[1])
end
def four(func=nil)
  return 4.0 if func.nil?
  return func[0].to_proc.call(4,func[1])
end
def five(func=nil)
  return 5.0 if func.nil?
  return func[0].to_proc.call(5,func[1])
end
def six(func=nil)
  return 6.0 if func.nil?
  return func[0].to_proc.call(6,func[1])
end
def seven(func=nil)
  return 7.0 if func.nil?
  return func[0].to_proc.call(7,func[1])
end
def eight(func=nil)
  return 8.0 if func.nil?
  return func[0].to_proc.call(8,func[1])
end
def nine(func=nil)
  return 9.0 if func.nil?
  return func[0].to_proc.call(9,func[1])
end
def plus(num)
  return [:+,num]
end
def minus(num)
  return [:-,num]
end
def times(num)
  return [:*,num]
end
def divided_by(num)
  return [:/,num]
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

Mustafaaytu

def zero(fonk = nil)
  fonk.nil? == true ? 0 : eval("0#{fonk}")
end
def one(fonk = nil)
  fonk.nil? == true ? 1 : eval("1#{fonk}")
end
def two(fonk = nil)
  fonk.nil? == true ? 2 : eval("2#{fonk}")
end
def three(fonk = nil)
  fonk.nil? == true ? 3 : eval("3#{fonk}")
end
def four(fonk = nil)
  fonk.nil? == true ? 4 : eval("4#{fonk}")
end 
def five(fonk = nil)
  fonk.nil? == true ? 5 : eval("5#{fonk}")
end
def six(fonk = nil)
  fonk.nil? == true ? 6 : eval("6#{fonk}")
end
def seven(fonk = nil)
  fonk.nil? == true ? 7 : eval("7#{fonk}")
end
def eight(fonk = nil)
  fonk.nil? == true ? 8 : eval("8#{fonk}")
end
def nine(fonk = nil)
  fonk.nil? == true ? 9 : eval("9#{fonk}")
end
def plus(fonk)
  "+#{fonk}"
end
def minus(fonk)
  "-#{fonk}"
end
def times(fonk)
  "*#{fonk}"
end
def divided_by(fonk)
  "/#{fonk.to_f}"
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

Luyakus


def divided_by num
  return ['/', num]
end

def plus num
  return ['+', num]
end

def minus num
  return ['-', num]
end

def times num
  return ['*', num]
end

nums = {one:1.0, two:2.0, three:3.0, four:4.0, five:5.0, six:6.0, seven:7.0, eight:8.0, nine:9.0, zero:0.0}
nums.each do |key, value|

  
  define_method key do |x = nil|
    return value unless x
    case x.first
      when '+' then value + x.last
      when '-' then value - x.last
      when '/' then value / x.last
      when '*' then value * x.last
    end
  end
end




        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

mormolis

def zero(*z)
  if z.size == 1
    return eval(("0"+z.to_s).delete("[").delete("]").delete("\"").delete("\\"))
  elsif z.size == 0
    0
  end
end
def one(*z)
if z.size == 1
    return eval(("1"+z.to_s).delete("[").delete("]").delete("\"").delete("\\"))
  elsif z.size == 0
    1
  end
end

def two(*z)
if z.size == 1
    return eval(("2"+z.to_s).delete("[").delete("]").delete("\"").delete("\\"))
  elsif z.size == 0
    2
  end
end

def three(*z)
if z.size == 1
    return eval(("3"+z.to_s).delete("[").delete("]").delete("\"").delete("\\"))
  elsif z.size == 0
    3
  end
end

def four(*z)
  if z.size == 1
    return eval(("4"+z.to_s).delete("[").delete("]").delete("\"").delete("\\"))
  elsif z.size == 0
    4
  end
end
def five(*z)
  if z.size == 1
    return eval(("5"+z.to_s).delete("[").delete("]").delete("\"").delete("\\"))
  elsif z.size == 0
    5
  end
end
def six(*z)
  if z.size == 1
    return eval(("6"+z.to_s).delete("[").delete("]").delete("\"").delete("\\"))
  elsif z.size == 0
    6
  end
end

def seven(*z)
  if z.size == 1
    return eval(("7"+z.to_s).delete("[").delete("]").delete("\"").delete("\\"))
  elsif z.size == 0
    7
  end
end

def eight(*z)
  if z.size == 1
    return eval(("8"+z.to_s).delete("[").delete("]").delete("\"").delete("\\"))
  elsif z.size == 0
    8
  end
end

def nine(*z)
  if z.size == 1
    return eval(("9"+z.to_s).delete("[").delete("]").delete("\"").delete("\\"))
  elsif z.size == 0
    9
  end
end

def plus(s)
  "+"+s.to_s
end
def minus(s)
  "-"+s.to_s
end
def times(s)
  "*"+s.to_s
end
def divided_by(s)
  "/"+s.to_s+".0"
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

ben-miller

[[0.0, 'zero'],
 [1.0, 'one'],
 [2.0, 'two'],
 [3.0, 'three'],
 [4.0, 'four'],
 [5.0, 'five'],
 [6.0, 'six'],
 [7.0, 'seven'],
 [8.0, 'eight'],
 [9.0, 'nine']].map do |number,name|
 define_method(name) do |ld=nil|
   ld ? ld.call(number) : -> (x,op) { op.call(x, number) }
 end
end

def plus(ld)
  -> (x) { ld.call(x, -> (a,b) { a+b }) }
end
def minus(ld)
  -> (x) { ld.call(x, -> (a,b) { a-b }) }
end
def times(ld)
  -> (x) { ld.call(x, -> (a,b) { a*b }) }
end
def divided_by(ld)
  -> (x) { ld.call(x, -> (a,b) { a/b }) }
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

danielittlewood

def zero(*args)
  if args==[] then return 0; else args[0].call(0); end
end
def one(*args)
  if args==[] then return 1; else args[0].call(1); end
end
def two(*args)
  if args==[] then return 2; else args[0].call(2); end
end
def three(*args)
  if args==[] then return 3; else args[0].call(3); end
end
def four(*args)
  if args==[] then return 4; else args[0].call(4); end
end
def five(*args)
  if args==[] then return 5; else args[0].call(5); end
end
def six(*args)
  if args==[] then return 6; else args[0].call(6); end
end
def seven(*args)
  if args==[] then return 7; else args[0].call(7); end
end
def eight(*args)
  if args==[] then return 8; else args[0].call(8); end
end
def nine(*args)
  if args==[] then return 9; else args[0].call(9); end
end
def plus(n)
  return lambda {|m| m+n}
end
def minus(n)
  return lambda {|m| m-n}
end
def times(n)
  return lambda {|m| m*n}
end
def divided_by(n)
  return lambda {|m| (m.to_f)/n}
end