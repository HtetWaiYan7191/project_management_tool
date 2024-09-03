module CommonConcern 
    def random_color
    "#" + "%06x" % (rand * 0xffffff)
  end
end