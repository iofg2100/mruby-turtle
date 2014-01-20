
mruby-turtle
================

Command the turtle in mruby

Maps are saved in JSON format

![Screenshot](https://github.com/iofg2100/mruby-turtle/raw/master/screenshot.png)

```ruby
if turtle.feel(turtle.lastDir) == ''
  turtle.move(turtle.lastDir)
elsif turtle.feel(turtle.lastDir + 1) == ''
  turtle.move(turtle.lastDir + 1)
else
  4.times do |i|
    if turtle.feel(i) == ''
      turtle.move(i)
      break
    end
  end
end
```