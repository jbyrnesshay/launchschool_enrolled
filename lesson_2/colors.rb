

# the method of colorizing cmdline output derived from answer by Ivan Black https://stackoverflow.com/questions/1489183/colorized-ruby-output?rq=1

TXT_COLORS = {
  'black': '30',
  'green': '32',
  'red': '31',
  'blue': '34',
  'cyan': '36',
  'gray': '37',
  'magenta': '35',
  'white': '1;37',
  'default': '39'
}

BG_COLORS = {
  'bg-black': '40',
  'bg-brown': '43',
  'bg-red': '41',
  'bg-blue': '44',
  'bg-cyan': '46',
  'bg-gray': '47',
  'bg-magenta': '45',
  'default': '49'
}

def txt_color(color)
  TXT_COLORS[color.to_sym]
end

def bg_color(color)
  BG_COLORS[color.to_sym]
end

# bold = 1 will embolden, bold = 0 results in normal weight
def colorize(string:, color:, bkgrnd: 'default', bold: 0)
  text = txt_color(color)
  background = bg_color(bkgrnd)
  "\033[#{bold};#{background};#{text}m#{string}\33[0m"
end
