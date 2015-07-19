

handle = File.open(ARGV[0], 'r')
input = handle.read
output = input

html = File.open(ARGV[1],'w+')
html.write(output)
html.rewind
handle.rewind
"#{input} (#{handle.readlines.count.to_s} lines) #{output}"
handle.close
html.close
